(*
 * Mini Ada compiler
 *)
open Parser
open Lexing
open Typer
open Ast
open Exceptions

let in_file = ref "" 
let type_only = ref false
let parse_only = ref false

let report (b, e) =
  let l = b.pos_lnum in
  let fc = b.pos_cnum - b.pos_bol + 1 in
  let lc = e.pos_cnum - b.pos_bol + 1 in
  Format.eprintf "File \"%s\", line %d, characters %d-%d:\n" !in_file l fc lc

let () =
  Arg.parse ["--type-only", Arg.Unit (fun () -> type_only := true), "Type only";
             "--parse-only", Arg.Unit (fun () ->
               parse_only := true), "Parse only"]
             (fun s -> in_file := s) "Mini Ada compiler";
  let in_chan = 
    try 
      open_in !in_file
    with Sys_error s ->
      begin
        Format.eprintf "Fatal error\n%s\n@." s;
        exit 2
      end
  in
  let buf = Lexing.from_channel in_chan in
  try
    let ast = Parser.file Lexer.token buf in
    if not !parse_only then begin
      let _ = type_file ast in
      ()
    end;
    close_in in_chan
  with 
    | Lexer.Lexing_error s ->
      report (lexeme_start_p buf, lexeme_end_p buf); 
      Format.eprintf "lexical error: %s\n@." s;
      exit 1
    | Parser.Error ->
      report (lexeme_start_p buf, lexeme_end_p buf);
      Format.eprintf "syntax error\n@.";
      exit 1
    | Different_idents (i, loc) ->
      report (loc.fp, loc.lp);
      Format.eprintf "%s is not the expected identifier\n" i;
      exit 1
    | Reserved_ident (i, loc) ->
      report (loc.fp, loc.lp);
      Format.eprintf "%s is a reserved identifier\n@." i;
      exit 1
    | Typing_error (t1, t2, loc) ->
      report (loc.fp, loc.lp);
      Format.eprintf
        "this expression has type %s but is expected to have type %s\n@."
        (string_of_typ t1) (string_of_typ t2);
      exit 1
    | Type_not_equal (t, loc) ->
      report (loc.fp, loc.lp);
      Format.eprintf
        "this expression has type %s but is expected to have a different type\n@."
        (string_of_typ t);
      exit 1
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
    | Wrong_argument_number (i1, i2, loc) ->
      report (loc.fp, loc.lp);
      Format.eprintf "%d arguments given whereas %d were expected\n@." i1 i2;
      exit 1
    | Not_record (t, loc) ->
      report (loc.fp, loc.lp);
      Format.eprintf
        "this expression has type %s but a record or an access type was expected\n@."
        (string_of_typ t);
      exit 1
    | Not_lvalue loc ->
      report (loc.fp, loc.lp);
      Format.eprintf "this expression is not an lvalue\n@.";
      exit 1
    | Already_declared (i, loc) ->
      report (loc.fp, loc.lp);
      Format.eprintf "the identifier %s was already declared\n@." i;
      exit 1
    | Declared_not_defined loc ->
      report (loc.fp, loc.lp);
      Format.eprintf "some variable was declared but not defined\n@.";
      exit 1
    | Same_member (i, loc) ->
      report (loc.fp, loc.lp);
      Format.eprintf "structure member %s was already declared\n@." i;
      exit 1
    | Recursive_dec (i, loc) ->
      report (loc.fp, loc.lp);
      Format.eprintf "recursive typing declaration of %s\n@." i;
      exit 1
    | No_return (i, loc) ->
      report (loc.fp, loc.lp);
      Format.eprintf "no return in function %s returning non-void\n@." i;
      exit 1
    | Bad_access_type (i, loc) ->
      report (loc.fp, loc.lp);
      Format.eprintf
        "mini-ada does not support access on non-record type such as %s\n"
        i;
      exit 1
    | Used_before_end (i, loc) ->
      report (loc.fp, loc.fp);
      Format.eprintf
        "variable %s is used before the end of its declaration\n"
        i;
      exit 1
    | e ->
      Format.eprintf "Anomaly: %s\n@." (Printexc.to_string e);
      exit 2
