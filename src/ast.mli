(**
 * Abstract syntax tree of Mini Ada
 *)

type loc = {
  fp : Lexing.position;
  lp : Lexing.position;
}

and file = {
  procedure : ident;
  glob_decl : decl list;
  stmts : stmt list;
}

and decl = decl_desc * loc
and decl_desc =
  | Dtype of ident
  | Daccesstype of ident * ident 
  | Drecordtype of ident * field list
  | Dident of ident list * stype * expr option
  | Dprocedure of ident * params option * decl list * stmt list
  | Dfunction of ident * params option * stype * decl list * stmt list

and field = ident list * stype
and stype =
  | STident of ident
  | STaccess of ident

and params = param list
and param = ident list * mode option * stype
and mode =
  | Min
  | Minout

and stmt = stmt_desc * loc
and stmt_desc = 
  | Saccess of access * expr
  | Sproccall of ident
  | Sfuncall of ident * expr list
  | Sreturn of expr option
  | Sblock of stmt list
  | Sif of (expr * stmt list) list * stmt list
  | Sfor of ident * bool * expr * expr * stmt list
  | Swhile of expr * stmt list

and access =
  | Aident of ident 
  | Arecord of expr * ident

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

and expr = expr_desc * loc
and expr_desc =
  | Eint of int
  | Echar of char
  | Ebool of bool
  | Enull
  | Eaccess of access
  | Ebinop of expr * binop * expr
  | Eneg of expr
  | Enew of ident
  | Ecall of ident * expr list
  | Echarval of expr

and ident = string
