(**
 * Abstract syntax tree of Mini Ada
 *)

type loc = {
  fp : Lexing.position;
  lp : Lexing.position;
}

and file = {
  main_name : ident_loc;
  glob_decl : decl_loc list;
  stmts : stmt_loc list;
}

and decl_loc = decl * loc
and decl =
  | Dtype of ident_loc
  | Daccesstype of ident_loc * ident_loc
  | Drecordtype of ident_loc * field list
  (* TODO: transform to ident * stype * expr option in parser *)
  | Dident of ident_loc list * stype_loc * expr_loc option
  | Dfunction of ident_loc * param list * stype_loc * decl_loc list * stmt_loc list

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
