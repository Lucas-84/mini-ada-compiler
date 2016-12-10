open Ast

exception Different_idents of ident * loc 
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
exception No_return of ident * loc 
exception Bad_access_type of ident * loc 
exception Used_before_end of ident * loc 

