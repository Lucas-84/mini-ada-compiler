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

let () =
  Arg.parse ["--type-only", Arg.Unit (fun () -> type_only := true), "Type only";
             "--parse-only", Arg.Unit (fun () -> parse_only := true), "Parse only"] (fun s -> in_file := s) "Mini Ada compiler";
  let in_chan = open_in !in_file in
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
      Format.eprintf "\tlexical error: %s\n@." s;
      exit 1
    | Parser.Error ->
      report (lexeme_start_p buf, lexeme_end_p buf);
      Format.eprintf "\tsyntax error\n@." ;
      exit 1
    | Reserved_ident (i, loc) ->
      report (loc.fp, loc.lp);
      Format.eprintf "\t%s is a reserved identifier\n@." i;
      exit 1
    | Typing_error (t1, t2, loc) ->
      report (loc.fp, loc.lp);
      Format.eprintf "\tthis expression has type %s but is expected to have type %s\n@." (string_of_typ t1) (string_of_typ t2);
      exit 1
    | Type_not_equal (t, loc) ->
      report (loc.fp, loc.lp);
      Format.eprintf "\tthis expression has type %s but is expected to have a different type\n@." (string_of_typ t);
      exit 1
    | Unknown_member (i1, i2, loc) ->
      report (loc.fp, loc.lp);
      Format.eprintf "\t%s is not a member of %s\n@." i1 i2;
      exit 1
    | Undeclared (t, loc) ->
      report (loc.fp, loc.lp);
      Format.eprintf "\t%s undeclared\n@." t;
      exit 1
    | Undefined (t, loc) ->
      report (loc.fp, loc.lp);
      Format.eprintf "\t%s undefined\n@." t;
      exit 1
    | Wrong_argument_number (i1, i2, loc) ->
      report (loc.fp, loc.lp);
      Format.eprintf "\t%d arguments given whereas %d were expected\n@." i1 i2;
      exit 1
    | Not_record (t, loc) ->
      report (loc.fp, loc.lp);
      Format.eprintf "\tthis expression has type %s but a record or an access type was expected\n@." (string_of_typ t);
      exit 1
    | Not_lvalue loc ->
      report (loc.fp, loc.lp);
      Format.eprintf "\tthis expression is not an lvalue\n@.";
      exit 1
    | Already_declared (i, loc) ->
      report (loc.fp, loc.lp);
      Format.eprintf "\tthe identifier %s was already declared\n@." i;
      exit 1
    | Declared_not_defined loc ->
      report (loc.fp, loc.lp);
      Format.eprintf "\tsome variable was declared but not defined\n@.";
      exit 1
    | Same_member (i, loc) ->
      report (loc.fp, loc.lp);
      Format.eprintf "\tstructure member %s was already declared\n@." i;
      exit 1
    | Recursive_dec (i, loc) ->
      report (loc.fp, loc.lp);
      Format.eprintf "\trecursive typing declaration of %s\n@." i;
      exit 1
    | No_return (i, loc) ->
      report (loc.fp, loc.lp);
      Format.eprintf "\tno return in function %s returning non-void\n@." i;
      exit 1
    | e ->
      Format.eprintf "Anomaly: %s\n@." (Printexc.to_string e);
      exit 1
