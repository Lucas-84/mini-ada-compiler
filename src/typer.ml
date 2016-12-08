(*
 * Mini Ada typer
 *)
open Ast

exception Reserved_ident of ident * loc
exception Typing_error of typ * typ * loc 
exception Type_not_equal of typ * loc
exception Unknown_member of ident * ident * loc
exception Undeclared of ident * loc
exception Undefined of ident * loc
exception Wrong_argument_number of int * int * loc
exception Not_record of typ * loc
exception Not_lvalue of loc
exception Already_declared of ident * loc
exception Declared_not_defined of loc
exception Same_member of ident * loc
exception Recursive_dec of ident * loc
exception No_return of ident * loc
exception Bad_access_type of ident * loc
exception Used_before_end of ident * loc

module Smap = Map.Make(String)
module Sset = Set.Make(String)

module SImap = Map.Make(
  struct
    type t = string * int
    let compare (s1, i1) (s2, i2) =
      let sc = Pervasives.compare s1 s2 in
      if sc <> 0 then sc else Pervasives.compare i1 i2
  end)

type dtyp =
  | Dtyp_var_dec
  | Dtyp_typ_dec
  | Dtyp_rec_def
  | Dtyp_fun_def

type env = {
  dec_vars : typ Smap.t;
  dec_typs : typ SImap.t;
  def_recs : (typ Smap.t) SImap.t;
  def_funs : ((mode * typ) list * typ) Smap.t;
  const_vars : Sset.t;
  for_vars : Sset.t;
  idents : (dtyp * int) Smap.t;
  return_value : typ;
  level : int;
  nb_incomplete : int;
}

let dummy_loc =
  { fp = Lexing.dummy_pos; lp = Lexing.dummy_pos }

let reserved_idents = ["put"; "new_line"]

let string_of_typ = function
  | Tint           -> "int"
  | Tchar          -> "char"
  | Tbool          -> "bool"
  | Trecord (r, _) -> r
  | Taccess (r, _) -> "access " ^ r
  | Tnull          -> "access ..."
  | Tunit          -> "void"

let add_ident (i, loc) dec_typ level idents =
  try  
    let (prev_dec_typ, prev_level) = Smap.find i idents in
    if List.mem i reserved_idents then raise (Reserved_ident (i, loc))
    else if prev_level < level then raise Not_found 
    else if prev_dec_typ = Dtyp_typ_dec && dec_typ = Dtyp_rec_def then raise Not_found
    else raise (Already_declared (i, loc))
  with Not_found -> Smap.add i (dec_typ, level) idents

let add_var_dec (i, loc) typ is_const is_for env =
  { env with
    idents = add_ident (i, loc) Dtyp_var_dec env.level env.idents;
    dec_vars = Smap.add i typ env.dec_vars;
    const_vars = if is_const then Sset.add i env.const_vars else Sset.remove i env.const_vars;
    for_vars = if is_for then Sset.add i env.for_vars else Sset.remove i env.for_vars }
  
let add_rec_def (i, loc) members env =
  { env with
    idents = add_ident (i, loc) Dtyp_rec_def env.level env.idents;
    dec_typs = SImap.add (i, env.level) (Trecord (i, env.level)) env.dec_typs;
    def_recs = SImap.add (i, env.level) members env.def_recs;
    nb_incomplete = env.nb_incomplete - if SImap.mem (i, env.level) env.dec_typs then 1 else 0 }

let add_typ_dec (i, loc) t is_incomplete env =
  { env with
    idents = (try
      add_ident (i, loc) Dtyp_typ_dec env.level env.idents
    with Already_declared _ when not is_incomplete -> env.idents);
    dec_typs = SImap.add (i, env.level) t env.dec_typs;
    nb_incomplete = env.nb_incomplete + if is_incomplete then 1 else 0 }

let add_fun_def (i, loc) params ret_typ env =
  { env with
    idents = add_ident (i, loc) Dtyp_fun_def env.level env.idents;
    def_funs = Smap.add i (params, ret_typ) env.def_funs; }

let level_of_ident (i, loc) env =
  try
    snd (Smap.find i env.idents)
  with Not_found -> raise (Undeclared (i, loc))

let dtyp_of_ident (i, loc) env =
  try
    if Sset.mem i env.for_vars then raise (Used_before_end (i, loc));
    fst (Smap.find i env.idents)
  with Not_found -> raise (Undeclared (i, loc))

let var_typ_of_ident (i, loc) env =
  try
    let (dtyp, _) = Smap.find i env.idents in
    if dtyp <> Dtyp_var_dec then raise Not_found;
    Smap.find i env.dec_vars
  with Not_found -> raise (Undeclared (i, loc))

let mem_list_of_tident (i, loc) level env =
  try
    SImap.find (i, level) env.def_recs
  with Not_found -> raise (Undefined (i, loc))

let mem_list_of_ident (i, loc) env =
  try
    let (dtyp, level) = Smap.find i env.idents in
    if dtyp <> Dtyp_rec_def then raise Not_found;
    mem_list_of_tident (i, loc) level env
  with Not_found -> raise (Undefined (i, loc))

let mem_typ_of_tident (r, rloc) level (i, iloc) env =
  let ml = mem_list_of_tident (r, rloc) level env in
  try Smap.find i ml with Not_found -> raise (Unknown_member (i, r, iloc))

let mem_typ_of_ident (r, rloc) (i, iloc) env =
  let ml = mem_list_of_ident (r, rloc) env in
  try Smap.find i ml with Not_found -> raise (Unknown_member (i, r, iloc)) 
 
let dec_typ_of_tident (i, loc) level env =
  try
    SImap.find (i, level) env.dec_typs
  with Not_found -> raise (Undeclared (i, loc))

let dec_typ_of_ident (i, loc) env =
  try
    let (dtyp, level) = Smap.find i env.idents in
    if dtyp <> Dtyp_typ_dec && dtyp <> Dtyp_rec_def then raise Not_found;
    dec_typ_of_tident (i, loc) level env;
  with Not_found -> raise (Undeclared (i, loc))

let fun_of_ident (i, loc) env =
  try
    let (dtyp, _) = Smap.find i env.idents in
    if dtyp <> Dtyp_fun_def then raise Not_found;
    Smap.find i env.def_funs
  with Not_found -> raise (Undeclared (i, loc))

let empty_env name =
  let env = { dec_vars = Smap.empty;
              dec_typs = SImap.empty;
              def_recs = SImap.empty;
              def_funs = Smap.empty;
              const_vars = Sset.empty;
              for_vars = Sset.empty;
              idents = Smap.empty;
              return_value = Tunit;
              level = -1;
              nb_incomplete = 0 } in
  let env = add_typ_dec ("integer", dummy_loc) Tint false (
    add_typ_dec ("character", dummy_loc) Tchar false (
      add_typ_dec ("boolean", dummy_loc) Tbool false  (
        add_fun_def ("put", dummy_loc) [(Min, Tchar)] Tunit (
          add_fun_def ("new_line", dummy_loc) [] Tunit (
            add_fun_def name [] Tunit env
          )
        )
      )
    )
  ) in
  { env with level = 0 }

let are_types_equal t1 t2 = match (t1, t2) with
  | (a, b) when a = b -> true
  | (Tnull, Taccess _) | (Taccess _, Tnull) -> true
  | _ -> false  

let check_types_equal t1 t2 loc =
  if not (are_types_equal t1 t2) then raise (Typing_error (t1, t2, loc))

let check_types_not_equal t1 t2 loc =
  if are_types_equal t1 t2 then raise (Type_not_equal (t1, loc))

(* TODO : add a function to find the right type *)
let check_all_defined env loc =
  if env.nb_incomplete <> 0 then raise (Declared_not_defined (loc))

let check_is_declared i env =
  let _ = dec_typ_of_ident i env in ()

let check_is_defined r env = let _ =
  mem_list_of_ident r env in ()

let ident_of_stype (t, _) = match t with 
  | STident r -> r
  | STaccess r -> r
  | _ -> assert false 

let check_correctly_defined t loc env = match t with
  | Taccess (r, _) -> check_is_declared (r, loc) env
  | Trecord (r, _) -> check_is_defined (r, loc) env
  | _ -> ()

let typ_of_stype st env =
  let convert = function
    | STident r -> dec_typ_of_ident r env
    | STaccess r ->
      begin match dec_typ_of_ident r env with
        | Trecord (_, level) -> Taccess (fst r, level)
        | _ -> raise (Bad_access_type (fst r, snd r))
      end
    | STunit -> Tunit
  in
  let t = convert (fst st) in
  check_correctly_defined t (snd st) env;
  t

let check_no_duplicates l =
  let rec check = function
    | [] | [_] -> ()
    | (h1, _) :: (h2, loc) :: t when h1 = h2 -> raise (Same_member (h1, loc))
    | _ :: t -> check t
  in check (List.sort compare l)

let rec check_is_lvalue e loc env = match e with
  | TEaccess (TAident i) when not (Sset.mem i env.const_vars) -> ()
  | TEaccess (TArecord ((e', Taccess _), _)) -> ()
  | TEaccess (TArecord ((e', Trecord _), _)) -> check_is_lvalue e' loc env
  | _ -> raise (Not_lvalue loc)

let rec type_fun_call env is_exp i el loc =
  let etl = List.map (fun x -> type_expr env x, snd x) el in
  let (pl, rt) = fun_of_ident i env in
  (if is_exp then check_types_not_equal else check_types_equal) rt Tunit loc;
  let lc = try List.combine etl pl with Invalid_argument _ ->
    raise (Wrong_argument_number (List.length el, List.length pl, loc)) in
  List.iter (fun (((exp, typ1), eloc), (mode, typ2)) ->
    if mode = Minout then check_is_lvalue exp eloc env;
    check_types_equal typ1 typ2 eloc) lc;  
  (fst (List.split etl), rt)

and type_expr env (e, loc) = match e with
  | Enull   -> (TEnull, Tnull)
  | Eint n  -> (TEint n, Tint)
  | Echar c -> (TEchar c, Tchar)
  | Ebool b -> (TEbool b, Tbool)
  | Eaccess (Aident i, _) ->
    if dtyp_of_ident i env = Dtyp_fun_def then
      type_expr env (Ecall (i, []), loc)
    else
      (TEaccess (TAident (fst i)), var_typ_of_ident i env)
  | Eaccess (Arecord ((_, eloc) as e, i), _) ->
    let (_, etype) as et = type_expr env e in
    let itype = begin match etype with
      | Trecord r | Taccess r -> mem_typ_of_tident (fst r, eloc) (snd r) i env
      | _ -> raise (Not_record (etype, eloc))
    end in
    (TEaccess (TArecord (et, fst i)), itype)
  | Ebinop (e1, op, e2) ->
    let (_, e1type) as e1t = type_expr env e1 in
    let (_, e2type) as e2t = type_expr env e2 in
    begin match op with
      | Badd | Bsub | Bmul | Bdiv | Brem ->
        check_types_equal e1type Tint (snd e1);
        check_types_equal e2type Tint (snd e2);
        (TEbinop (e1t, op, e2t), Tint)
      | Bgt | Bge | Blt | Ble ->
        check_types_equal e1type Tint (snd e1);
        check_types_equal e2type Tint (snd e2);
        (TEbinop (e1t, op, e2t), Tbool)
      | Beq | Bneq ->
        check_types_equal e1type e2type (snd e1);
        (TEbinop (e1t, op, e2t), Tbool)
      | Band | Bandthen | Bor | Borelse ->
        check_types_equal e1type Tbool (snd e1);
        check_types_equal e2type Tbool (snd e2);
        (TEbinop (e1t, op, e2t), Tbool)
    end
  | Eneg e ->
    let (_, etype) as et = type_expr env e in
    if etype <> Tbool then raise (Typing_error (etype, Tbool, snd e))
    else (TEneg et, Tbool)
  | Enew i ->
    check_is_declared i env;
    (TEnew (fst i), Taccess (fst i, level_of_ident i env))
  | Echarval e ->
    let (_, etype) as et = type_expr env e in
    check_types_equal etype Tint (snd e);
    (TEcharval et, Tchar)
  | Ecall (i, el) ->
    let (el, rt) = type_fun_call env true i el loc in
    (TEcall (fst i, el), rt)

and type_decl env (d, loc) = match d with
  | Dtype i ->
    add_typ_dec i (Trecord (fst i, env.level)) true env, TDtype (fst i)
  | Daccesstype (i, t) ->
    check_is_declared t env;
    begin match dec_typ_of_ident t env with
      | Trecord _ -> ()
      | _ -> raise (Bad_access_type (fst t, loc))
    end;
    if fst i = fst t then raise (Recursive_dec (fst i, loc));
    add_typ_dec i (Taccess (fst t, (level_of_ident t env))) false env,
                   TDaccesstype (fst i, fst t)
  | Drecordtype (i, fl) ->
    let (field_idents, field_styp) = List.split fl in
    let field_name_str = fst (List.split field_idents) in
    check_no_duplicates field_idents;
    let env' = add_typ_dec i (Trecord (fst i, env.level)) false env in
    let field_typ = List.map (fun x -> typ_of_stype x env') field_styp in
    let nfl = List.combine field_name_str field_typ in
    let _ = List.fold_left (fun ans (s, st) ->
      let ans' = add_var_dec s (typ_of_stype st ans) false false ans in
      check_is_declared (ident_of_stype st) ans'; ans')
                        {env' with level = env'.level + 1}
                        (List.combine field_idents field_styp) in
    let record_map = List.fold_left (fun ans (s, t) -> Smap.add s t ans)
                                    Smap.empty nfl in
    (add_rec_def i record_map env, TDrecordtype (fst i, nfl))
  | Dident (il, ((_, stloc) as st), einit) ->
    let t = typ_of_stype st env in
    let teinit = begin match einit with
      | None -> None 
      | Some e ->
        let (_, etype) as et = type_expr env e in
        check_types_equal t etype (snd e);
        Some et
    end in
    let st_ident = ident_of_stype st in
    if List.mem (fst st_ident) (fst (List.split il)) then
      raise (Undeclared (fst st_ident, snd st_ident));
    (List.fold_left (fun ans x -> add_var_dec x t false false ans) env il,
     TDident (fst (List.split il), t, teinit))
  | Dfunction (i, pl, ((_, rtloc) as rt), dl, sl) ->
    check_all_defined env loc;
    let tpl = List.map (fun (id, m, st) -> (id, m, typ_of_stype st env)) pl in
    let rt = typ_of_stype rt env in
    let env = add_fun_def i (List.map (fun (_, m, t) -> (m, t)) tpl) rt env in
    let env' = List.fold_left
      (fun ans (id, mode, t) -> add_var_dec id t (mode = Min) false ans)
      {env with return_value = rt; level = env.level + 1} tpl in
    let (env', tdl) = type_decl_list env' dl in
    let (tsl, is_return) = type_stmt_list env' sl in
    if rt <> Tunit && not is_return then raise (No_return (fst i, loc));
    (env, TDfunction (fst i, List.map (fun (x, y, z) -> fst x, y, z) tpl,
                      rt, tdl, tsl))

and type_decl_list env dl =
  let (env, tdl) = List.fold_left
    (fun (penv, ptdl) d -> let (nenv, td) = type_decl penv d in
                           (nenv, td :: ptdl))
    (env, []) dl in
  try
    check_all_defined env (snd (List.hd (List.rev dl)));
    (env, tdl)
  with Failure _ -> (env, tdl)
  
and type_stmt env (s, loc) = match s with
  | Saccess ((Aident i, aloc), ((_, eloc) as e)) ->
    check_is_lvalue (TEaccess (TAident (fst i))) aloc env;
    let (_, etype) as et = type_expr env e in
    let t = var_typ_of_ident i env in
    check_types_equal etype t eloc;
    TSaccess (TAident (fst i), et), false
  | Saccess ((Arecord ((_, eloc) as e, i), aloc), ((_, eloc') as e')) ->
    let (_, etype) as et = type_expr env e in
    check_is_lvalue (TEaccess (TArecord (et, fst i))) eloc env;
    let (_, etype') as et' = type_expr env e' in
    let r = begin match etype with
      | Trecord r -> r
      | Taccess r -> r
      | _ -> raise (Not_record (etype, eloc))
    end in
    let t = mem_typ_of_tident (fst r, aloc) (snd r) i env in
    check_types_equal etype' t eloc';
    TSaccess (TArecord (et, fst i), et'), false
  | Scall (i, el) ->
    let (tel, rt) = type_fun_call env false i el loc in
    TScall (fst i, tel), false
  | Sblock sl ->
    let (stree, is_return) = type_stmt_list env sl in
    TSblock stree, is_return 
  | Sreturn None ->
    check_types_equal Tunit env.return_value loc;
    TSreturn None, true
  | Sreturn (Some e) ->
    let (_, etype) as et = type_expr env e in
    check_types_equal etype env.return_value (snd e);
    TSreturn (Some et), true
  | Swhile (e, sl) ->
    let (_, etype) as et = type_expr env e in
    check_types_equal etype Tbool (snd e);
    let (tsl, _) = type_stmt_list env sl in
    TSwhile (et, tsl), false
  | Sif (e, sl1, sl2) ->
    let (_, etype) as et = type_expr env e in
    check_types_equal etype Tbool (snd e);
    let (tsl1, is_return_1) = type_stmt_list env sl1 in
    let (tsl2, is_return_2) = type_stmt_list env sl2 in
    TSif (et, tsl1, tsl2), is_return_1 && is_return_2
  | Sfor (i, rev, e1, e2, sl) ->
    let env' = add_var_dec i Tint true true
                             { env with level = env.level + 1 } in
    let (_, etype1) as et1 = type_expr env' e1 in
    let (_, etype2) as et2 = type_expr env' e2 in
    let env' = add_var_dec i Tint true false
                             { env with level = env.level + 1 } in
    check_types_equal etype1 Tint (snd e1);
    check_types_equal etype2 Tint (snd e2);
    let (tsl, _) = type_stmt_list env' sl in
    TSfor (fst i, rev, et1, et2, tsl), false

and type_stmt_list env sl =
  List.fold_left (fun (ans_tsl, ans_return) x ->
    let h_tsl, h_return = type_stmt env x in
    (h_tsl :: ans_tsl, ans_return || h_return)) ([], false) sl

and type_file (ast : Ast.file) =
  let (env, tdl) = type_decl_list (empty_env ast.main_name) ast.glob_decl in
  { main_name = fst ast.main_name;
    glob_decl = tdl;
    stmts = fst (type_stmt_list env ast.stmts) }
