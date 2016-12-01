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
(*exception Unknown_variable of ident * loc*)
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
  def_procedures : ((mode * typ) list) Smap.t;
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
    def_procedures =
      Smap.add "put" [(Min, Tchar)] (
        Smap.singleton "new_line" []
      );
    def_functions = Smap.empty;
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

(**
(* ('a list * 'b) list -> ('a * 'b) list *)
let assemble l =
  List.fold_left (fun ans (l', x2) -> (List.fold_left
    (fun ans' x1 -> (x1, x2) :: ans') [] l') @ ans)
    [] l
**)

let rec type_expr env (e0, e0loc) =
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
    let el = List.map (type_expr env) el in
    let (pl, rt) = try
      Smap.find i env.def_functions
    with Not_found ->
      raise (Undeclared (i, e0loc)) in
    let lc = try
      List.combine el pl
    with Invalid_argument _ ->
      raise (Wrong_argument_number (List.length el, List.length pl, e0loc)) in
    List.iter (fun ((e1, t1), (m2, t2)) -> if m2 = Minout then check_is_lvalue env e1 e0loc; check_types_equal t1 t2 e0loc) lc;
    (TEcall (i, el), rt)

(* TODO : improve localization *)
(* TODO : add return value of typed declaration *)
and type_decl env (d, dloc) = match d with
  | Dtype i ->
    {
      env with
      decl_types = Smap.add i (Trecord i) env.decl_types;
      identifiers = add_identifier env.identifiers i Dtype_dec dloc;
    }
  | Daccesstype (i, t) ->
    check_is_declared env t dloc;
    {
      env with
      decl_types = Smap.add i (Taccess t) env.decl_types;
      identifiers = add_identifier env.identifiers i Dtype_other dloc;
    }
  | Drecordtype (i, fl) ->
    check_no_duplicates (fst (List.split fl)) dloc;
    let env' =
    {
      env with
      decl_types = Smap.add i (Trecord i) env.decl_types;
      identifiers = Smap.empty;
    } in
    let record_map = List.fold_left
      (fun ans (mem, stmem) ->
        let tmem = typ_of_stype env' stmem dloc in
        check_correctly_defined env' tmem dloc;
        Smap.add mem tmem ans)
      Smap.empty fl in
    {
      env' with
      def_records = Smap.add i record_map env.def_records; 
      identifiers = add_identifier env.identifiers i Dtype_def dloc;
    }
  | Dident (il, st, None) ->
    let t = typ_of_stype env st dloc in
    check_correctly_defined env t dloc;
    {
      env with
      decl_vars = List.fold_left (fun ans x -> Smap.add x t ans) env.decl_vars il;
      identifiers = List.fold_left (fun ans x -> add_identifier ans x Dtype_other dloc) env.identifiers il;
    }
  | Dident (il, st, Some e) ->
    let (etree, etype) = type_expr env e in
    let t = typ_of_stype env st dloc in
    check_correctly_defined env t dloc;
    check_types_equal t etype dloc;
    {
      env with
      decl_vars = List.fold_left (fun ans x -> Smap.add x t ans) env.decl_vars il;
      identifiers = List.fold_left (fun ans x -> add_identifier ans x Dtype_other dloc) env.identifiers il;
    }
  | Dprocedure (i, pl, dl, sl) ->
    check_all_defined env dloc;
    let pl = List.map (fun (x, y, z) -> 
      let t = typ_of_stype env z dloc in
      check_correctly_defined env t dloc;
      (x, y, t)) pl in
    let env =
    {
      env with
      def_procedures = Smap.add i (List.map (fun (x, y, z) -> (y, z)) pl) env.def_procedures;
      identifiers = add_identifier env.identifiers i Dtype_other dloc;
    } in
    let env' = 
    {
      env with
      decl_vars = List.fold_left (fun ans (id, _, t) -> Smap.add id t ans) env.decl_vars pl;
      const_vars = List.fold_left (fun ans (id, m, _) -> (begin match m with Min -> Sset.add id ans | _ -> ans end)) env.const_vars pl;
      identifiers = List.fold_left (fun ans (id, _, _) -> add_identifier ans id Dtype_other dloc) Smap.empty pl;
      return_value = Tunit;
    } in
    let env' = type_decl_list env' dl in
    type_stmt_list env' sl;
    env
  | Dfunction (i, pl, rt, dl, sl) ->
    check_all_defined env dloc;
    let pl = List.map (fun (x, y, z) -> 
      let t = typ_of_stype env z dloc in
      check_correctly_defined env t dloc;
      (x, y, t)) pl in
    let rt = typ_of_stype env rt dloc in
    check_correctly_defined env rt dloc;
    let env =
    {
      env with
      def_functions = Smap.add i (List.map (fun (x, y, z) -> (y, z)) pl, rt) env.def_functions;
      identifiers = add_identifier env.identifiers i Dtype_other dloc;
    } in
    let env' = 
    {
      env with
      decl_vars = List.fold_left (fun ans (id, _, t) -> Smap.add id t ans) env.decl_vars pl;
      const_vars = List.fold_left (fun ans (id, m, _) -> (begin match m with Min -> Sset.add id ans | _ -> ans end)) env.const_vars pl;
      identifiers = List.fold_left (fun ans (id, _, _) -> add_identifier ans id Dtype_other dloc) Smap.empty pl;
      return_value = rt;
    } in
    let env' = type_decl_list env' dl in
    type_stmt_list env' sl;
    env

and type_decl_list env dl =
  let env = (List.fold_left (fun ans x -> type_decl ans x) env dl) in
  (* Dirty and wrong hack for localization *)
  try check_all_defined env (snd (List.hd dl)); env with Failure _ -> env

and type_stmt env (s, sloc) = match s with
  | Saccess (Aident i, e) ->
    let (etree, etype) = type_expr env e in
    let t = get_type env i sloc in
    check_is_lvalue env (TEaccess (TAident i)) sloc;
    check_types_equal t etype sloc;
  | Saccess (Arecord (e, i), e') ->
    let (etree, etype) = type_expr env e in
    let (etree', etype') = type_expr env e' in
    let r = begin match etype with
      | Trecord r -> r
      | Taccess r -> r
      | _ -> raise (Not_record (etype, sloc))
    end in
    let t = get_member_type env r i sloc in
    check_types_equal t etype' sloc;
    check_is_lvalue env (TEaccess (TArecord ((etree, etype), i))) sloc;
  | Scall (i, el) ->
    let el = List.map (type_expr env) el in
    let pl = try
      Smap.find i env.def_procedures
    with Not_found ->
      raise (Undeclared (i, sloc)) in
    let lc = try
      List.combine el pl
    with Invalid_argument _ ->
      raise (Wrong_argument_number (List.length el, List.length pl, sloc)) in
    List.iter (fun ((e1, t1), (m2, t2)) -> if m2 = Minout then check_is_lvalue env e1 sloc; check_types_equal t1 t2 sloc) lc;
  | Sblock sl ->
    type_stmt_list env sl
  | Sreturn None ->
    check_types_equal Tunit env.return_value sloc
  | Sreturn (Some e) ->
    let (etree, etype) = type_expr env e in
    check_types_equal etype env.return_value sloc
  | Swhile (e, sl) ->
    let (etree, etype) = type_expr env e in
    check_types_equal etype Tbool sloc;
    type_stmt_list env sl
  | Sif (e, i1, i2) ->
    let (etree, etype) = type_expr env e in
    check_types_equal etype Tbool sloc;
    type_stmt_list env i1;
    type_stmt_list env i2
  | Sfor (i, rev, e1, e2, sl) ->
    let (etree1, etype1) = type_expr env e1 in
    let (etree2, etype2) = type_expr env e2 in
    let env' = { env with decl_vars = Smap.add i Tint env.decl_vars;
                          const_vars = Sset.add i env.const_vars } in
    check_types_equal etype1 Tint sloc;
    check_types_equal etype2 Tint sloc;
    type_stmt_list env' sl

and type_stmt_list env sl =
  List.iter (fun x -> type_stmt env x) sl

and type_file ast =
  let env = type_decl_list empty_env ast.glob_decl in
  type_stmt env (List.hd ast.stmts);

