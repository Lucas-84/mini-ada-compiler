(* Mini Ada compiler *)
open Parser
open Lexing

let in_file = ref "" 

let () =
  Arg.parse [] (fun s -> in_file := s) "Mini Ada compiler";
  Printf.printf "Compiling file %s\n" !in_file;
  let in_chan = open_in !in_file in
  let buf = Lexing.from_channel in_chan in

  try
    let ast = Parser.file Lexer.token buf in
    Printf.printf "completed\n";
    close_in in_chan
  with 
    | Lexer.Lexing_error s ->
      Printf.printf "lexing error";
      exit 1
    | Parser.Error ->
      Printf.printf "parser error";
      exit 1
    | e ->
      Printf.printf "anomaly";
      exit 2
