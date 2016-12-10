(*
 * Lexical analyzer for Mini-Ada
 *)

{
  open Lexing
  open Parser

  exception Lexing_error of string

  let keywords = [
    "access", ACCESS; "and", AND; "begin", BEGIN; "else", ELSE; "elsif", ELSIF;
    "end", END; "false", FALSE; "for", FOR; "function", FUNCTION; "if", IF;
    "in", IN; "is", IS; "loop", LOOP; "new", NEW; "not", NOT; "null", NULL;
    "or", OR; "out", OUT; "procedure", PROCEDURE; "record", RECORD; "rem", REM;
    "return", RETURN; "reverse", REVERSE; "then", THEN; "true", TRUE;
    "type", TYPE; "use", USE; "while", WHILE; "with", WITH
  ]

  let token_of_ident s =
    try
      List.assoc (String.lowercase s) keywords
    with
      Not_found -> IDENT (String.lowercase s)

  let compare_case_space_insensitive s t =
    let n = String.length s and m = String.length t in
    let space = [' '; '\n'; '\t'] in
    let rec do_from i j =
      if i >= n && j >= m then true
      else if i < n && List.mem s.[i] space then do_from (i + 1) j
      else if j < m && List.mem t.[j] space then do_from i (j + 1)
      else if (i < n && j >= m) || (i >= n && j < n) then false
      else Char.lowercase s.[i] = Char.lowercase t.[j] &&
           (do_from (i + 1) (j + 1))
    in
    do_from 0 0
}

let digit = ['0' - '9']
let alpha = ['a'-'z' 'A'-'Z']
let ident = alpha (alpha | digit | '_')*
let space = [' ' '\n' '\t']
let charval = alpha alpha+ space* '\'' space* alpha alpha+
let integer = digit+
let character = '\'' ['\x00' - '\x7f'] '\'' 
(* Do not handle spaces yet *)
let stdlib = "Ada.Text_IO"

rule token = parse
| space as c        { if c = '\n' then new_line lexbuf; token lexbuf }
| "--"              { comment lexbuf }
| charval as s      { if compare_case_space_insensitive s "character'val" then
                        CHARVAL
                      else
                        raise (Lexing_error ("Invalid token" ^ s)) }
| eof               { EOF } 
| stdlib            { STDLIB } 
| ident as s        { token_of_ident s }
| integer as s      { try
                        let n = int_of_string s in if n > 1 lsl 31 then
                        failwith ""; INT n
                      with _ ->
                        raise (Lexing_error ("too big integer constant " ^ s)) }
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
| "\n"      { new_line lexbuf; token lexbuf }
| eof       { EOF }
| _         { comment lexbuf }
