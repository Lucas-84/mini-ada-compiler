(**
 * - Execution doit terminer sur return
 * - Utilisation de access
 *)

(**
 * Mini-Ada typer
 *
 * Identifiers:
 * - integer
 * - character
 * - boolean
 * - typenull
 * etc. ?
 *)

open Ast
open Typed_ast

exception Typing_error of typ * typ * loc 
exception Type_nequal of typ * loc
exception Unknown_member of ident * ident * loc
exception Undeclared of ident * loc
exception Undefined of ident * loc
exception Wrong_argument_number of int * int * loc
exception Not_record of typ * loc
exception Not_lvalue of loc
exception Already_declared of ident * loc
exception Declared_not_defined of ident * loc
exception Same_member of ident * loc

module Smap = Map.Make(String)
module Sset = Set.Make(String)

type dec_type =
  | Dtype_dec
  | Dtype_def
  | Dtype_other

type env = {
  decl_vars : typ Smap.t;
  decl_types : typ Smap.t;
  def_records : (typ Smap.t) Smap.t;
  def_functions : ((mode * typ) list * typ) Smap.t;
  const_vars : Sset.t;
  identifiers : dec_type Smap.t;
  return_value : typ;
}

let empty_env =
  {
    decl_vars = Smap.empty;
    decl_types =
      Smap.add "integer" Tint (
        Smap.add "character" Tchar (
          Smap.singleton "boolean" Tbool
        )
      );
    def_records = Smap.empty;
    (* Check it is legal *)
    (* Nope (izi counter-example) *)
    def_functions =
      Smap.add "put" ([(Min, Tchar)], Tunit) (
        Smap.singleton "new_line" ([], Tunit)
      );
    const_vars = Sset.empty;
    identifiers = Smap.empty;
    return_value = Tunit;
  }

let add_identifier identifiers s dec_type loc =
  try  
    let prev_dec_type = Smap.find s identifiers in
    begin match (prev_dec_type, dec_type) with
      | (Dtype_dec, Dtype_def) -> raise Not_found 
      | _ -> raise (Already_declared (s, loc));
    end
  with Not_found -> Smap.add s dec_type identifiers

let string_of_typ = function
  | Tint      -> "int"
  | Tchar     -> "char"
  | Tbool     -> "bool"
  | Trecord r -> r
  | Taccess r -> "access " ^ r
  | Tnull     -> "access ..."
  | Tunit     -> "void"

let are_types_equal t1 t2 = match (t1, t2) with
  | a, b when a = b -> true
  | (Tnull, Taccess _) -> true
  | (Taccess _, Tnull) -> true
  | _ -> false  

let check_types_equal t1 t2 loc =
  if not (are_types_equal t1 t2) then
    raise (Typing_error (t1, t2, loc))

let check_types_not_equal t1 t2 loc =
  if are_types_equal t1 t2 then
    raise (Type_nequal (t1, loc))

let check_all_defined env loc =
  Smap.iter (fun id dec_type -> (match dec_type with Dtype_dec -> raise (Declared_not_defined (id, loc)) | _ -> ())) env.identifiers

let get_type env i iloc =
  try
    Smap.find i env.decl_vars
  with
    Not_found -> raise (Undeclared (i, iloc))

let get_member_list env r loc =
  try
    Smap.find r env.def_records
  with Not_found -> raise (Undefined (r, loc))

let get_member_type env r i eloc = 
  let rp = get_member_list env r eloc in
  try
    Smap.find i rp
  with Not_found -> raise (Unknown_member (i, r, eloc)) 

let type_of_name env i loc =
  try
    Smap.find i env.decl_types
  with Not_found -> raise (Undeclared (i, loc))

let check_is_declared env i loc = let _ = type_of_name env i loc in ()

let check_is_defined env r loc = let _ = get_member_list env r loc in ()

let typ_of_stype env st loc = match st with
  | STaccess r -> Taccess r
  | STident i -> type_of_name env i loc
  | STunit -> Tunit

let check_correctly_defined env t tloc = match t with
  | Taccess r -> check_is_declared env r tloc
  | Trecord r -> check_is_defined env r tloc
  | _ -> ()

let check_no_duplicates l loc =
  let rec check = function
    | [] | [_] -> ()
    | h1 :: h2 :: t when h1 = h2 -> raise (Same_member (h1, loc))
    | _ :: t -> check t
  in check (List.sort compare l)

let rec check_is_lvalue env e eloc = 
  let rec do_check e is_indirect =
    match e with
    | TEaccess (TAident i) when not (Sset.mem i env.const_vars) -> ()
    | TEaccess (TAident i) ->
      begin match get_type env i eloc with
        | Taccess r when is_indirect -> ();
        | _ -> raise (Not_lvalue (eloc));
      end
    | TEaccess (TArecord ((e', Trecord _), _)) -> do_check e' true 
    | TEaccess (TArecord ((e', Taccess r), _)) -> () 
    | _ ->
      raise (Not_lvalue (eloc)) in
  do_check e false

let rec type_fun_call is_exp env i el loc =
  let el = List.map (type_expr env) el in
  let (pl, rt) = try
    Smap.find i env.def_functions
  with Not_found ->
    raise (Undeclared (i, loc)) in
  (if is_exp then check_types_not_equal else check_types_equal) rt Tunit loc;
  let lc = try
    List.combine el pl
  with Invalid_argument _ ->
    raise (Wrong_argument_number (List.length el, List.length pl, loc)) in
  List.iter (fun ((e1, t1), (m2, t2)) -> if m2 = Minout then check_is_lvalue env e1 loc; check_types_equal t1 t2 loc) lc;  
  (el, rt)

and type_expr env (e0, e0loc) =
  match e0 with
  | Enull   -> (TEnull, Tnull)
  | Eint n  -> (TEint n, Tint)
  | Echar c -> (TEchar c, Tchar)
  | Ebool b -> (TEbool b, Tbool)
  | Eaccess (Aident i) ->
    (* Dirty hack *)
    if Smap.mem i env.def_functions then
      type_expr env (Ecall (i, []), e0loc)
    else (TEaccess (TAident i), get_type env i e0loc)
  | Eaccess (Arecord (e, i)) ->
    let (_, etype) as et = type_expr env e in
    let itype = begin match etype with
      | Trecord r | Taccess r -> get_member_type env r i e0loc
      | _ -> raise (Not_record (etype, e0loc))
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
        check_types_equal e1type e2type e0loc;
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
    check_is_declared env i e0loc;
    (TEnew i, Taccess i)
  | Echarval e ->
    let (_, etype) as et = type_expr env e in
    check_types_equal etype Tint (snd e);
    (TEcharval et, Tchar)
  | Ecall (i, el) ->
    let (el, rt) = type_fun_call true env i el e0loc in
    (TEcall (i, el), rt)

(* Maybe : typ_of_stype raise exception if not check_correctly_defined *)
(* TODO : improve localization *)
and type_decl env (d, dloc) = match d with
  | Dtype i ->
    {
      env with
      decl_types = Smap.add i (Trecord i) env.decl_types;
      identifiers = add_identifier env.identifiers i Dtype_dec dloc;
    }, TDtype i
  | Daccesstype (i, t) ->
    check_is_declared env t dloc;
    {
      env with
      decl_types = Smap.add i (Taccess t) env.decl_types;
      identifiers = add_identifier env.identifiers i Dtype_other dloc;
    }, TDaccesstype (i, t)
  | Drecordtype (i, fl) ->
    let (field_ids, field_styp) = List.split fl in
    check_no_duplicates (fst (List.split fl)) dloc;
    let env' =
    {
      env with
      decl_types = Smap.add i (Trecord i) env.decl_types;
      identifiers = Smap.empty;
    } in
    let field_typ = List.map (fun x -> typ_of_stype env' x dloc) field_styp in
    List.iter (fun x -> check_correctly_defined env' x dloc) field_typ;
    let nfl = List.combine field_ids field_typ in
    let record_map = List.fold_left (fun ans (s, t) -> Smap.add s t ans) Smap.empty nfl in
    {
      env' with
      def_records = Smap.add i record_map env.def_records; 
      identifiers = add_identifier env.identifiers i Dtype_def dloc;
    }, TDrecordtype (i, nfl)
  | Dident (il, st, einit) ->
    let t = typ_of_stype env st dloc in
    check_correctly_defined env t dloc;
    let teinit = begin match einit with
      | None -> None 
      | Some e ->
        let (_, etype) as et = type_expr env e in
        check_types_equal t etype dloc;
        Some et
    end in
    {
      env with
      decl_vars = List.fold_left (fun ans x -> Smap.add x t ans) env.decl_vars il;
      identifiers = List.fold_left (fun ans x -> add_identifier ans x Dtype_other dloc) env.identifiers il;
    }, TDident (il, t, teinit)
  | Dfunction (i, pl, rt, dl, sl) ->
    check_all_defined env dloc;
    let tpl = List.map (fun (id, m, t) -> (id, m, typ_of_stype env t dloc)) pl in
    List.iter (fun (_, _, t) -> check_correctly_defined env t dloc) tpl;
    let rt = typ_of_stype env rt dloc in
    check_correctly_defined env rt dloc;
    let env =
    {
      env with
      def_functions = Smap.add i (List.map (fun (_, m, t) -> (m, t)) tpl, rt) env.def_functions;
      identifiers = add_identifier env.identifiers i Dtype_other dloc;
    } in
    let env' = 
    {
      env with
      decl_vars = List.fold_left (fun ans (id, _, t) -> Smap.add id t ans) env.decl_vars tpl;
      const_vars = List.fold_left (fun ans (id, m, _) -> (begin match m with Min -> Sset.add id ans | _ -> ans end)) env.const_vars tpl;
      identifiers = List.fold_left (fun ans (id, _, _) -> add_identifier ans id Dtype_other dloc) Smap.empty tpl;
      return_value = rt;
    } in
    let (env', tdl) = type_decl_list env' dl in
    let tsl = type_stmt_list env' sl in
    (env, TDfunction (i, tpl, rt, tdl, tsl))

and type_decl_list env dl =
  let (env, tdl) = List.fold_left
    (fun (penv, ptdl) d -> let (nenv, td) = type_decl penv d in
                           (nenv, td :: ptdl))
    (env, []) dl in
  (* Dirty and wrong hack for localization *)
  try check_all_defined env (snd (List.hd dl)); (env, tdl) with Failure _ -> (env, tdl)

and type_stmt env (s, sloc) = match s with
  | Saccess (Aident i, e) ->
    let (_, etype) as et = type_expr env e in
    let t = get_type env i sloc in
    check_is_lvalue env (TEaccess (TAident i)) sloc;
    check_types_equal t etype sloc;
    TSaccess (TAident i, et)
  | Saccess (Arecord (e, i), e') ->
    let (_, etype) as et = type_expr env e in
    let (_, etype') as et' = type_expr env e' in
    let r = begin match etype with
      | Trecord r -> r
      | Taccess r -> r
      | _ -> raise (Not_record (etype, sloc))
    end in
    let t = get_member_type env r i sloc in
    check_types_equal t etype' sloc;
    check_is_lvalue env (TEaccess (TArecord (et, i))) sloc;
    TSaccess (TArecord (et, i), et')
  | Scall (i, el) ->
    let (tel, rt) = type_fun_call false env i el sloc in
    TScall (i, tel)
  | Sblock sl ->
    TSblock (type_stmt_list env sl)
  | Sreturn None ->
    check_types_equal Tunit env.return_value sloc;
    TSreturn None;
  | Sreturn (Some e) ->
    let (_, etype) as et = type_expr env e in
    check_types_equal etype env.return_value sloc;
    TSreturn (Some et)
  | Swhile (e, sl) ->
    let (_, etype) as et = type_expr env e in
    check_types_equal etype Tbool sloc;
    let tsl = type_stmt_list env sl in
    TSwhile (et, tsl)
  | Sif (e, sl1, sl2) ->
    let (_, etype) as et = type_expr env e in
    check_types_equal etype Tbool sloc;
    let tsl1 = type_stmt_list env sl1 in
    let tsl2 = type_stmt_list env sl2 in
    TSif (et, tsl1, tsl2)
  | Sfor (i, rev, e1, e2, sl) ->
    let (_, etype1) as et1 = type_expr env e1 in
    let (_, etype2) as et2 = type_expr env e2 in
    let env' = { env with decl_vars = Smap.add i Tint env.decl_vars;
                          const_vars = Sset.add i env.const_vars } in
    check_types_equal etype1 Tint sloc;
    check_types_equal etype2 Tint sloc;
    let tsl = type_stmt_list env' sl in
    TSfor (i, rev, et1, et2, tsl)

and type_stmt_list env sl =
  List.map (fun x -> type_stmt env x) sl

(* /!\ recursive main ??? *)
and type_file (ast : Ast.file) =
  let (env, tdl) = type_decl_list empty_env ast.glob_decl in
  {
    main_name = ast.main_name;
    glob_decl = tdl;
    stmts = type_stmt_list env ast.stmts;
  }

