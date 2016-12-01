(**
 * Typed abstract syntax tree of Mini Ada
 *)

open Ast

type typ =
  Tint | Tchar | Tbool | Trecord of ident | Taccess of ident | Tnull

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

and taccess =
  | TAident of ident
  | TArecord of texpr * ident

and tparam = ident * mode option * typ
