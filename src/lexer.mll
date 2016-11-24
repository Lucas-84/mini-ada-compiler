(* Lexical analyzer for Mini-Ada *)

{
  open Lexing
  open Parser

  (* Exception to raised to signal a lexical error *)
  exception Lexing_error of string

  let keywords = [
    "access", ACCESS; "and", AND; "begin", BEGIN; "else", ELSE; "elsif", ELSIF;
    "end", END; "false", FALSE; "for", FOR; "function", FUNCTION; "if", IF;
    "in", IN; "is", IS; "loop", LOOP; "new", NEW; "not", NOT; "null", NULL;
    "or", OR; "out", OUT; "procedure", PROCEDURE; "record", RECORD; "rem", REM;
    "return", RETURN; "reverse", REVERSE; "then", THEN; "true", TRUE;
    "type", TYPE; "use", USE; "while", WHILE; "with", WITH
  ]
}

let digit = ['0' - '9']
let alpha = ['a'-'z' 'A'-'Z']
let ident = alpha (alpha | digit | '_')*
let integer = digit+

rule token = parse
  | _ { assert false }
