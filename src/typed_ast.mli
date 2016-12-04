(**
 * Typed abstract syntax tree of Mini Ada
 *)

open Ast

type tident = ident * int

and typ =
  Tint | Tchar | Tbool | Trecord of tident | Taccess of tident | Tnull | Tunit

and tfile = {
  main_name : ident;
  glob_decl : tdecl list;
  stmts : tstmt list;
}

and tdecl =
  | TDtype of ident
  | TDaccesstype of ident * ident
  | TDrecordtype of ident * tfield list
  | TDident of ident list * typ * texpr option
  | TDfunction of ident * tparam list * typ * tdecl list * tstmt list

and tfield = ident * typ
and tparam = ident * mode * typ

and tstmt =
  | TSaccess of taccess * texpr
  | TScall of ident * texpr list
  | TSreturn of texpr option
  | TSblock of tstmt list
  | TSif of texpr * tstmt list * tstmt list
  | TSfor of ident * bool * texpr * texpr * tstmt list
  | TSwhile of texpr * tstmt list

and taccess =
  | TAident of ident
  | TArecord of texpr * ident

and texpr = texpr_desc * typ
and texpr_desc =
  | TEint of int
  | TEchar of char
  | TEbool of bool
  | TEnull
  | TEaccess of taccess
  | TEbinop of texpr * binop * texpr
  | TEneg of texpr
  | TEnew of ident
  | TEcall of ident * texpr list
  | TEcharval of texpr
