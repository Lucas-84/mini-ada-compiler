open Ast
open Typed_ast
(* DEBUG *) open Printf

(* TODO *)
let dummy_loc =
  { fp = Lexing.dummy_pos; lp = Lexing.dummy_pos }

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

module Smap = Map.Make(String)
module Sset = Set.Make(String)

module SImap = Map.Make(
  struct
    type t = string * int
    let compare (s1, i1) (s2, i2) =
      let sc = Pervasives.compare s1 s2 in
      if sc <> 0 then sc else Pervasives.compare i1 i2
  end)

type dec_typ =
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
  idents : (dec_typ * int) Smap.t;
  return_value : typ;
  level : int;
  nb_incomplete : int;
}

let reserved_idents = ["put"; "newline"]

(********************************************************************************)
let add_ident i dec_typ level loc idents =
  try  
    let (prev_dec_typ, prev_level) = Smap.find i idents in
    if List.mem i reserved_idents then raise (Reserved_ident (i, loc))
    else if prev_level < level then raise Not_found 
    else if prev_dec_typ = Dtyp_typ_dec && dec_typ = Dtyp_rec_def then raise Not_found
    else raise (Already_declared (i, loc))
  with Not_found -> Smap.add i (dec_typ, level) idents

let add_var_dec i typ is_const loc env =
  { env with
    idents = add_ident i Dtyp_var_dec env.level loc env.idents;
    dec_vars = Smap.add i typ env.dec_vars;
    const_vars = if is_const then Sset.add i env.const_vars else env.const_vars }
  
let add_rec_def i members loc env =
  { env with
    idents = add_ident i Dtyp_rec_def env.level loc env.idents;
    dec_typs = SImap.add (i, env.level) (Trecord (i, env.level)) env.dec_typs;
    def_recs = SImap.add (i, env.level) members env.def_recs;
    nb_incomplete = env.nb_incomplete - if SImap.mem (i, env.level) env.dec_typs then 1 else 0 }

let add_typ_dec i t is_incomplete loc env =
  { env with
    idents = (try
      add_ident i Dtyp_typ_dec env.level loc env.idents
    with Already_declared _ when not is_incomplete -> env.idents);
    dec_typs = SImap.add (i, env.level) t env.dec_typs;
    nb_incomplete = env.nb_incomplete + if is_incomplete then 1 else 0 }

let add_fun_def i params ret_typ loc env =
  { env with
    idents = add_ident i Dtyp_fun_def env.level loc env.idents;
    def_funs = Smap.add i (params, ret_typ) env.def_funs; }

(********************************************************************************)
let level_of_ident i loc env =
  try
    snd (Smap.find i env.idents)
  with Not_found -> raise (Undeclared (i, loc))

let var_typ_of_ident i loc env =
  try
    let (dtyp, _) = Smap.find i env.idents in
    (* TODO *)
    if dtyp <> Dtyp_var_dec then assert false;
    Smap.find i env.dec_vars
  with Not_found -> raise (Undeclared (i, loc))

let mem_list_of_tident (i, level) loc env =
  try
    SImap.find (i, level) env.def_recs
  with Not_found -> raise (Undefined (i, loc))

let mem_list_of_ident i loc env =
  try
    let (dtyp, level) = Smap.find i env.idents in
    if dtyp <> Dtyp_rec_def then raise Not_found;
    mem_list_of_tident (i, level) loc env
  with Not_found -> raise (Undefined (i, loc))

let mem_typ_of_tident r i loc env =
  let ml = mem_list_of_tident r loc env in
  try Smap.find i ml with Not_found -> raise (Unknown_member (i, fst r, loc))

let mem_typ_of_ident r i loc env =
  let ml = mem_list_of_ident r loc env in
  try Smap.find i ml with Not_found -> raise (Unknown_member (i, r, loc)) 
 
let dec_typ_of_tident i level loc env =
  try
    SImap.find (i, level) env.dec_typs
  with Not_found -> raise (Undeclared (i, loc))

let dec_typ_of_ident i loc env =
  try
    let (dtyp, level) = Smap.find i env.idents in
    if dtyp <> Dtyp_typ_dec && dtyp <> Dtyp_rec_def then raise Not_found;
    dec_typ_of_tident i level loc env;
  with Not_found -> raise (Undeclared (i, loc))

let fun_of_ident i loc env =
  try
    let (dtyp, _) = Smap.find i env.idents in
    if dtyp <> Dtyp_fun_def then raise Not_found;
    Smap.find i env.def_funs
  with Not_found -> raise (Undeclared (i, loc))

(********************************************************************************)
let empty_env name =
  let env = { dec_vars = Smap.empty;
              dec_typs = SImap.empty;
              def_recs = SImap.empty;
              def_funs = Smap.empty;
              const_vars = Sset.empty;
              idents = Smap.empty;
              return_value = Tunit;
              level = -1;
              nb_incomplete = 0} in
  let env = add_typ_dec "integer" Tint false dummy_loc (
    add_typ_dec "character" Tchar false dummy_loc (
      add_typ_dec "boolean" Tbool false dummy_loc (
        add_fun_def "put" [(Min, Tchar)] Tunit dummy_loc (
          add_fun_def "new_line" [] Tunit dummy_loc env
        )
      )
    )
  ) in
  { env with level = 0 }

let string_of_typ = function
  | Tint           -> "int"
  | Tchar          -> "char"
  | Tbool          -> "bool"
  | Trecord (r, _) -> r
  | Taccess (r, d) -> (string_of_int d) ^ " " ^ "access " ^ r
  | Tnull          -> "access ..."
  | Tunit          -> "void"

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

let check_is_declared i loc env = let _ = dec_typ_of_ident i loc env in ()

let check_is_defined r loc env = let _ = mem_list_of_ident r loc env in ()

let typ_of_stype st loc env =
  match st with
  | STident r  -> dec_typ_of_ident r loc env
  | STaccess r ->
    begin match dec_typ_of_ident r loc env with
      | Taccess (_, level) -> Taccess (r, level)
      | Trecord (_, level) -> Taccess (r, level)
      (* TODO: Pointer on a non-structure type *)
      | _ -> assert false
    end
  | STunit     -> Tunit

let check_correctly_defined t loc env = match t with
  | Taccess (r, _) -> check_is_declared r loc env
  | Trecord (r, _) -> check_is_defined r loc env
  | _ -> ()

let check_no_duplicates l loc =
  let rec check = function
    | [] | [_] -> ()
    | h1 :: h2 :: t when h1 = h2 -> raise (Same_member (h1, loc))
    | _ :: t -> check t
  in check (List.sort compare l)

let rec check_is_lvalue e loc env = match e with
  | TEaccess (TAident i) when not (Sset.mem i env.const_vars) -> ()
  | TEaccess (TArecord ((e', Taccess _), _)) -> ()
  | TEaccess (TArecord ((e', Trecord _), _)) -> check_is_lvalue e' loc env
  | _ -> raise (Not_lvalue loc)

(********************************************************************************)
let rec type_fun_call env is_exp i el loc =
  let etl = List.map (type_expr env) el in
  let (pl, rt) = fun_of_ident i loc env in
  (if is_exp then check_types_not_equal else check_types_equal) rt Tunit loc;
  let lc = try List.combine etl pl with Invalid_argument _ -> raise (Wrong_argument_number (List.length el, List.length pl, loc)) in
  List.iter (fun ((exp, typ1), (mode, typ2)) -> if mode = Minout then check_is_lvalue exp loc env; check_types_equal typ1 typ2 loc) lc;  
  (etl, rt)

and type_expr env (e, loc) = match e with
  | Enull   -> (TEnull, Tnull)
  | Eint n  -> (TEint n, Tint)
  | Echar c -> (TEchar c, Tchar)
  | Ebool b -> (TEbool b, Tbool)
  | Eaccess (Aident i) ->
    if Smap.mem i env.def_funs then type_expr env (Ecall (i, []), loc)
    else (TEaccess (TAident i), var_typ_of_ident i loc env)
  | Eaccess (Arecord (e, i)) ->
    let (_, etype) as et = type_expr env e in
    let itype = begin match etype with
      | Trecord r | Taccess r -> mem_typ_of_tident r i loc env
      | _ -> raise (Not_record (etype, loc))
    end in
    (TEaccess (TArecord (et, i)), itype)
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
        check_types_equal e1type e2type loc;
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
    check_is_declared i loc env;
    (TEnew i, Taccess (i, level_of_ident i loc env))
  | Echarval e ->
    let (_, etype) as et = type_expr env e in
    check_types_equal etype Tint (snd e);
    (TEcharval et, Tchar)
  | Ecall (i, el) ->
    let (el, rt) = type_fun_call env true i el loc in
    (TEcall (i, el), rt)

(* Maybe : typ_of_stype raise exception if not check_correctly_defined *)
(* TODO : improve localization *)
(* TODO : fields legal identifiers? *)
and type_decl env (d, loc) = match d with
  | Dtype i ->
    add_typ_dec i (Trecord (i, env.level)) true loc env, TDtype i 
  | Daccesstype (i, t) ->
    check_is_declared t loc env;
    if i = t then raise (Recursive_dec (i, loc));
    add_typ_dec i (Taccess (t, (level_of_ident t loc env))) false loc env, TDaccesstype (i, t)
  | Drecordtype (i, fl) ->
    let (field_ids, field_styp) = List.split fl in
    check_no_duplicates (fst (List.split fl)) loc;
    let env' = add_typ_dec i (Trecord (i, env.level)) false loc env in
    let field_typ = List.map (fun x -> typ_of_stype x loc env') field_styp in
    List.iter (fun x -> check_correctly_defined x loc env') field_typ;
    let nfl = List.combine field_ids field_typ in
    let record_map = List.fold_left (fun ans (s, t) -> Smap.add s t ans) Smap.empty nfl in
    (add_rec_def i record_map loc env, TDrecordtype (i, nfl))
  | Dident (il, st, einit) ->
    let t = typ_of_stype st loc env in
    check_correctly_defined t loc env;
    let teinit = begin match einit with
      | None -> None 
      | Some e ->
        let (_, etype) as et = type_expr env e in
        check_types_equal t etype loc;
        Some et
    end in
    (List.fold_left (fun ans x -> add_var_dec x t false loc ans) env il, TDident (il, t, teinit))
  | Dfunction (i, pl, rt, dl, sl) ->
    check_all_defined env loc;
    let tpl = List.map (fun (id, m, t) -> (id, m, typ_of_stype t loc env)) pl in
    List.iter (fun (_, _, t) -> check_correctly_defined t loc env) tpl;
    let rt = typ_of_stype rt loc env in
    check_correctly_defined rt loc env;
    let env = add_fun_def i (List.map (fun (_, m, t) -> (m, t)) tpl) rt loc env in
    let env' = List.fold_left (fun ans (id, mode, t) -> add_var_dec id t (mode = Min) loc ans) {env with return_value = rt; level = env.level + 1} tpl in
    let (env', tdl) = type_decl_list env' dl in
    let tsl = type_stmt_list env' sl in
    (env, TDfunction (i, tpl, rt, tdl, tsl))

and type_decl_list env dl =
  let (env, tdl) = List.fold_left
    (fun (penv, ptdl) d -> let (nenv, td) = type_decl penv d in
                           (nenv, td :: ptdl))
    (env, []) dl in
  (* TODO: Dirty and wrong hack for localization *)
  try check_all_defined env (snd (List.hd dl)); (env, tdl) with Failure _ -> (env, tdl)

and type_stmt env (s, loc) = match s with
  | Saccess (Aident i, e) ->
    let (_, etype) as et = type_expr env e in
    let t = var_typ_of_ident i loc env in
    check_is_lvalue (TEaccess (TAident i)) loc env;
    check_types_equal t etype loc;
    TSaccess (TAident i, et)
  | Saccess (Arecord (e, i), e') ->
    let (_, etype) as et = type_expr env e in
    let (_, etype') as et' = type_expr env e' in
    let r = begin match etype with
      | Trecord r -> r
      | Taccess r -> r
      | _ -> raise (Not_record (etype, loc))
    end in
    let t = mem_typ_of_tident r i loc env in
    check_types_equal t etype' loc;
    check_is_lvalue (TEaccess (TArecord (et, i))) loc env;
    TSaccess (TArecord (et, i), et')
  | Scall (i, el) ->
    let (tel, rt) = type_fun_call env false i el loc in
    TScall (i, tel)
  | Sblock sl ->
    TSblock (type_stmt_list env sl)
  | Sreturn None ->
    check_types_equal Tunit env.return_value loc;
    TSreturn None;
  | Sreturn (Some e) ->
    let (_, etype) as et = type_expr env e in
    check_types_equal etype env.return_value loc;
    TSreturn (Some et)
  | Swhile (e, sl) ->
    let (_, etype) as et = type_expr env e in
    check_types_equal etype Tbool loc;
    let tsl = type_stmt_list env sl in
    TSwhile (et, tsl)
  | Sif (e, sl1, sl2) ->
    let (_, etype) as et = type_expr env e in
    check_types_equal etype Tbool loc;
    let tsl1 = type_stmt_list env sl1 in
    let tsl2 = type_stmt_list env sl2 in
    TSif (et, tsl1, tsl2)
  | Sfor (i, rev, e1, e2, sl) ->
    let (_, etype1) as et1 = type_expr env e1 in
    let (_, etype2) as et2 = type_expr env e2 in
    let env' = add_var_dec i Tint true loc { env with level = env.level + 1 } in
    check_types_equal etype1 Tint loc;
    check_types_equal etype2 Tint loc;
    let tsl = type_stmt_list env' sl in
    TSfor (i, rev, et1, et2, tsl)

and type_stmt_list env sl =
  List.map (fun x -> type_stmt env x) sl

and type_file (ast : Ast.file) =
  let (env, tdl) = type_decl_list (empty_env ast.main_name) ast.glob_decl in
  {
    main_name = ast.main_name;
    glob_decl = tdl;
    stmts = type_stmt_list env ast.stmts;
  }

