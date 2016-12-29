(* /!\ main function *)
open X86_64
open Ast

(*
(* Return the size taken on the stack by the declaration d *)
let size_of d = assert false

(* Return the size of the stack frame of f, given its declaration list *)
let compute_stack_size dl = assert false
*)
let label_of_identifier (is, level) =
  "_" ^ (string_of_int level) ^ is

let pushn n = subq (imm n) (reg rsp)
let popn n = addq (imm n) (reg rsp)

let compile_expr (e, _) = match e with
  | TEint x ->
    pushq (imm x)
  | TEchar c ->
    pushq (imm (Char.code c))
  | _ ->
    assert false

let compile_stmt = function
  | TScall (i, tel) ->
    List.fold_left (fun ans x -> ans ++ compile_expr x) nop tel ++
    call (label_of_identifier i) ++
    popn (List.length tel * 8)
  | _ ->
    assert false

let compile_stmts l =
  List.fold_left ( ++ ) nop (List.map compile_stmt l)

let compile_prog tast =
  {
    text =
      (* Main function *)
      glabel "main" ++
      label tast.main_name ++
      pushq (reg rbp) ++
      movq (reg rsp) (reg rbp) ++
      compile_stmts tast.stmts ++ 
      popq rbp ++
      movq (imm 0) (reg rax) ++
      ret ++
      (* New_line function *)
      label "_0new_line" ++
      movq (ilab ".new_line_c") (reg rdi) ++
      movq (imm 0) (reg rax) ++
      call "printf" ++
      ret ++
      (* Put function *)
      label "_0put" ++
      movq (ind ~ofs:8 rsp) (reg rsi) ++
      movq (ilab ".put_c") (reg rdi) ++
      movq (imm 0) (reg rax) ++
      call "printf" ++
      ret
      ;
    data =
      label ".new_line_c" ++
      string "\n" ++
      label ".put_c" ++
      string "%c" 
  }
