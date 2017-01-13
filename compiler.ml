(* Compiler - code production *)

open X86_64
open Ast

module Smap = Map.Make(String)
module SImap = Map.Make(struct type t = string * int
  let compare (s, i) (s', i') =
    let r = compare s s' in
    if r <> 0 then r
    else compare i i'
end)

(* Environment data structure *)
type env = {
  (* 
   * variable identifier -> (level, offset, size, by_reference)
   * in the current context.
   * *)
  vars: (int * int * int * bool) Smap.t;
  (* Current level *)
  lvl: int;
  (* Current offset *)
  ofs: int;
  (* Record offsets *)
  rec_ofs: (int * int) Smap.t SImap.t;
  (* Record size *)
  rec_sz: int SImap.t;
  (* Stack size in curent context *)
  stacksz: int;
  (* Offset of return value *) 
  ret_ofs: int;
}

(* Number of bytes of a canonical word *)
let wordsz = 8

(* Functions labels handlers *)
let fct_labels = ref SImap.empty
let nb_labels = ref 0

let add_label i =
  fct_labels := SImap.add i !nb_labels !fct_labels;
  incr nb_labels

let get_label i =
  "_f_" ^ (string_of_int (SImap.find i !fct_labels))

(* Return a fresh new environment *)
let empty_env =
  { vars = Smap.empty;
    ofs = 0;
    lvl = 0;
    rec_ofs = SImap.empty;
    rec_sz = SImap.empty;
    stacksz = 0;
    ret_ofs = 0 }

(* Iter the code of function f on input x n times *)
let rec iter f n x =
  if n <= 0 then nop 
  else f x ++ iter f (n - 1) x

(* Return the identifier associated to a record or access type *)
let ident_of_rec_type = function
  | Trecord x -> x
  | Taccess x -> x
  | _ -> assert false

(* Return true iff. the input is an access type *)
let is_access = function
  | Taccess _ -> true
  | _ -> false

(* Convert the input type the associated record type if it is an access type *)
let record_of_access = function
 | Taccess x -> Trecord x
 | x -> x 

(* Return a fresh identifier for a new label *)
let new_label =
  let cnt = ref (-1) in
  function () -> incr cnt; "." ^ (string_of_int !cnt)

(* Allocate n bytes on the stack *)
let pushn n = subq (imm n) (reg rsp)
(* Deallocate n bytes on the stack *)
let popn n = addq (imm n) (reg rsp)

(* Return type size (in bytes) *)
let rec size_of_type env = function
  (*
   * In order to make alignment requirements easier,
   * all data type are stored on 8 bytes.
   *)
  | Tnull | Taccess _ | Tint | Tchar | Tbool -> wordsz 
  | Trecord r -> SImap.find r env.rec_sz
  | Tunit -> assert false

(* Update env with the size information about a declaration *)
let compute_size_of_decl env d = match d with
  | TDrecordtype (i, fl) ->
    let rec_sz = List.fold_left ( + ) 0
                 (List.map (size_of_type env) (snd (List.split fl))) in
    let s = fst (List.fold_left
      (fun (ans, ofs) (fi, ft) ->
        Smap.add fi (ofs, size_of_type env ft) ans, ofs + size_of_type env ft)
      (Smap.empty, 0) fl) in
    { env with rec_sz = SImap.add (i, env.lvl) rec_sz env.rec_sz;
               rec_ofs = SImap.add (i, env.lvl) s env.rec_ofs }
  | TDident (_, t, _) ->
    { env with stacksz = env.stacksz + size_of_type env t }
  | _ -> env

(* Compute stack size needed by a declaration list *)
let compute_stack_size_decls env dl =
  List.fold_left compute_size_of_decl { env with stacksz = 0 } dl

(* Compute stack size needed by a statement/statement list *)
let rec compute_stack_size_stmt = function
  | TSblock sl -> compute_stack_size_stmts sl
  | TSif (_, sl1, sl2) -> max (compute_stack_size_stmts sl1)
                              (compute_stack_size_stmts sl2)
  | TSfor (_, _, _, _, sl) -> 2 * wordsz + compute_stack_size_stmts sl
  | TSwhile (_, sl) -> compute_stack_size_stmts sl
  | _ -> 0
and compute_stack_size_stmts sl =
  List.fold_left max 0 (List.map compute_stack_size_stmt sl)

(* Put in rsi the address of the lvalue *)
let rec compile_access env (e, _) = match e with
  | TEaccess (TAident i) -> 
    let lvl, ofs, _, by_ref = Smap.find (fst i) env.vars in
    iter (fun () -> movq (ind ~ofs:(2 * wordsz) rsi) (reg rsi))
         (env.lvl - lvl) () ++
    addq (imm ofs) (reg rsi) ++
    (if by_ref then movq (ind rsi) (reg rsi) else nop)
  | TEaccess (TArecord (((_, t) as e), i)) ->
    let ofs, _ = Smap.find i (SImap.find (ident_of_rec_type t) env.rec_ofs) in
    compile_access env e ++
    (if is_access t then movq (ind rsi) (reg rsi) else nop) ++
    subq (imm ofs) (reg rsi) 
  | _ ->
    assert false

(* Push data sz bytes from the address pointed by rsi to top of the stack *)
let push_data sz =
  iter (fun () -> movq (ind rsi) (reg rdi) ++
                  pushq (reg rdi) ++
                  subq (imm wordsz) (reg rsi)) (sz / wordsz) ()

(* Compile a function call *)
let rec compile_call env i tel lvl et =
    assert (lvl <= env.lvl);
    let mf ((_, t), by_ref) = if by_ref then wordsz else size_of_type env t in
    let listsz = List.fold_left ( + ) wordsz (List.map mf tel) in
    (match et with Some x -> pushn (size_of_type env x) | _ -> nop) ++
    List.fold_left
      (fun ans (e, by_ref) ->
        ans ++
        (if by_ref then
          movq (reg rbp) (reg rsi) ++
          compile_access env e ++
          pushq (reg rsi)
         else compile_expr env e))
      nop tel ++
    movq (reg rbp) (reg rdi) ++
    iter (fun () -> movq (ind ~ofs:(2 * wordsz) rdi) (reg rdi))
         (env.lvl - lvl) () ++
    pushq (reg rdi) ++
    call (get_label i) ++
    popn listsz

(* Compile a declaration *)
and compile_decl env d = match d with
  | TDident (i, t, s) ->
    let old_ofs = env.ofs in
    let env = { env with vars = Smap.add i (env.lvl, old_ofs,
                                            size_of_type env t, false) env.vars;
                         ofs = old_ofs - size_of_type env t } in
    begin match s with
      | Some e ->
        compile_expr env e ++
        popq rdi ++
        movq (reg rdi) (ind ~ofs:old_ofs rbp)
      | None -> nop 
    end, nop, env
  | TDfunction (i, pl, rt, dl, sl) ->
    let new_vars, new_ofs = List.fold_right
      (fun (i, m, t) (vars, ofs) ->
        let sz = if m = Minout then wordsz else size_of_type env t in
        let new_ofs = ofs + sz in
        Smap.add i (env.lvl + 1, new_ofs, size_of_type env t, m = Minout) vars,
        new_ofs)
      pl (env.vars, 2 * wordsz) in
    let env = { env with vars = new_vars } in
    add_label (i, env.lvl);
    let l = get_label (i, env.lvl) in
    let env' = compute_stack_size_decls { env with lvl = env.lvl + 1 } dl in
    let env' =
      { env' with stacksz = env'.stacksz + compute_stack_size_stmts sl } in
    let code_inside, code_after, env' =
      compile_decls { env' with ofs = -wordsz } dl in
    nop, 
    label l ++ 
    pushq (reg rbp) ++
    movq (reg rsp) (reg rbp) ++
    pushn env'.stacksz ++
    code_inside ++
    compile_stmts { env' with ret_ofs = new_ofs } sl ++
    movq (imm 0) (reg rax) ++
    popn env'.stacksz ++
    popq rbp ++
    ret ++ code_after, env
  | _ -> nop, nop, env
    
and compile_decls env dl =
  List.fold_left
    (fun (code1, code2, env) d ->
      let code1', code2', env' = compile_decl env d in
      code1 ++ code1', code2 ++ code2', env')
    (nop, nop, env) dl

(* Compile an expression *)
and compile_expr env (e, et) = 
  match e with
  | TEint x ->
    pushq (imm x)
  | TEchar c ->
    pushq (imm (Char.code c))
  | TEbool b ->
    pushq (imm (if b then 1 else 0))
  | TEnull ->
    pushq (imm 0)
  | TEnew i ->
    let sz = size_of_type env (Trecord i) in
    movq (imm sz) (reg rdi) ++
    call "malloc" ++
    (* Initialize to 0 *)
    movq (reg rax) (reg rdi) ++
    iter (fun () -> movq (imm 0) (ind rdi) ++
                    subq (imm wordsz) (reg rdi))
         (sz / wordsz) () ++
    pushq (reg rax)
  | TEbinop (e1, o, e2) ->
    begin match o with
      | Bandthen | Borelse ->
        let label_end = new_label () in
        compile_expr env e1 ++ popq rax ++
        cmpq (imm 0) (reg rax) ++
        (if o = Bandthen then jz else jnz) label_end ++
        compile_expr env e2 ++ popq rax ++
        label label_end
      | Beq | Bneq ->
        let sz = size_of_type env (snd e1) in
        compile_expr env e1 ++ compile_expr env e2 ++
        movq (reg rsp) (reg rsi) ++ addq (imm sz) (reg rsi) ++
        movq (imm 0) (reg rax) ++
        iter (fun () ->
          let label_tmp = new_label () in
          popq rdi ++
          cmpb (imm 1) (reg al) ++
          jz label_tmp ++
          cmpq (ind rsi) (reg rdi) ++
          (if o = Beq then sete else setne) (reg al) ++
          label label_tmp ++
          addq (imm wordsz) (reg rsi)) (sz / wordsz) () ++
        popn sz
      | _ ->
        compile_expr env e1 ++ compile_expr env e2 ++
        popq rcx ++ popq rax ++
        
        begin match o with
          | Blt | Ble | Bgt | Bge ->
            cmpq (reg rcx) (reg rax) ++ movq (imm 0) (reg rax) ++
            (match o with
              | Blt -> setl | Ble -> setle
              | Bgt -> setg | Bge -> setge
              | _ -> assert false) (reg al)

          | Band -> andl (reg ecx) (reg eax)
          | Bor  -> orl  (reg ecx) (reg eax)
    
          | Badd -> addl (reg ecx) (reg eax)
          | Bsub -> subl (reg ecx) (reg eax)
          | Brem -> cqto ++ idivl (reg ecx) ++ movl (reg edx) (reg eax)
          | Bdiv -> cqto ++ idivl (reg ecx)
          | Bmul -> imull (reg ecx) (reg eax)
          | _ -> assert false
        end
    end ++
    movslq (reg eax) rax ++ pushq (reg rax)
  | TEneg e ->
    compile_expr env e ++ popq rax ++
    xorq (imm 1) (reg rax) ++
    pushq (reg rax)
  | TEminus (TEint n, _) ->
    pushq (imm (-n))
  | TEminus e ->
    compile_expr env e ++ popq rax ++
    movq (imm 0) (reg rdi) ++ subq (reg rax) (reg rdi) ++
    pushq (reg rdi)
  | TEcharval e ->
    compile_expr env e
  | TEaccess (TAident i) ->
    let lvl, ofs, sz, by_ref = Smap.find (fst i) env.vars in
    movq (reg rbp) (reg rsi) ++
    iter (fun () -> movq (ind ~ofs:(2 * wordsz) rsi) (reg rsi))
         (env.lvl - lvl) () ++
    addq (imm ofs) (reg rsi) ++
    (if by_ref then movq (ind rsi) (reg rsi) else nop) ++
    push_data sz
  | TEaccess (TArecord ((_, t) as e, i)) ->
    let sz = size_of_type env (record_of_access t) in
    let ofs, memsz = Smap.find i
      (SImap.find (ident_of_rec_type t) env.rec_ofs) in
    assert (ofs >= 0);
    compile_expr env e ++
    (if is_access t then
      popq rdi ++
      iter (fun () -> pushq (ind rdi) ++
                      subq (imm wordsz) (reg rdi))
           (sz / wordsz) ()
     else nop) ++
    movq (reg rsp) (reg rsi) ++
    addq (imm (sz - ofs - wordsz)) (reg rsi)  ++
    movq (reg rsp) (reg rdi) ++
    addq (imm (sz - wordsz)) (reg rdi) ++
    iter (fun () -> movq (ind rsi) (reg rcx) ++
                    movq (reg rcx) (ind rdi) ++
                    subq (imm wordsz) (reg rsi) ++
                    subq (imm wordsz) (reg rdi))
         (memsz / wordsz) () ++
    popn (sz - memsz)
  | TEcall ((_, lvl) as i, tel) ->
    compile_call env i tel lvl (Some et)

(* Compile a statement *)
and compile_stmt env = function
  | TScall ((_, lvl) as i, tel) ->
    compile_call env i tel lvl None
  | TSreturn (Some e) ->
    compile_expr env e ++
    movq (reg rbp) (reg rdi) ++
    addq (imm env.ret_ofs) (reg rdi) ++
    iter (fun () -> popq rsi ++
                    addq (imm wordsz) (reg rdi) ++
                    movq (reg rsi) (ind rdi))
         (size_of_type env (snd e) / wordsz) () ++
    popn (env.stacksz) ++
    popq rbp ++
    ret
  | TSreturn None ->
    popn (env.stacksz) ++
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
    let env =
      { env with vars = Smap.add i (env.lvl, ofs, wordsz, false) env.vars;
                 ofs = ofs - 2 * wordsz} in
    let label_start = new_label () in
    let label_end = new_label () in
    compile_stmt env (TSaccess (TAident (i, env.lvl),
                      if rev then eend else estart)) ++
    compile_expr env (if rev then estart else eend) ++
    popq rdi ++
    movq (reg rdi) (ind ~ofs:(ofs - wordsz) rbp) ++
    label label_start ++
    compile_expr env (TEaccess (TAident (i, env.lvl)), Tint) ++
    popq rax ++
    movq (ind ~ofs:(ofs - wordsz) rbp) (reg rcx) ++
    cmpq (reg rcx) (reg rax) ++
    (if rev then jl else jg) label_end ++
    compile_stmts env sl ++
    movq (ind ~ofs rbp) (reg rdi) ++
    (if rev then decq else incq) (reg rdi) ++
    movq (reg rdi) (ind ~ofs rbp) ++
    jmp label_start ++
    label label_end
  | TSaccess (TAident i, e) ->
    let _, _, sz, by_ref = Smap.find (fst i) env.vars in
    compile_expr env e ++
    movq (reg rbp) (reg rsi) ++
    compile_access env (TEaccess (TAident i), Tunit) ++
    subq (imm (sz - wordsz)) (reg rsi) ++
    iter (fun () -> popq rdi ++
                    movq (reg rdi) (ind rsi) ++
                    addq (imm wordsz) (reg rsi))
         (sz / wordsz) ()
  | TSaccess (TArecord ((_, lt) as el, i), er) ->
    let ofs, memsz = Smap.find i
      (SImap.find (ident_of_rec_type lt) env.rec_ofs) in
    compile_expr env er ++
    movq (reg rbp) (reg rsi) ++
    compile_access env el ++
    (if is_access lt then movq (ind rsi) (reg rsi) else nop) ++
    subq (imm (ofs + memsz)) (reg rsi) ++
    iter (fun () -> addq (imm wordsz) (reg rsi) ++
                    popq rdi ++
                    movq (reg rdi) (ind rsi))
         (memsz / wordsz) ()

(* Compile a list of statements *)
and compile_stmts env l =
  List.fold_left ( ++ ) nop (List.map (compile_stmt env) l)

(* Compile a whole program *)
let compile_prog tast =
  add_label ("put", 0);
  add_label ("new_line", 0);
  let code_inside, code_after, env = compile_decls
    empty_env [TDfunction (tast.main_name, [], Tunit, 
    tast.glob_decl, tast.stmts)] in
  {
    text =
      (* Main function *)
      glabel "main" ++
      code_inside ++
      code_after ++
      (* New_line function *)
      label (get_label ("new_line", 0)) ++
      movq (ilab ".new_line_c") (reg rdi) ++
      movq (imm 0) (reg rax) ++
      call "printf" ++
      ret ++
      (* Put function *)
      label (get_label ("put", 0)) ++
      movq (ind ~ofs:(2 * wordsz) rsp) (reg rsi) ++
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
