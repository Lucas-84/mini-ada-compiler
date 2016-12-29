(* /!\ main function *)
open X86_64
open Ast

module Smap = Map.Make(String)

(* Environment data structure *)
type env = {
  (* variable identifier -> (level, offset) in the current context *)
  vars: (int * int) Smap.t;
  (* Current level *)
  level: int
}

(* Return a new empty environment *)
let empty_env =
  { vars = Smap.empty;
    level = 0 }

(* Return the label associated to an identifier (given its level) *)
let label_of_identifier (is, level) =
  "_" ^ (string_of_int level) ^ is

(* Return a fresh identifier for a new label *)
let new_label =
  let cnt = ref (-1) in
  function () -> incr cnt; "." ^ (string_of_int !cnt)

let pushn n = subq (imm n) (reg rsp)
let popn n = addq (imm n) (reg rsp)

(* For now: only standard types *)
let size_of_decl d = match d with
  | TDident (i, _, _) -> 8
  | _ -> 0

(* Compute stack size needed by a declaration list *)
let compute_stack_size_decls dl =
  List.fold_left ( + ) 0 (List.map size_of_decl dl)

(* Compute stack size needed by a statement list *)
let rec compute_stack_size_stmt s = match s with
  | TSblock sl -> compute_stack_size_stmts sl
  | TSif (_, sl1, sl2) -> max (compute_stack_size_stmts sl1) (compute_stack_size_stmts sl2)
  | TSfor (_, _, _, _, sl) -> 8 + compute_stack_size_stmts sl
  | _ -> 0
and compute_stack_size_stmts sl =
  List.fold_left max 0 (List.map compute_stack_size_stmt sl)

(* Compile an expression *)
let rec compile_expr env (e, _) = match e with
  | TEint x ->
    pushq (imm x)
  | TEchar c ->
    pushq (imm (Char.code c))
  | TEbool b ->
    pushq (imm (if b then 1 else 0))
  | TEnull ->
    pushq (imm 0)
  | TEbinop (e1, o, e2) ->
    compile_expr env e1 ++
    compile_expr env e2 ++
    (* todo: check order *)
    popq rax ++
    popq rcx ++
    begin match o with
    (* b --> q? *)
    (*
      | Beq -> cmpq (reg rax) (reg rcx) ++ sete (reg rcx)
      | Bneq -> cmpq rax rcx ++ setne rcx
      | Blt -> cmpq rax rcx ++ setl rcx
      | Ble -> cmpq rax rcx ++ setle rcx
      | Bgt -> cmpq rax rcx ++ setg rcx
      | Bge -> cmpq rax rcx ++ setge rcx
    *)
      (* 32 bits? *)
      | Badd -> addq (reg rax) (reg rcx)
      | Bsub -> subq (reg rax) (reg rcx)
      | _ -> assert false ++
    pushq (reg rcx)
    end
  | _ ->
    assert false

(* Compile a statement *)
let rec compile_stmt env next = function
  | TScall (i, tel) ->
    List.fold_left (fun ans x -> ans ++ compile_expr env x) nop tel ++
    call (label_of_identifier i) ++
    popn (List.length tel * 8)
  | TSreturn (Some e) ->
    compile_expr env e ++
    popq rax ++
    ret
  | TSreturn None ->
    ret
  | TSblock sl ->
    compile_stmts env next sl
  | TSif (e, s1, s2) ->
    let label_second = new_label () in
    let label_end = new_label () in
    compile_expr env e ++
    popq rax ++
    cmpq (imm 0) (reg rax) ++
    jz label_second ++
    compile_stmts env next s1 ++
    jz label_end ++
    label label_second ++
    compile_stmts env next s2 ++
    label label_end 
  | TSfor (i, rev, estart, eend, sl) ->
    (* todo: Need to change rsp first *)
    let next = next + 8 in
    let env = { env with vars = Smap.add i (env.level, -next) env.vars } in
    let label_start = new_label () in
    let label_end = new_label () in
    compile_stmt env next (TSaccess (TAident (i, env.level), if rev then eend else estart)) ++
    compile_expr env (if rev then estart else eend) ++
    label label_start ++
    compile_expr env (TEaccess (TAident (i, env.level)), Tint) ++
    popq rax ++
    popq rcx ++
    testq (reg rax) (reg rcx) ++
    pushq (reg rcx) ++
    (if rev then jl else jg) label_end ++
    compile_stmts env next sl ++
    (* todo: inc/dec *)
    label label_end
  | _ ->
    assert false

(* Compile a list of statements *)
and compile_stmts env next l =
  List.fold_left ( ++ ) nop (List.map (compile_stmt env next) l)

(* Compile a whole program *)
let compile_prog tast =
  {
    text =
      (* Main function *)
      glabel "main" ++
      label tast.main_name ++
      pushq (reg rbp) ++
      movq (reg rsp) (reg rbp) ++
      compile_stmts empty_env 0 tast.stmts ++ 
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
