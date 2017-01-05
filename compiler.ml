(* /!\ main function *)
(* in out *)
open X86_64
open Ast

module Smap = Map.Make(String)

(* Environment data structure *)
type env = {
  (* variable identifier -> (level, offset) in the current context *)
  vars: (int * int) Smap.t;
  (* Current level *)
  lvl: int;
  (* Current offset *)
  ofs: int;
  (* Total offset of the current function *)
  tot_ofs: int;
}

(* Return a new empty environment *)
let empty_env =
  { vars = Smap.empty;
    ofs = 0;
    lvl = 0;
    tot_ofs = 0}

(* Iter the function f n times *)
let rec iter f n x =
  if n <= 0 then nop 
  else f x ++ iter f (n - 1) x

(* Return the label associated to an identifier (given its level) *)
let label_of_identifier (is, lvl) =
  "_" ^ (string_of_int lvl) ^ is

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
  | TSif (_, sl1, sl2) -> max (compute_stack_size_stmts sl1)
                              (compute_stack_size_stmts sl2)
  | TSfor (_, _, _, _, sl) -> 24 + compute_stack_size_stmts sl
  | _ -> 0
and compute_stack_size_stmts sl =
  List.fold_left max 0 (List.map compute_stack_size_stmt sl)

(* Compile a declaration *)
let rec compile_decl env d = match d with
  | TDident (i, t, s) ->
    let ofs = env.ofs in
    let env = { env with vars = Smap.add i (env.lvl, ofs - 8) env.vars;
                ofs = ofs - 8 } in
    begin match s with
      | Some e ->
        compile_expr env e ++
        popq rdi ++
        movq (reg rdi) (ind ~ofs:env.ofs rbp)
      | None -> nop 
    end, nop, env
  | TDfunction (i, pl, rt, dl, sl) ->
    let env = { env with vars = fst (List.fold_right
      (fun (i, _, _) (vars, ofs) -> Smap.add i (env.lvl + 1, ofs) vars, ofs + 8)
      pl (env.vars, 24)) } in
    let stacksz = compute_stack_size_decls dl + compute_stack_size_stmts sl in
    let code_inside, code_after, env' =
      compile_decls { env with ofs = 0; tot_ofs = stacksz; lvl = env.lvl + 1 } dl in
    nop, label (label_of_identifier (i, env.lvl)) ++ 
    pushq (reg rbp) ++
    movq (reg rsp) (reg rbp) ++
    pushn stacksz ++
    code_inside ++
(*  comment "fin du code inside" ++*)
    compile_stmts env' sl ++
    movq (imm 0) (reg rax) ++
    popn stacksz ++
    popq rbp ++
    ret ++ code_after, env
  | _ ->
    assert false
    
and compile_decls env dl =
  List.fold_left (fun (code1, code2, env) d ->
    let code1', code2', env' = compile_decl env d in 
      code1 ++ code1', code2 ++ code2', env')
    (nop, nop, env) dl

(* Compile an expression *)
and compile_expr env (e, _) = match e with
  | TEint x ->
    pushq (imm x)
  | TEchar c ->
    pushq (imm (Char.code c))
  | TEbool b ->
    pushq (imm (if b then 1 else 0))
  | TEnull ->
    pushq (imm 0)
  | TEbinop (e1, o, e2) ->
    begin match o with
      | Bandthen ->
        let label_end = new_label () in
        comment "here" ++
        compile_expr env e1 ++
        popq rax ++
        cmpq (imm 0) (reg rax) ++
        jz label_end ++
        compile_expr env e2 ++
        popq rax ++
        label label_end
      | Borelse ->
        let label_end = new_label () in
        compile_expr env e1 ++
        popq rax ++
        cmpq (imm 0) (reg rax) ++
        jnz label_end ++
        compile_expr env e2 ++
        popq rax ++
        label label_end
      | _ ->
        compile_expr env e1 ++
        compile_expr env e2 ++
        popq rcx ++
        popq rax ++
        begin match o with
          | Beq  -> cmpq (reg rcx) (reg rax) ++ movq (imm 0) (reg rax) ++ sete (reg al)
          | Bneq -> cmpq (reg rcx) (reg rax) ++ movq (imm 0) (reg rax) ++ setne (reg al) 
          | Blt  -> cmpq (reg rcx) (reg rax) ++ movq (imm 0) (reg rax) ++ setl (reg al)
          | Ble  -> cmpq (reg rcx) (reg rax) ++ movq (imm 0) (reg rax) ++ setle (reg al)
          | Bgt  -> cmpq (reg rcx) (reg rax) ++ movq (imm 0) (reg rax) ++ setg (reg al)
          | Bge  -> cmpq (reg rcx) (reg rax) ++ movq (imm 0) (reg rax) ++ setge (reg al)
    
          | Band -> andl (reg ecx) (reg eax)
          | Bor  -> orl  (reg ecx) (reg eax)
    
          | Badd -> addl (reg ecx) (reg eax)
          | Bsub -> subl (reg ecx) (reg eax)
          | Brem ->
            cqto ++
            idivl (reg ecx) ++
            movl (reg edx) (reg eax)
          | Bdiv ->
            cqto ++
            idivl (reg ecx)
          | Bmul ->
            imull (reg ecx) (reg eax)
          | _ -> assert false
        end
    end ++
    movslq (reg eax) rax ++
    pushq (reg rax)
  | TEneg e ->
    compile_expr env e ++
    popq rax ++
    xorq (imm 1) (reg rax) ++
    pushq (reg rax)
  | TEminus (TEint n, _) ->
    pushq (imm (-n))
  | TEminus e ->
    compile_expr env e ++
    popq rax ++
    movq (imm 0) (reg rdi) ++
    subq (reg rax) (reg rdi) ++
    pushq (reg rdi)
  | TEcharval e ->
    compile_expr env e
  | TEaccess (TAident i) ->
    let lvl, ofs = Smap.find (fst i) env.vars in
    movq (reg rbp) (reg rsi) ++
    iter (fun () -> movq (ind ~ofs:16 rsi) (reg rsi)) (env.lvl - lvl) () ++
    movq (ind ~ofs rsi) (reg rdi) ++
    pushq (reg rdi)
  | TEcall ((_, lvl) as i, tel) ->
    assert (lvl <= env.lvl);
    List.fold_left (fun ans x -> ans ++ compile_expr env x) nop tel ++
    movq (reg rbp) (reg rdi) ++
    iter (fun () -> movq (ind ~ofs:16 rdi) (reg rdi)) (env.lvl - lvl) () ++
    pushq (reg rdi) ++
    call (label_of_identifier i) ++
    popn ((List.length tel + 1) * 8) ++
    pushq (reg rax)
  | _ ->
    assert false

(* Compile a statement *)
and compile_stmt env = function
  | TScall ((_, lvl) as i, tel) ->
    assert (lvl <= env.lvl);
    List.fold_left (fun ans x -> ans ++ compile_expr env x) nop tel ++
    movq (reg rbp) (reg rdi) ++
    iter (fun () -> movq (ind ~ofs:16 rdi) (reg rdi)) (env.lvl - lvl) () ++
    pushq (reg rdi) ++
    call (label_of_identifier i) ++
    popn ((List.length tel + 1) * 8)
  | TSreturn (Some e) ->
    compile_expr env e ++
    popq rax ++
    popn (env.tot_ofs) ++
    popq rbp ++
    ret
  | TSreturn None ->
    popn (env.tot_ofs) ++
    popq rbp ++
    movq (imm 0) (reg rax) ++
    ret
  | TSblock sl ->
    compile_stmts env sl
  | TSif (e, s1, s2) ->
    let label_second = new_label () in
    let label_end = new_label () in
    compile_expr env e ++
    popq rax ++
    cmpq (imm 0) (reg rax) ++
    jz label_second ++
    compile_stmts env s1 ++
    jmp label_end ++
    label label_second ++
    compile_stmts env s2 ++
    label label_end
  | TSwhile (e, sl) ->
    let label_start = new_label () in
    let label_end = new_label () in
    label label_start ++
    compile_expr env e ++
    popq rax ++
    cmpq (imm 0) (reg rax) ++
    jz label_end ++
    compile_stmts env sl ++
    jmp label_start ++
    label label_end
  | TSfor (i, rev, estart, eend, sl) ->
    let ofs = env.ofs in
    let env = {env with vars = Smap.add i (env.lvl, ofs - 8) env.vars; ofs = ofs - 16} in
    let label_start = new_label () in
    let label_end = new_label () in
    compile_stmt env (TSaccess (TAident (i, env.lvl), if rev then eend else estart)) ++
    compile_expr env (if rev then estart else eend) ++
    popq rdi ++
    movq (reg rdi) (ind ~ofs:(ofs - 16) rbp) ++
    label label_start ++
    compile_expr env (TEaccess (TAident (i, env.lvl)), Tint) ++
    pushq (ind ~ofs:(ofs - 16) rbp) ++
    popq rcx ++
    popq rax ++
    cmpq (reg rcx) (reg rax) ++
    (if rev then jl else jg) label_end ++
    compile_stmts env sl ++
    movq (ind ~ofs:(ofs - 8) rbp) (reg rdi) ++
    (if rev then decq else incq) (reg rdi) ++
    movq (reg rdi) (ind ~ofs:(ofs - 8) rbp) ++
    jmp label_start ++
    label label_end
  | TSaccess (TAident i, e) ->
    let lvl, ofs = Smap.find (fst i) env.vars in
    compile_expr env e ++
    popq rdi ++
    movq (reg rbp) (reg rsi) ++
    iter (fun () -> movq (ind ~ofs:16 rsi) (reg rsi)) (env.lvl - lvl) () ++
    movq (reg rdi) (ind ~ofs rsi)
  | _ ->
    assert false

(* Compile a list of statements *)
and compile_stmts env l =
  List.fold_left ( ++ ) nop (List.map (compile_stmt env) l)

(* Compile a whole program *)
let compile_prog tast =
  (* bug with return int ? *)
  let code_inside, code_after, _ = compile_decls
    empty_env [TDfunction (tast.main_name, [], Tunit, 
    tast.glob_decl, tast.stmts)] in
  {
    text =
      (* Main function *)
      glabel "main" ++
      code_inside ++
      code_after ++
      (*
      label (label_of_identifier (tast.main_name, 0)) ++
      pushq (reg rbp) ++
      movq (reg rsp) (reg rbp) ++
      code_inside ++
      compile_stmts empty_env tast.stmts ++ 
      popq rbp ++
      movq (imm 0) (reg rax) ++
      ret ++
      *)
      (* New_line function *)
      label "_0new_line" ++
      movq (ilab ".new_line_c") (reg rdi) ++
      movq (imm 0) (reg rax) ++
      call "printf" ++
      ret ++
      (* Put function *)
      label "_0put" ++
      movq (ind ~ofs:16 rsp) (reg rsi) ++
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
