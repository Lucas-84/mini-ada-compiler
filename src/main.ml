(* Mini Ada compiler *)
open Parser
open Lexing
open Typing
open Typed_ast
open Ast

let in_file = ref "" 
let type_only = ref false
let parse_only = ref false

let report (b, e) =
  let l = b.pos_lnum in
  let fc = b.pos_cnum - b.pos_bol + 1 in
  let lc = e.pos_cnum - b.pos_bol + 1 in
  Format.eprintf "File \"%s\", line %d, characters %d-%d:\n" !in_file l fc lc

let string_of_typ = function
  | Tint      -> "int"
  | Tchar     -> "char"
  | Tbool     -> "bool"
  | Trecord r -> r
  | Taccess r -> "access " ^ r
  | Tnull     -> "access ..."

let () =
  Arg.parse ["--type-only", Arg.Unit (fun () -> type_only := true), "Type only";
             "--parse-only", Arg.Unit (fun () -> parse_only := true), "Parse only"] (fun s -> in_file := s) "Mini Ada compiler";
  (*Printf.printf "Compiling file %s\n" !in_file;*)
  let in_chan = open_in !in_file in
  let buf = Lexing.from_channel in_chan in
  try
    let ast = Parser.file Lexer.token buf in
    (*Printf.printf "Syntax checking completed\n";*)
    let _ = type_file ast in
    (*Printf.printf "Type checking completed\n";*)
    close_in in_chan
  with 
    | Lexer.Lexing_error s ->
      report (lexeme_start_p buf, lexeme_end_p buf); 
      Format.eprintf "lexical error: %s\n@." s;
      exit 1
    | Parser.Error ->
      report (lexeme_start_p buf, lexeme_end_p buf);
      Format.eprintf "syntax error\n@." ;
      exit 1
    | Typing_error (t1, t2, loc) ->
      report (loc.fp, loc.lp);
      Format.eprintf "this expression has type %s but is expected to have type %s\n@." (string_of_typ t1) (string_of_typ t2);
      exit 1
      (**
    | Unknown_variable (i, loc) ->
      report (loc.fp, loc.lp);
      Format.eprintf "%s undeclared@." i;
      exit 1
      **)
    | Unknown_member (i1, i2, loc) ->
      report (loc.fp, loc.lp);
      Format.eprintf "%s is not a member of %s\n@." i1 i2;
      exit 1
    | Undeclared (t, loc) ->
      report (loc.fp, loc.lp);
      Format.eprintf "%s undeclared\n@." t;
      exit 1
    | Undefined (t, loc) ->
      report (loc.fp, loc.lp);
      Format.eprintf "%s undefined\n@." t;
      exit 1
    | e ->
      Format.eprintf "Anomaly: %s\n@." (Printexc.to_string e);
      exit 1
