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

module Smap = Map.Make(String)
module Sset = Set.Make(String)

type env = {
  decl_vars : typ Smap.t;
  decl_types : typ Smap.t;
  def_records : (typ Smap.t) Smap.t;
}

let empty_env =
  {
    decl_vars = Smap.empty;
    decl_types =
      Smap.add "integer" Tint (
        Smap.add "character" Tchar (
          Smap.singleton "boolean" Tbool;
        )
      );
    def_records = Smap.empty;
  }

let are_types_equal t1 t2 = match (t1, t2) with
  | (Tint, Tint) | (Tchar, Tchar) -> true
  | (Trecord r1, Trecord r2) when r1 = r2 -> true
  | (Taccess r1, Taccess r2) when r1 = r2 -> true
  | (Tnull, Taccess _) -> true
  | _ -> false

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
    begin match op with
      | Badd | Bsub | Bmul | Bdiv | Brem ->
        let (_, e1type) as e1t = type_expr env e1 in
        let (_, e2type) as e2t = type_expr env e2 in
        begin match (e1type, e2type) with
          | (Tint, Tint) ->
            (TEbinop (e1t, op, e2t), Tint)
          | (t1, _) when t1 <> Tint ->
            raise (Typing_error (e1type, Tint, snd e1))
          | (_, _) ->
            raise (Typing_error (e2type, Tint, snd e2))
        end
      | _ -> failwith "pas encore implemente"
    end
  | _ ->
    Format.eprintf "Pas encore implemente\n@.";
    exit 2

let is_defined env r =
  Smap.mem r env.def_records

let is_declared env r =
  Smap.mem r env.decl_types

let typ_of_stype env st loc = match st with
  | STaccess r -> Taccess r
  | STident i ->
    begin
      try
        Smap.find i env.decl_types
      with Not_found -> raise (Undeclared (i, loc))
    end

let check_correctly_defined env t tloc = match t with
  | Taccess r when not (is_declared env r) ->
    raise (Undeclared (r, tloc))
  | Trecord r when not (is_defined env r) ->
    raise (Undefined (r, tloc))
  | _ -> ()

(* TODO : improve localization *)
(* TODO : add return value of typed declaration *)
let rec type_decl env (d, dloc) = match d with
  | Dtype i ->
    {
      decl_vars = env.decl_vars;
                              (* access? *)
      decl_types = Smap.add i (Trecord i) env.decl_types;
      def_records = env.def_records;
    }
  | Daccesstype (i, t) ->
    if not (is_declared env t) then
      raise (Undeclared (t, dloc));
    {
      decl_vars = env.decl_vars;
      decl_types = Smap.add i (Taccess t) env.decl_types;
      def_records = env.def_records;
    }
  | Drecordtype (i, fl) ->
    let env' = {
      decl_vars = env.decl_vars;
      decl_types = Smap.add i (Trecord i) env.decl_types;
      def_records = env.def_records;
    } in
    let tl = List.fold_left
      (fun ans (il, t) -> (List.fold_left
        (fun rem x -> (x, t) :: rem) [] il) @ ans)
      [] fl in
    let record_map = List.fold_left
      (fun ans (mem, stmem) ->
        let tmem = typ_of_stype env' stmem dloc in
        check_correctly_defined env' tmem dloc;
        Smap.add mem tmem ans)
      Smap.empty tl in
    {
      decl_vars = env.decl_vars;
      decl_types = Smap.add i (Trecord i) env.decl_types;
      def_records = Smap.add i record_map env.def_records; 
    }
  | Dident (il, st, None) ->
    let t = typ_of_stype env st dloc in
    check_correctly_defined env t dloc;
    {
      decl_vars = List.fold_left (fun ans x -> Smap.add x t ans) env.decl_vars il;
      decl_types = env.decl_types;
      def_records = env.def_records;
    }
  | Dident (il, st, Some e) ->
    let (etree, etype) = type_expr env e in
    let t = typ_of_stype env st dloc in
    check_correctly_defined env t dloc;
    if not (are_types_equal t etype) then
      raise (Typing_error (etype, t, dloc));
    {
      decl_vars = List.fold_left (fun ans x -> Smap.add x t ans) env.decl_vars il;
      decl_types = env.decl_types;
      def_records = env.def_records;
    }
  | _ ->
    Format.eprintf "pas encore implemente\n";
    exit 2

let rec type_stmt env (s, sloc) = match s with
  | Saccess (Aident i, e) ->
    let (etree, etype) = type_expr env e in
    let t = get_type env i sloc in
    if not (are_types_equal t etype) then
      raise (Typing_error (etype, t, sloc));
    ()
  | _ ->
    Format.eprintf "pas encore implemente\n@.";
    exit 2

let type_decl_list env dl =
  List.fold_left (fun ans x -> type_decl ans x) env dl

let type_file ast =
  let env = type_decl_list empty_env ast.glob_decl in
  type_stmt env (List.hd ast.stmts);

