/* Syntaxic analyzer for Mini-Ada */

%{
  open Ast

  let check_same_identifiers i1 o2 = match o2 with
    | Some i2 when String.lowercase_ascii i1 <> String.lowercase_ascii i2 -> failwith ("Two different identifiers")
    | _ -> ()
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
    { procedure = i1; glob_decl = d; stmts = s }
  }
;

decl:
| TYPE; i = IDENT; SEMICOLON
  { Dtype i }
| TYPE; i1 = IDENT; IS; ACCESS; i2 = IDENT; SEMICOLON
  { Daccesstype (i1, i2) }
| TYPE; i = IDENT; IS; RECORD; f = field+; END; RECORD; SEMICOLON
  { Drecordtype (i, f) }
| i = separated_nonempty_list(COMMA, IDENT); COLON; t = stype; SEMICOLON
  { Dident (i, t, None) }
| i = separated_nonempty_list(COMMA, IDENT); COLON; t = stype; COLONEQ; e = expr; SEMICOLON
  { Dident (i, t, Some e) }
| PROCEDURE; i1 = IDENT; p = params?; IS; d = decl*; BEGIN; s = stmt+; END; o2 = IDENT?; SEMICOLON
  {
    check_same_identifiers i1 o2; 
    Dprocedure (i1, p, d, s)
  }
| FUNCTION; i1 = IDENT; p = params?; RETURN; t = stype; IS; d = decl*; BEGIN; s = stmt+; END; o2 = IDENT?; SEMICOLON
  {
    check_same_identifiers i1 o2;
    Dfunction (i1, p, t, d, s)
  }
;

stmt:
| a = access; COLONEQ; e = expr; SEMICOLON
  { Saccess (a, e) }
| i = IDENT; SEMICOLON
  { Sproccall i }
| i = IDENT; LPAR; e = separated_nonempty_list(COMMA, expr); RPAR; SEMICOLON
  { Sfuncall (i, e) }
| RETURN; e = expr?; SEMICOLON
  { Sreturn e }
| BEGIN; s = stmt+; END; SEMICOLON
  { Sblock s }
| IF; e = expr; THEN; s = stmt+; c = condition 
  { let (l1, l2) = match c with Sif (a, b) -> (a, b) | _ -> assert false in Sif ((e, s) :: l1, l2) }
| FOR; i = IDENT; IN; r = REVERSE?; e1 = expr; DOUBLEDOT; e2 = expr; LOOP; s = stmt+; END; LOOP; SEMICOLON
  { Sfor (i, (match r with Some _ -> true | _ -> false), e1, e2, s) }
| WHILE; e = expr; LOOP; s = stmt+; END; LOOP; SEMICOLON
  { Swhile (e, s) }
;

condition:
| END; IF; SEMICOLON
  { Sif ([], []) }
| ELSE; s = stmt+; END; IF; SEMICOLON
  { Sif ([], s) }
| ELSIF; e = expr; THEN; s = stmt+; c = condition
  { let (l1, l2) = match c with Sif (a, b) -> (a, b) | _ -> assert false in Sif ((e, s) :: l1, l2) }

expr:
| n = INT
  { Eint n }
| c = CHAR
  { Echar c }
| TRUE
  { Ebool true }
| FALSE
  { Ebool false }
| NULL
  { Enull }
| LPAR; e = expr; RPAR
  { e }
| a = access
  { Eaccess a }
| e1 = expr; AND; THEN; e2 = expr; %prec AND
  { Ebinop (e1, Bandthen, e2) }
| e1 = expr; OR; ELSE; e2 = expr; %prec OR
  { Ebinop (e1, Borelse, e2) }
| e1 = expr; o = binop; e2 = expr
  { Ebinop (e1, o, e2) }
| NOT; e = expr
  { Eneg e }
| SUB; e = expr %prec minus
  { Ebinop (Eint 0, Bsub, e) }
| NEW; i = IDENT
  { Enew i }
| i = IDENT; LPAR; e = separated_nonempty_list(COMMA, expr); RPAR
  { Ecall (i, e) }
| CHARVAL; LPAR; e = expr; RPAR
  { Echarval e }

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
  { (i, t) }

params:
| LPAR; p = separated_nonempty_list(SEMICOLON, param); RPAR
  { p }

param:
| i = separated_nonempty_list(COMMA, IDENT); COLON; m = mode?; t = stype
  { (i, m, t) }

(* TODO: test precedence here *)
mode:
| IN; OUT
  { Minout }
| IN
  { Min }

stype:
| i = IDENT
  { Tident i }
| ACCESS; i = IDENT 
  { Taccess i }

access:
| i = IDENT
  { Aident i }
| e = expr; DOT; i = IDENT
  { Arecord (e, i) }

