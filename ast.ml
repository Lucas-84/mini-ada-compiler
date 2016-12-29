(*
 * Abstract syntax trees of Mini Ada
 *)


(*
 * First AST: returned by parser and used by typer.
 * Decorated using localization information
 *)
type loc = {
  fp : Lexing.position;
  lp : Lexing.position;
}

type file = {
  main_name : ident_loc;
  glob_decl : decl_loc list;
  stmts : stmt_loc list;
}

and decl_loc = decl * loc
and decl =
  | Dtype of ident_loc
  | Daccesstype of ident_loc * ident_loc
  | Drecordtype of ident_loc * field list
  | Dident of ident_loc * stype_loc * expr_loc option
  | Dfunction of
    ident_loc * param list * stype_loc * decl_loc list * stmt_loc list

and field = ident_loc * stype_loc

and stype_loc = stype * loc
and stype =
  | STident of ident_loc
  | STaccess of ident_loc
  | STunit

and param = ident_loc * mode * stype_loc

and mode =
  | Min
  | Minout

and stmt_loc = stmt * loc
and stmt = 
  | Saccess of access_loc * expr_loc
  | Scall of ident_loc * expr_loc list
  | Sreturn of expr_loc option
  | Sblock of stmt_loc list
  | Sif of expr_loc * stmt_loc list * stmt_loc list
  | Sfor of ident_loc * bool * expr_loc * expr_loc * stmt_loc list
  | Swhile of expr_loc * stmt_loc list

and access_loc = access * loc
and access =
  | Aident of ident_loc 
  | Arecord of expr_loc * ident_loc

and binop =
  | Beq 
  | Bneq
  | Blt
  | Ble
  | Bgt
  | Bge
  | Badd
  | Bsub
  | Bmul
  | Bdiv
  | Brem
  | Band
  | Bor
  | Bandthen
  | Borelse

and expr_loc = expr * loc
and expr =
  | Eint of int
  | Echar of char
  | Ebool of bool
  | Enull
  | Eaccess of access_loc
  | Ebinop of expr_loc * binop * expr_loc
  | Eneg of expr_loc
  | Enew of ident_loc
  | Ecall of ident_loc * expr_loc list
  | Echarval of expr_loc

and ident_loc = string * loc
and ident = string

(*
 * Second AST
 * Returned by typer
 * Decorated with types
 *)
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
  | TDident of ident * typ * texpr option
  | TDfunction of ident * tparam list * typ * tdecl list * tstmt list

and tfield = ident * typ
and tparam = ident * mode * typ

and tstmt =
  | TSaccess of taccess * texpr
  | TScall of tident * texpr list
  | TSreturn of texpr option
  | TSblock of tstmt list
  | TSif of texpr * tstmt list * tstmt list
  | TSfor of ident * bool * texpr * texpr * tstmt list
  | TSwhile of texpr * tstmt list

and taccess =
  | TAident of tident
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
  | TEnew of tident
  | TEcall of tident * texpr list
  | TEcharval of texpr
