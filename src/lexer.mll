(* Lexical analyzer for Mini-Ada *)

{
  open Lexing
  open Parser

  (* Exception to raised to signal a lexical error *)
  exception Lexing_error of string

  (* List of Ada keywords *)
  let keywords = [
    "access", ACCESS; "and", AND; "begin", BEGIN; "else", ELSE; "elsif", ELSIF;
    "end", END; "false", FALSE; "for", FOR; "function", FUNCTION; "if", IF;
    "in", IN; "is", IS; "loop", LOOP; "new", NEW; "not", NOT; "null", NULL;
    "or", OR; "out", OUT; "procedure", PROCEDURE; "record", RECORD; "rem", REM;
    "return", RETURN; "reverse", REVERSE; "then", THEN; "true", TRUE;
    "type", TYPE; "use", USE; "while", WHILE; "with", WITH
  ]

  (* Return the token matching the identifier s *)
  let token_of_ident s =
    try
      List.assoc (String.lowercase_ascii s) keywords
    with
      Not_found -> IDENT s
}

let digit = ['0' - '9']
let alpha = ['a'-'z' 'A'-'Z']
let ident = alpha (alpha | digit | '_')*
(* TODO : check 31 bits *)
let integer = digit+
let character = '\'' _ '\'' 
let stdlib = "Ada.Text_IO"

rule token = parse
| [' ' '\t' '\n']+  { token lexbuf }
| "character'val"   { CHARVAL }
| "--"              { comment lexbuf }
| eof               { EOF } 
| stdlib            { STDLIB } 
| ident as s        { token_of_ident s }
| integer as s      { INT (int_of_string s) }
| character as s    { CHAR s.[1] } 
| ":="              { COLONEQ }
| ':'               { COLON }
| ';'               { SEMICOLON }
| '('               { LPAR }
| ')'               { RPAR }
| '+'               { ADD }
| '-'               { SUB }
| '*'               { MUL }
| '/'               { DIV }
| ','               { COMMA }
| "<="              { LE }
| "<"               { LT }
| ">="              { GE }
| ">"               { GT }
| "/="              { NEQ }
| '='               { EQ }
| ".."              { DOUBLEDOT }
| '.'               { DOT }
| _ as c
  { raise (Lexing_error ("Invalid token " ^ (String.make 1 c))) }

and comment = parse
| "\n"      { token lexbuf }
| eof       { EOF }
| _         { comment lexbuf }
