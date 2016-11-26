(* Mini Ada compiler *)
open Parser
open Lexing

let in_file = ref "" 
let type_only = ref false
let parse_only = ref false

let report (b, e) =
  let l = b.pos_lnum in
  let fc = b.pos_cnum - b.pos_bol + 1 in
  let lc = e.pos_cnum - b.pos_bol + 1 in
  Format.eprintf "File \"%s\", line %d, characters %d-%d:\n" !in_file l fc lc

let () =
  Arg.parse ["--type-only", Unit (fun () -> type_only := true), "Type only";
             "--parse-only", Unit (fun () -> parse_only := true), "Parse only"] (fun s -> in_file := s) "Mini Ada compiler";
  (*Printf.printf "Compiling file %s\n" !in_file;*)
  let in_chan = open_in !in_file in
  let buf = Lexing.from_channel in_chan in

  try
    let ast = Parser.file Lexer.token buf in
    (*Printf.printf "completed\n";*)
    close_in in_chan
  with 
    | Lexer.Lexing_error s ->
      report (lexeme_start_p buf, lexeme_end_p buf); 
      Format.eprintf "Lexical error: %s\n@." s;
      exit 1
    | Parser.Error ->
      report (lexeme_start_p buf, lexeme_end_p buf);
      Format.eprintf "Syntax error\n@." ;
      exit 1
    | e ->
      Format.eprintf "Anomaly: %s\n@." (Printexc.to_string e);
      exit 1
