/*
 * Syntaxic analyzer for Mini-Ada
 */

%{
  open Ast
  open Lexing
  
  exception Different_idents of ident * loc
  
  let check_same_identifiers (i1, _) o2 = match o2 with
    | Some (i2, loc) when String.lowercase i1 <> String.lowercase i2 ->
      raise Error
    | _ -> ()

  let dummy_loc =
    { fp = Lexing.dummy_pos; lp = Lexing.dummy_pos }
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
  i1 = identifier; IS; d = decl*; BEGIN; s = stmt+; END; o2 = identifier?;
  SEMICOLON; EOF
  { 
    check_same_identifiers i1 o2;
    { main_name = i1; glob_decl = d; stmts = s }
  }
;

decl:
| TYPE; i = identifier; SEMICOLON
  { Dtype i, {fp = $startpos; lp = $endpos} }
| TYPE; i1 = identifier; IS; ACCESS; i2 = identifier; SEMICOLON
  { Daccesstype (i1, i2), {fp = $startpos; lp = $endpos} }
| TYPE; i = identifier; IS; RECORD; f = field+; END; RECORD; SEMICOLON
  { Drecordtype (i, List.fold_left ( @ ) [] f), {fp = $startpos; lp = $endpos} }
| i = separated_nonempty_list(COMMA, identifier); COLON; t = stype; SEMICOLON
  { Dident (i, t, None), {fp = $startpos; lp = $endpos} }
| i = separated_nonempty_list(COMMA, identifier); COLON; t = stype; COLONEQ;
  e = expr; SEMICOLON
  { Dident (i, t, Some e), {fp = $startpos; lp = $endpos} }
| PROCEDURE; i1 = identifier; p = params?; IS; d = decl*; BEGIN; s = stmt+; END;
  o2 = identifier?; SEMICOLON
  {
    check_same_identifiers i1 o2; 
    Dfunction (i1, (match p with Some l -> l | None -> []), 
               (STunit, dummy_loc), d, s), {fp = $startpos; lp = $endpos}
  }
| FUNCTION; i1 = identifier; p = params?; RETURN; t = stype; IS; d = decl*;
  BEGIN; s = stmt+; END; o2 = identifier?; SEMICOLON
  {
    check_same_identifiers i1 o2;
    Dfunction (i1, (match p with Some l -> l | None -> []), t, d, s),
      {fp = $startpos; lp = $endpos}
  }
;

stmt:
| a = access; COLONEQ; e = expr; SEMICOLON
  { Saccess (a, e), {fp = $startpos; lp = $endpos} }
| i = identifier; SEMICOLON
  { Scall (i, []), {fp = $startpos; lp = $endpos} }
| i = identifier; LPAR; e = separated_nonempty_list(COMMA, expr); RPAR;
  SEMICOLON
  { Scall (i, e), {fp = $startpos; lp = $endpos} }
| RETURN; e = expr?; SEMICOLON
  { Sreturn e, {fp = $startpos; lp = $endpos} }
| BEGIN; s = stmt+; END; SEMICOLON
  { Sblock s, {fp = $startpos; lp = $endpos} }
| IF; e = expr; THEN; s = stmt+; c = condition 
  { Sif (e, s, [c]), {fp = $startpos; lp = $endpos} }
| FOR; i = identifier; IN; r = REVERSE?; e1 = expr; DOUBLEDOT; e2 = expr;
  LOOP; s = stmt+; END; LOOP; SEMICOLON
  { Sfor (i, (match r with Some _ -> true | _ -> false), e1, e2, s),
    {fp = $startpos; lp = $endpos(e2)} }
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
| NEW; i = identifier 
  { Enew i, {fp = $startpos; lp = $endpos} }
| i = identifier; LPAR; e = separated_nonempty_list(COMMA, expr); RPAR
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
| i = separated_nonempty_list(COMMA, identifier); COLON; t = stype; SEMICOLON
  { List.map (fun x -> (x, t)) i }

params:
| LPAR; p = separated_nonempty_list(SEMICOLON, param); RPAR
  { List.fold_left ( @ ) [] p }

param:
| i = separated_nonempty_list(COMMA, identifier); COLON; m = mode?; t = stype
  { List.map (fun x -> (x, (match m with Some l -> l | None -> Min), t)) i }

identifier:
| i = IDENT
  { (i, {fp = $startpos; lp = $endpos}) }

mode:
| IN; OUT
  { Minout }
| IN
  { Min }

stype:
| i = identifier 
  { STident i, {fp = $startpos; lp = $endpos} }
| ACCESS; i = identifier 
  { STaccess i, {fp = $startpos; lp = $endpos} }

access:
| i = identifier 
  { Aident i, {fp = $startpos; lp = $endpos} }
| e = expr; DOT; i = identifier  
  { Arecord (e, i), {fp = $startpos; lp = $endpos} }
