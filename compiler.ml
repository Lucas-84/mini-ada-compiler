(* /!\ main function *)
(* TODO: in out & structure types *)
(* access *)
open X86_64
open Ast
open Printf (* debug *)

module Smap = Map.Make(String)
module SImap = Map.Make(struct type t = string * int
  let compare (s, i) (s', i') =
    let r = compare s s' in
    if r <> 0 then r
    else compare i i'
end)

(* Environment data structure *)
type env = {
  (* variable identifier -> (level, offset) in the current context *)
  vars: (int * int * int) Smap.t;
  (* Current level *)
  lvl: int;
  (* Current offset *)
  ofs: int;
  (* Total offset of the current function *)
  tot_ofs: int;
  (* Record offsets *)
  rec_ofs: (int * int) Smap.t SImap.t;
  (* Record size *)
  rec_sz: int SImap.t;
  (* todo : refactor with tot_ofs ? *)
  (* Stack size in curent context *)
  stacksz: int;
}

(* Return a new empty environment *)
let empty_env =
  { vars = Smap.empty;
    ofs = 0;
    lvl = 0;
    tot_ofs = 0;
    rec_ofs = SImap.empty;
    rec_sz = SImap.empty;
    stacksz = 0 }

(* Iter the function f n times *)
let rec iter f n x =
  if n <= 0 then nop 
  else f x ++ iter f (n - 1) x

(* Return the label associated to an identifier (given its level) *)
let label_of_identifier (is, lvl) =
  "_" ^ (string_of_int lvl) ^ is

let ident_of_rec_type = function
  | Trecord x -> x
  | _ -> assert false

(* Return a fresh identifier for a new label *)
let new_label =
  let cnt = ref (-1) in
  function () -> incr cnt; "." ^ (string_of_int !cnt)

let pushn n = subq (imm n) (reg rsp)
let popn n = addq (imm n) (reg rsp)

(* Return type size *)
let rec size_of_type env = function
  (* fuck alignment *)
  | Tint | Tchar | Tbool -> 8
  (* not sure about this *)
  | Trecord r -> SImap.find r env.rec_sz
  | Tnull | Taccess _ -> Printf.printf "access not yet implemented\n"; assert false 
  | Tunit -> Printf.printf "WTF"; assert false

(* For now: only standard types *)
let compute_size_of_decl env d = match d with
  | TDrecordtype (i, fl) ->
    let sz = List.fold_left ( + ) 0 (List.map (size_of_type env) (snd (List.split fl))) in
    let s = fst (List.fold_left (fun (ans, ofs) (fi, ft) -> Smap.add fi (ofs, size_of_type env ft) ans, ofs + size_of_type env ft) (Smap.empty, 0) fl) in
    { env with rec_sz = SImap.add (i, env.lvl) sz env.rec_sz;
               rec_ofs = SImap.add (i, env.lvl) s env.rec_ofs }
  | TDident (_, t, _) ->
    { env with stacksz = env.stacksz + size_of_type env t }
  | _ ->
    env

(* Compute stack size needed by a declaration list *)
let compute_stack_size_decls env dl =
  List.fold_left compute_size_of_decl env dl

(* Compute stack size needed by a statement list *)
let rec compute_stack_size_stmt s = match s with
  | TSblock sl -> compute_stack_size_stmts sl
  | TSif (_, sl1, sl2) -> max (compute_stack_size_stmts sl1)
                              (compute_stack_size_stmts sl2)
                              (* replace 24 by 16 ? *)
  | TSfor (_, _, _, _, sl) -> 24 + compute_stack_size_stmts sl
  | _ -> 0

and compute_stack_size_stmts sl =
  List.fold_left max 0 (List.map compute_stack_size_stmt sl)

(* rsi -> address of the member *)
let rec compile_access env (e, _) = match e with
  | TEaccess (TAident i) -> 
    let lvl, ofs, _ = Smap.find (fst i) env.vars in
    iter (fun () -> movq (ind ~ofs:16 rsi) (reg rsi)) (env.lvl - lvl) () ++
    addq (imm ofs) (reg rsi)
  | TEaccess (TArecord (((_, t) as e), i)) ->
    let ofs, _ = Smap.find i (SImap.find (ident_of_rec_type t) env.rec_ofs) in
    compile_access env e ++
    subq (imm ofs) (reg rsi)
  | _ ->
    assert false

(* push data sz bytes from the address pointed by rsi to the top of the stack *)
let push_data sz =
  iter (fun () -> movq (ind rsi) (reg rdi) ++ pushq (reg rdi) ++ subq (imm 8) (reg rsi)) (sz / 8) ()

(* Compile a declaration *)
let rec compile_decl env d = match d with
  | TDident (i, t, s) ->
    let old_ofs = env.ofs in
    let env = { env with vars = Smap.add i (env.lvl, env.ofs, size_of_type env t) env.vars;
                ofs = env.ofs - size_of_type env t } in
    begin match s with
      | Some e ->
        compile_expr env e ++
        popq rdi ++
        movq (reg rdi) (ind ~ofs:old_ofs rbp)
      | None -> nop 
    end, nop, env
  | TDfunction (i, pl, rt, dl, sl) ->
    let env = { env with vars = fst (List.fold_right
      (* something with mode here *)
      (fun (i, _, t) (vars, ofs) -> let sz = size_of_type env t in let new_ofs = ofs + sz in Smap.add i (env.lvl + 1, new_ofs, sz) vars, new_ofs)
      pl (env.vars, 16)) } in
    let env' = compute_stack_size_decls {env with lvl = env.lvl + 1} dl in
    let env' = {env' with stacksz = env'.stacksz + compute_stack_size_stmts sl} in
    let code_inside, code_after, env' =
      compile_decls { env' with ofs = -8; tot_ofs = env'.stacksz} dl in
    nop, label (label_of_identifier (i, env.lvl)) ++ 
    pushq (reg rbp) ++
    movq (reg rsp) (reg rbp) ++
    pushn env'.stacksz ++
    code_inside ++
    compile_stmts env' sl ++
    movq (imm 0) (reg rax) ++
    popn env'.stacksz ++
    popq rbp ++
    ret ++ code_after, env
  | TDrecordtype (i, fl) ->
    nop, nop, env
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
  | TEnew i ->
    (* todo *)
    assert false
  | TEbinop (e1, o, e2) ->
    begin match o with
      | Bandthen ->
        let label_end = new_label () in
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
      | Beq | Bneq ->
        let sz = size_of_type env (snd e1) in
        printf "pop %d 8 and %d\n" (sz/8) sz;
        compile_expr env e1 ++
        compile_expr env e2 ++
        movq (reg rsp) (reg rsi) ++
        addq (imm sz) (reg rsi) ++
        movq (imm 0) (reg rax) ++
        iter (fun () ->
          let label_tmp = new_label () in
          popq rdi ++
          cmpb (imm 1) (reg al) ++
          jz label_tmp ++
          cmpq (ind rsi) (reg rdi) ++
          (if o = Beq then sete else setne) (reg al) ++
          label label_tmp ++
          addq (imm 8) (reg rsi)) (sz / 8) () ++
        popn sz
      | _ ->
        compile_expr env e1 ++
        compile_expr env e2 ++
        popq rcx ++
        popq rax ++
        begin match o with
          (*| Beq  -> cmpq (reg rcx) (reg rax) ++ movq (imm 0) (reg rax) ++ sete (reg al)
          | Bneq -> cmpq (reg rcx) (reg rax) ++ movq (imm 0) (reg rax) ++ setne (reg al) *)
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
    (* todo check ofs >= 0 *)
    let lvl, ofs, sz = Smap.find (fst i) env.vars in
    movq (reg rbp) (reg rsi) ++
    iter (fun () -> movq (ind ~ofs:16 rsi) (reg rsi)) (env.lvl - lvl) () ++
    addq (imm ofs) (reg rsi) ++
    push_data sz
  | TEaccess (TArecord ((_, t) as e, i)) ->
    let sz = size_of_type env t in
    let ofs, memsz = Smap.find i (SImap.find (ident_of_rec_type t) env.rec_ofs) in
    assert (ofs >= 0);
    compile_expr env e ++
    movq (reg rsp) (reg rsi) ++
    addq (imm (sz - ofs - 8)) (reg rsi)  ++
    movq (reg rsp) (reg rdi) ++
    addq (imm (sz - 8)) (reg rdi) ++
    (* calling conventions? *)
    iter (fun () -> movq (ind rsi) (reg rcx) ++ movq (reg rcx) (ind rdi) ++ subq (imm 8) (reg rsi) ++ subq (imm 8) (reg rdi)) (memsz / 8) () ++
    popn (sz - memsz)
    (* todo *)
  | TEcall ((_, lvl) as i, tel) ->
    assert (lvl <= env.lvl);
    let listsz = List.fold_left ( + ) 8 (List.map (size_of_type env) (snd (List.split tel))) in
    List.fold_left (fun ans x -> ans ++ compile_expr env x) nop tel ++
    movq (reg rbp) (reg rdi) ++
    iter (fun () -> movq (ind ~ofs:16 rdi) (reg rdi)) (env.lvl - lvl) () ++
    pushq (reg rdi) ++
    call (label_of_identifier i) ++
    popn listsz ++
    pushq (reg rax)

(* Compile a statement *)
and compile_stmt env = function
  | TScall ((_, lvl) as i, tel) ->
    (* todo adapt to var size *)
    assert (lvl <= env.lvl);
    let listsz = List.fold_left ( + ) 8 (List.map (size_of_type env) (snd (List.split tel))) in
    List.fold_left (fun ans x -> ans ++ compile_expr env x) nop tel ++
    movq (reg rbp) (reg rdi) ++
    iter (fun () -> movq (ind ~ofs:16 rdi) (reg rdi)) (env.lvl - lvl) () ++
    pushq (reg rdi) ++
    call (label_of_identifier i) ++
    popn listsz 
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
    let env = {env with vars = Smap.add i (env.lvl, ofs - 8, 8) env.vars; ofs = ofs - 16} in
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
    let _, _, sz = Smap.find (fst i) env.vars in
    compile_expr env e ++
    movq (reg rbp) (reg rsi) ++
    compile_access env (TEaccess (TAident i), Tunit) ++
    subq (imm (sz - 8)) (reg rsi) ++
    iter (fun () -> popq rdi ++ movq (reg rdi) (ind rsi) ++ addq (imm 8) (reg rsi)) (sz / 8) ()
  | TSaccess (TArecord ((_, lt) as el, i), er) ->
    (*let idt = begin match lt with Trecord x -> x | _ -> assert false end in*)
    (*let mem_ofs = Smap.find i (SImap.find idt env.rec_ofs) in*)
    (*let rec_sz = SImap.find idt env.rec_sz in*)
    let ofs, memsz = Smap.find i (SImap.find (ident_of_rec_type lt) env.rec_ofs) in
    compile_expr env er ++
    movq (reg rbp) (reg rsi) ++
    compile_access env el ++
    subq (imm (ofs + memsz)) (reg rsi) ++
    iter (fun () -> addq (imm 8) (reg rsi) ++ popq rdi ++ movq (reg rdi) (ind rsi)) (memsz / 8) ()

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
