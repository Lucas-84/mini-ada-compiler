
(* The type of tokens. *)

type token = 
  | WITH
  | WHILE
  | USE
  | TYPE
  | TRUE
  | THEN
  | SUB
  | STDLIB
  | SEMICOLON
  | RPAR
  | REVERSE
  | RETURN
  | REM
  | RECORD
  | PROCEDURE
  | OUT
  | OR
  | NULL
  | NOT
  | NEW
  | NEQ
  | MUL
  | LT
  | LPAR
  | LOOP
  | LE
  | IS
  | INT of (int)
  | IN
  | IF
  | IDENT of (string)
  | GT
  | GE
  | FUNCTION
  | FOR
  | FALSE
  | EQ
  | EOF
  | END
  | ELSIF
  | ELSE
  | DOUBLEDOT
  | DOT
  | DIV
  | COMMA
  | COLONEQ
  | COLON
  | CHARVAL
  | CHAR of (char)
  | BEGIN
  | AND
  | ADD
  | ACCESS

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val file: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.file)
