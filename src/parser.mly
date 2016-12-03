/* Syntaxic analyzer for Mini-Ada */

%{
  open Ast
  open Lexing

  let check_same_identifiers i1 o2 = match o2 with
    | Some i2 when String.lowercase_ascii i1 <> String.lowercase_ascii i2 -> failwith ("Two different identifiers")
    | _ -> ()

  let dummy_loc = {fp = Lexing.dummy_pos; lp = Lexing.dummy_pos}
%}

/* Token declaration */

%token ACCESS AND BEGIN ELSE ELSIF END FALSE FOR FUNCTION IF IN IS
%token LOOP NEW NOT NULL OR OUT PROCEDURE RECORD REM RETURN REVERSE THEN
%token TRUE TYPE USE WHILE WITH
%token STDLIB
%token COLON SEMICOLON COLONEQ COMMA
%token CHARVAL

%token LPAR RPAR
%token ADD SUB MUL DIV
%token EQ NEQ LE LT GE GT
%token DOT DOUBLEDOT

%token <string> IDENT
%token EOF
%token <int> INT
%token <char> CHAR

/* Token precedence */

//%nonassoc IF
%left OR
%left AND
%nonassoc NOT
%nonassoc EQ NEQ
%nonassoc GT GE LT LE
%left ADD SUB
%left MUL DIV REM
%nonassoc minus
%left DOT

/* Grammar entry point */
%start file

/* Type returned by the syntaxic analyzer */
%type <Ast.file> file

%%

/* Grammar rules */

file:
| WITH; STDLIB; SEMICOLON; USE; STDLIB; SEMICOLON; PROCEDURE;
  i1 = IDENT; IS; d = decl*; BEGIN; s = stmt+; END; o2 = IDENT?;
  SEMICOLON; EOF
  { 
    check_same_identifiers i1 o2;
    { main_name = i1; glob_decl = d; stmts = s }
  }
;

decl:
| TYPE; i = IDENT; SEMICOLON
  { Dtype i, {fp = $startpos; lp = $endpos} }
| TYPE; i1 = IDENT; IS; ACCESS; i2 = IDENT; SEMICOLON
  { Daccesstype (i1, i2), {fp = $startpos; lp = $endpos} }
| TYPE; i = IDENT; IS; RECORD; f = field+; END; RECORD; SEMICOLON
  { Drecordtype (i, List.fold_left ( @ ) [] f), {fp = $startpos; lp = $endpos} }
| i = separated_nonempty_list(COMMA, IDENT); COLON; t = stype; SEMICOLON
  { Dident (i, t, None), {fp = $startpos; lp = $endpos} }
| i = separated_nonempty_list(COMMA, IDENT); COLON; t = stype; COLONEQ; e = expr; SEMICOLON
  { Dident (i, t, Some e), {fp = $startpos; lp = $endpos} }
| PROCEDURE; i1 = IDENT; p = params?; IS; d = decl*; BEGIN; s = stmt+; END; o2 = IDENT?; SEMICOLON
  {
    check_same_identifiers i1 o2; 
    Dfunction (i1, (match p with Some l -> l | None -> []), STunit, d, s), {fp = $startpos; lp = $endpos}
  }
| FUNCTION; i1 = IDENT; p = params?; RETURN; t = stype; IS; d = decl*; BEGIN; s = stmt+; END; o2 = IDENT?; SEMICOLON
  {
    check_same_identifiers i1 o2;
    Dfunction (i1, (match p with Some l -> l | None -> []), t, d, s), {fp = $startpos; lp = $endpos}
  }
;

stmt:
| a = access; COLONEQ; e = expr; SEMICOLON
  { Saccess (a, e), {fp = $startpos; lp = $endpos} }
| i = IDENT; SEMICOLON
  { Scall (i, []), {fp = $startpos; lp = $endpos} }
| i = IDENT; LPAR; e = separated_nonempty_list(COMMA, expr); RPAR; SEMICOLON
  { Scall (i, e), {fp = $startpos; lp = $endpos} }
| RETURN; e = expr?; SEMICOLON
  { Sreturn e, {fp = $startpos; lp = $endpos} }
| BEGIN; s = stmt+; END; SEMICOLON
  { Sblock s, {fp = $startpos; lp = $endpos} }
| IF; e = expr; THEN; s = stmt+; c = condition 
  { Sif (e, s, [c]), {fp = $startpos; lp = $endpos} }
| FOR; i = IDENT; IN; r = REVERSE?; e1 = expr; DOUBLEDOT; e2 = expr; LOOP; s = stmt+; END; LOOP; SEMICOLON
  { Sfor (i, (match r with Some _ -> true | _ -> false), e1, e2, s), {fp = $startpos; lp = $endpos} }
| WHILE; e = expr; LOOP; s = stmt+; END; LOOP; SEMICOLON
  { Swhile (e, s), {fp = $startpos; lp = $endpos} }
;

condition:
| END; IF; SEMICOLON
  { Sblock [], {fp = $startpos; lp = $endpos} }
| ELSE; s = stmt+; END; IF; SEMICOLON
  { Sblock s, {fp = $startpos; lp = $endpos} }
| ELSIF; e = expr; THEN; s = stmt+; c = condition
  { Sif (e, s, [c]), {fp = $startpos; lp = $endpos} }

expr:
| n = INT
  { Eint n, {fp = $startpos; lp = $endpos} }
| c = CHAR
  { Echar c, {fp = $startpos; lp = $endpos} }
| TRUE
  { Ebool true, {fp = $startpos; lp = $endpos} }
| FALSE
  { Ebool false, {fp = $startpos; lp = $endpos} }
| NULL
  { Enull, {fp = $startpos; lp = $endpos} }
| LPAR; e = expr; RPAR
  { fst e, {fp = $startpos; lp = $endpos} }
| a = access
  { Eaccess a, {fp = $startpos; lp = $endpos} }
| e1 = expr; AND; THEN; e2 = expr; %prec AND
  { Ebinop (e1, Bandthen, e2), {fp = $startpos; lp = $endpos} }
| e1 = expr; OR; ELSE; e2 = expr; %prec OR
  { Ebinop (e1, Borelse, e2), {fp = $startpos; lp = $endpos} }
| e1 = expr; o = binop; e2 = expr
  { Ebinop (e1, o, e2), {fp = $startpos; lp = $endpos} }
| NOT; e = expr
  { Eneg e, {fp = $startpos; lp = $endpos} }
| SUB; e = expr %prec minus
  { Ebinop ((Eint 0, dummy_loc), Bsub, e), {fp = $startpos; lp = $endpos} }
| NEW; i = IDENT
  { Enew i, {fp = $startpos; lp = $endpos} }
| i = IDENT; LPAR; e = separated_nonempty_list(COMMA, expr); RPAR
  { Ecall (i, e), {fp = $startpos; lp = $endpos} }
| CHARVAL; LPAR; e = expr; RPAR
  { Echarval e, {fp = $startpos; lp = $endpos} }

%inline binop:
| EQ        { Beq }
| NEQ       { Bneq }
| LT        { Blt }
| LE        { Ble }
| GT        { Bgt }
| GE        { Bge }
| ADD       { Badd }
| SUB       { Bsub }
| MUL       { Bmul }
| DIV       { Bdiv }
| REM       { Brem }
| AND       { Band }
| OR        { Bor }

field:
| i = separated_nonempty_list(COMMA, IDENT); COLON; t = stype; SEMICOLON
  { List.map (fun x -> (x, t)) i }

params:
| LPAR; p = separated_nonempty_list(SEMICOLON, param); RPAR
  { List.fold_left ( @ ) [] p }

param:
| i = separated_nonempty_list(COMMA, IDENT); COLON; m = mode?; t = stype
  { List.map (fun x -> (x, (match m with Some l -> l | None -> Min), t)) i }

(* TODO: test precedence here *)
mode:
| IN; OUT
  { Minout }
| IN
  { Min }

stype:
| i = IDENT
  { STident i }
| ACCESS; i = IDENT 
  { STaccess i }

access:
| i = IDENT
  { Aident i }
| e = expr; DOT; i = IDENT
  { Arecord (e, i) }

