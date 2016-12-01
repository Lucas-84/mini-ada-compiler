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

module Smap = Map.Make(String)
module Sset = Set.Make(String)

type env = {
  decl_vars : typ Smap.t;
  decl_types : typ Smap.t;
  def_records : (typ Smap.t) Smap.t;
  def_procedures : ((mode option * typ) list) Smap.t;
  def_functions : ((mode option * typ) list * typ) Smap.t;
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
    def_procedures =
      Smap.add "put" [(None, Tchar)] (
        Smap.singleton "new_line" []
      );
    def_functions = Smap.empty;
  }

let string_of_typ = function
  | Tint      -> "int"
  | Tchar     -> "char"
  | Tbool     -> "bool"
  | Trecord r -> r
  | Taccess r -> "access " ^ r
  | Tnull     -> "access ..."

let are_types_equal t1 t2 = match (t1, t2) with
  | a, b when a = b -> true
  | (Tnull, Taccess _) -> true
  | (Taccess _, Tnull) -> true
  | _ -> false  

let check_types_equal t1 t2 loc =
  if not (are_types_equal t1 t2) then
    raise (Typing_error (t1, t2, loc))

let get_type env i iloc =
  try
    Smap.find i env.decl_vars
  with
    Not_found -> raise (Undeclared (i, iloc))

let get_member_type env r i eloc = 
  let rp = try
    Smap.find r env.def_records
  with Not_found -> raise (Undeclared (r, eloc))
  in 
  try
    Smap.find i rp
  with Not_found -> raise (Unknown_member (i, r, eloc)) 

let get_member_list env r loc =
  try
    Smap.find r env.def_records
  with Not_found -> raise (Undefined (r, loc))

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
    (TEaccess (TAident i), get_type env i e0loc)
  | Eaccess (Arecord (e, i)) ->
    let (_, etype) as et = type_expr env e in
    let itype = begin match etype with
      | Taccess r -> get_member_type env r i e0loc
      | _ -> raise (Typing_error (etype, Tnull, e0loc))
    end in
    (TEaccess (TArecord (et, i)), itype)
  | Ebinop (e1, op, e2) ->
    let (_, e1type) as e1t = type_expr env e1 in
    let (_, e2type) as e2t = type_expr env e2 in
    begin match op with
      | Badd | Bsub | Bmul | Bdiv | Brem | Bgt | Bge | Blt | Ble ->
        check_types_equal e1type Tint (snd e1);
        check_types_equal e2type Tint (snd e2);
        (TEbinop (e1t, op, e2t), Tint)
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
      List.combine pl el
    with Invalid_argument _ ->
      raise (Wrong_argument_number (List.length el, List.length pl, e0loc)) in
    List.iter (fun ((_, t1), (_, t2)) -> check_types_equal t1 t2 e0loc) lc;
    (TEcall (i, el), rt)


(* TODO : improve localization *)
(* TODO : add return value of typed declaration *)
and type_decl env (d, dloc) = match d with
  | Dtype i ->
    {
      env with
      decl_types = Smap.add i (Trecord i) env.decl_types;
    }
  | Daccesstype (i, t) ->
    check_is_declared env t dloc;
    {
      env with
      decl_types = Smap.add i (Taccess t) env.decl_types;
    }
  | Drecordtype (i, fl) ->
    let env' =
    {
      env with
      decl_types = Smap.add i (Trecord i) env.decl_types;
    } in
    let record_map = List.fold_left
      (fun ans (mem, stmem) ->
        let tmem = typ_of_stype env' stmem dloc in
        check_correctly_defined env' tmem dloc;
        Smap.add mem tmem ans)
      Smap.empty fl in
    {
      env with
      decl_types = Smap.add i (Trecord i) env.decl_types;
      def_records = Smap.add i record_map env.def_records; 
    }
  | Dident (il, st, None) ->
    let t = typ_of_stype env st dloc in
    check_correctly_defined env t dloc;
    {
      env with
      decl_vars = List.fold_left (fun ans x -> Smap.add x t ans) env.decl_vars il;
    }
  | Dident (il, st, Some e) ->
    let (etree, etype) = type_expr env e in
    let t = typ_of_stype env st dloc in
    check_correctly_defined env t dloc;
    check_types_equal t etype dloc;
    {
      env with
      decl_vars = List.fold_left (fun ans x -> Smap.add x t ans) env.decl_vars il;
    }
  | Dprocedure (i, pl, dl, sl) ->
    let pl = List.map (fun (x, y, z) -> 
      let t = typ_of_stype env z dloc in
      check_correctly_defined env t dloc;
      (x, y, t)) pl in
    let env =
    {
      env with
      def_procedures = Smap.add i (List.map (fun (x, y, z) -> (y, z)) pl) env.def_procedures;
    } in
    let env' = 
    {
      env with
      decl_vars = List.fold_left (fun ans (id, _, t) -> Smap.add id t ans) env.decl_vars pl
    } in
    let env' = type_decl_list env' dl in
    type_stmt_list env' sl;
    env
  | Dfunction (i, pl, rt, dl, sl) ->
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
    } in
    let env' = 
    {
      env with
      decl_vars = List.fold_left (fun ans (id, _, t) -> Smap.add id t ans) env.decl_vars pl
    } in
    let env' = type_decl_list env' dl in
    type_stmt_list env' sl;
    env

and type_decl_list env dl =
  List.fold_left (fun ans x -> type_decl ans x) env dl

and type_stmt env (s, sloc) = match s with
  | Saccess (Aident i, e) ->
    let (etree, etype) = type_expr env e in
    let t = get_type env i sloc in
    check_types_equal t etype sloc;
  | _ ->
    Format.eprintf "pas encore implemente\n@.";
    exit 2

and type_stmt_list env dl =
  List.iter (fun x -> type_stmt env x) dl

and type_file ast =
  let env = type_decl_list empty_env ast.glob_decl in
  type_stmt env (List.hd ast.stmts);

