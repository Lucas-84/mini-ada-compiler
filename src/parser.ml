
module Basics = struct
  
  exception Error
  
  type token = 
    | WITH
    | WHILE
    | USE
    | TYPE
    | TRUE
    | THEN
    | SUB
    | STDLIB
    | SEMICOLON
    | RPAR
    | REVERSE
    | RETURN
    | REM
    | RECORD
    | PROCEDURE
    | OUT
    | OR
    | NULL
    | NOT
    | NEW
    | NEQ
    | MUL
    | LT
    | LPAR
    | LOOP
    | LE
    | IS
    | INT of (
# 29 "parser.mly"
       (int)
# 38 "parser.ml"
  )
    | IN
    | IF
    | IDENT of (
# 27 "parser.mly"
       (string)
# 45 "parser.ml"
  )
    | GT
    | GE
    | FUNCTION
    | FOR
    | FALSE
    | EQ
    | EOF
    | END
    | ELSIF
    | ELSE
    | DOUBLEDOT
    | DOT
    | DIV
    | COMMA
    | COLONEQ
    | COLON
    | CHARVAL
    | CHAR of (
# 30 "parser.mly"
       (char)
# 67 "parser.ml"
  )
    | BEGIN
    | AND
    | ADD
    | ACCESS
  
end

include Basics

let _eRR =
  Basics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState200
  | MenhirState198
  | MenhirState194
  | MenhirState192
  | MenhirState189
  | MenhirState185
  | MenhirState173
  | MenhirState172
  | MenhirState171
  | MenhirState169
  | MenhirState165
  | MenhirState155
  | MenhirState151
  | MenhirState150
  | MenhirState149
  | MenhirState147
  | MenhirState145
  | MenhirState137
  | MenhirState134
  | MenhirState132
  | MenhirState128
  | MenhirState127
  | MenhirState125
  | MenhirState124
  | MenhirState115
  | MenhirState108
  | MenhirState107
  | MenhirState105
  | MenhirState103
  | MenhirState101
  | MenhirState99
  | MenhirState97
  | MenhirState95
  | MenhirState93
  | MenhirState91
  | MenhirState90
  | MenhirState87
  | MenhirState85
  | MenhirState80
  | MenhirState78
  | MenhirState75
  | MenhirState72
  | MenhirState69
  | MenhirState66
  | MenhirState64
  | MenhirState62
  | MenhirState59
  | MenhirState57
  | MenhirState55
  | MenhirState53
  | MenhirState51
  | MenhirState47
  | MenhirState43
  | MenhirState36
  | MenhirState35
  | MenhirState29
  | MenhirState19
  | MenhirState16
  | MenhirState14
  | MenhirState9

# 3 "parser.mly"
  
  open Ast

  let check_same_identifiers i1 o2 = match o2 with
    | Some i2 when String.lowercase_ascii i1 <> String.lowercase_ascii i2 -> failwith ("Two different identifiers")
    | _ -> ()

  let dummy_loc = {fp = Lexing.dummy_pos; lp = Lexing.dummy_pos}

# 160 "parser.ml"

let rec _menhir_goto_option_IDENT_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_option_IDENT_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState185 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((((('freshtv767 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 171 "parser.ml"
        ) * Lexing.position) * _menhir_state * 'tv_option_params_) * Lexing.position) * _menhir_state * 'tv_stype)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) * _menhir_state * 'tv_option_IDENT_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((((('freshtv763 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 181 "parser.ml"
            ) * Lexing.position) * _menhir_state * 'tv_option_params_) * Lexing.position) * _menhir_state * 'tv_stype)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) * _menhir_state * 'tv_option_IDENT_) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((((('freshtv761 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 189 "parser.ml"
            ) * Lexing.position) * _menhir_state * 'tv_option_params_) * Lexing.position) * _menhir_state * 'tv_stype)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) * _menhir_state * 'tv_option_IDENT_) = Obj.magic _menhir_stack in
            let (_endpos__12_ : Lexing.position) = _endpos in
            ((let ((((((((((_menhir_stack, _menhir_s, _startpos__1_), _endpos_i1_, (i1 : (
# 27 "parser.mly"
       (string)
# 195 "parser.ml"
            )), _startpos_i1_), _, (p : 'tv_option_params_)), _startpos__4_), _, (t : 'tv_stype)), _, (d : 'tv_list_decl_)), _startpos__8_), _, (s : 'tv_nonempty_list_stmt_)), _startpos__10_), _, (o2 : 'tv_option_IDENT_)) = _menhir_stack in
            let _12 = () in
            let _10 = () in
            let _8 = () in
            let _6 = () in
            let _4 = () in
            let _1 = () in
            let _v : 'tv_decl = let _endpos = _endpos__12_ in
            let _startpos = _startpos__1_ in
            
# 82 "parser.mly"
  (
    check_same_identifiers i1 o2;
    Dfunction (i1, (match p with Some l -> l | None -> []), t, d, s), {fp = _startpos; lp = _endpos}
  )
# 211 "parser.ml"
             in
            _menhir_goto_decl _menhir_env _menhir_stack _menhir_s _v) : 'freshtv762)) : 'freshtv764)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((((('freshtv765 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 221 "parser.ml"
            ) * Lexing.position) * _menhir_state * 'tv_option_params_) * Lexing.position) * _menhir_state * 'tv_stype)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) * _menhir_state * 'tv_option_IDENT_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv766)) : 'freshtv768)
    | MenhirState194 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((('freshtv775 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 230 "parser.ml"
        ) * Lexing.position) * _menhir_state * 'tv_option_params_)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) * _menhir_state * 'tv_option_IDENT_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((('freshtv771 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 240 "parser.ml"
            ) * Lexing.position) * _menhir_state * 'tv_option_params_)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) * _menhir_state * 'tv_option_IDENT_) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((('freshtv769 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 248 "parser.ml"
            ) * Lexing.position) * _menhir_state * 'tv_option_params_)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) * _menhir_state * 'tv_option_IDENT_) = Obj.magic _menhir_stack in
            let (_endpos__10_ : Lexing.position) = _endpos in
            ((let ((((((((_menhir_stack, _menhir_s, _startpos__1_), _endpos_i1_, (i1 : (
# 27 "parser.mly"
       (string)
# 254 "parser.ml"
            )), _startpos_i1_), _, (p : 'tv_option_params_)), _, (d : 'tv_list_decl_)), _startpos__6_), _, (s : 'tv_nonempty_list_stmt_)), _startpos__8_), _, (o2 : 'tv_option_IDENT_)) = _menhir_stack in
            let _10 = () in
            let _8 = () in
            let _6 = () in
            let _4 = () in
            let _1 = () in
            let _v : 'tv_decl = let _endpos = _endpos__10_ in
            let _startpos = _startpos__1_ in
            
# 77 "parser.mly"
  (
    check_same_identifiers i1 o2; 
    Dprocedure (i1, (match p with Some l -> l | None -> []), d, s), {fp = _startpos; lp = _endpos}
  )
# 269 "parser.ml"
             in
            _menhir_goto_decl _menhir_env _menhir_stack _menhir_s _v) : 'freshtv770)) : 'freshtv772)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((('freshtv773 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 279 "parser.ml"
            ) * Lexing.position) * _menhir_state * 'tv_option_params_)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) * _menhir_state * 'tv_option_IDENT_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv774)) : 'freshtv776)
    | MenhirState200 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((((((((('freshtv793)) * Lexing.position))) * Lexing.position) * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 288 "parser.ml"
        ) * Lexing.position)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) * _menhir_state * 'tv_option_IDENT_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((((((((((('freshtv789)) * Lexing.position))) * Lexing.position) * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 298 "parser.ml"
            ) * Lexing.position)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) * _menhir_state * 'tv_option_IDENT_) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_stack = (_menhir_stack, _endpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | EOF ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((((((((((((('freshtv785)) * Lexing.position))) * Lexing.position) * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 310 "parser.ml"
                ) * Lexing.position)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) * _menhir_state * 'tv_option_IDENT_) * Lexing.position) = Obj.magic _menhir_stack in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((((((((((((('freshtv783)) * Lexing.position))) * Lexing.position) * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 316 "parser.ml"
                ) * Lexing.position)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) * _menhir_state * 'tv_option_IDENT_) * Lexing.position) = Obj.magic _menhir_stack in
                ((let ((((((((((_menhir_stack, _endpos__3_), _endpos__6_), _startpos__7_), _endpos_i1_, (i1 : (
# 27 "parser.mly"
       (string)
# 321 "parser.ml"
                )), _startpos_i1_), _, (d : 'tv_list_decl_)), _startpos__11_), _, (s : 'tv_nonempty_list_stmt_)), _startpos__13_), _, (o2 : 'tv_option_IDENT_)), _endpos__15_) = _menhir_stack in
                let _16 = () in
                let _15 = () in
                let _13 = () in
                let _11 = () in
                let _9 = () in
                let _7 = () in
                let _6 = () in
                let _5 = () in
                let _4 = () in
                let _3 = () in
                let _2 = () in
                let _1 = () in
                let _v : (
# 49 "parser.mly"
      (Ast.file)
# 338 "parser.ml"
                ) = 
# 59 "parser.mly"
  ( 
    check_same_identifiers i1 o2;
    { procedure = i1; glob_decl = d; stmts = s }
  )
# 345 "parser.ml"
                 in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv781) = _menhir_stack in
                let (_v : (
# 49 "parser.mly"
      (Ast.file)
# 352 "parser.ml"
                )) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv779) = Obj.magic _menhir_stack in
                let (_v : (
# 49 "parser.mly"
      (Ast.file)
# 359 "parser.ml"
                )) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv777) = Obj.magic _menhir_stack in
                let ((_1 : (
# 49 "parser.mly"
      (Ast.file)
# 366 "parser.ml"
                )) : (
# 49 "parser.mly"
      (Ast.file)
# 370 "parser.ml"
                )) = _v in
                (Obj.magic _1 : 'freshtv778)) : 'freshtv780)) : 'freshtv782)) : 'freshtv784)) : 'freshtv786)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((((((((((((('freshtv787)) * Lexing.position))) * Lexing.position) * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 380 "parser.ml"
                ) * Lexing.position)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) * _menhir_state * 'tv_option_IDENT_) * Lexing.position) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv788)) : 'freshtv790)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((((((((((('freshtv791)) * Lexing.position))) * Lexing.position) * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 391 "parser.ml"
            ) * Lexing.position)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) * _menhir_state * 'tv_option_IDENT_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv792)) : 'freshtv794)
    | _ ->
        _menhir_fail ()

and _menhir_reduce19 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * 'tv_access * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _endpos_a_, _menhir_s, (a : 'tv_access), _startpos_a_) = _menhir_stack in
    let _startpos = _startpos_a_ in
    let _endpos = _endpos_a_ in
    let _v : 'tv_expr = let _endpos = _endpos_a_ in
    let _startpos = _startpos_a_ in
    
# 129 "parser.mly"
  ( Eaccess a, {fp = _startpos; lp = _endpos} )
# 408 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce50 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_option_IDENT_ = 
# 101 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( None )
# 417 "parser.ml"
     in
    _menhir_goto_option_IDENT_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run186 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 27 "parser.mly"
       (string)
# 424 "parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv759) = Obj.magic _menhir_stack in
    let (_endpos_x_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((x : (
# 27 "parser.mly"
       (string)
# 435 "parser.ml"
    )) : (
# 27 "parser.mly"
       (string)
# 439 "parser.ml"
    )) = _v in
    let (_startpos_x_ : Lexing.position) = _startpos in
    ((let _v : 'tv_option_IDENT_ = 
# 103 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( Some x )
# 445 "parser.ml"
     in
    _menhir_goto_option_IDENT_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv760)

and _menhir_goto_condition : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_condition -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v ->
    match _menhir_s with
    | MenhirState172 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv753 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_condition) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv751 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
        let (_endpos_c_ : Lexing.position) = _endpos in
        let (_ : _menhir_state) = _menhir_s in
        let ((c : 'tv_condition) : 'tv_condition) = _v in
        ((let (((_menhir_stack, _menhir_s, _startpos__1_), _endpos_e_, _, (e : 'tv_expr), _startpos_e_), _, (s : 'tv_nonempty_list_stmt_)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _endpos = _endpos_c_ in
        let _v : 'tv_condition = let _endpos = _endpos_c_ in
        let _startpos = _startpos__1_ in
        
# 113 "parser.mly"
  ( Sif (e, s, [c]), {fp = _startpos; lp = _endpos} )
# 472 "parser.ml"
         in
        _menhir_goto_condition _menhir_env _menhir_stack _endpos _menhir_s _v) : 'freshtv752)) : 'freshtv754)
    | MenhirState165 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv757 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_condition) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv755 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
        let (_endpos_c_ : Lexing.position) = _endpos in
        let (_ : _menhir_state) = _menhir_s in
        let ((c : 'tv_condition) : 'tv_condition) = _v in
        ((let (((_menhir_stack, _menhir_s, _startpos__1_), _endpos_e_, _, (e : 'tv_expr), _startpos_e_), _, (s : 'tv_nonempty_list_stmt_)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_stmt = let _endpos = _endpos_c_ in
        let _startpos = _startpos__1_ in
        
# 100 "parser.mly"
  ( Sif (e, s, [c]), {fp = _startpos; lp = _endpos} )
# 494 "parser.ml"
         in
        _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv756)) : 'freshtv758)
    | _ ->
        _menhir_fail ()

and _menhir_run166 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv747 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        ((let _menhir_stack = (_menhir_stack, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv743 * _menhir_state * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv741 * _menhir_state * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
            let (_endpos__3_ : Lexing.position) = _endpos in
            ((let ((_menhir_stack, _menhir_s, _startpos__1_), _startpos__2_) = _menhir_stack in
            let _3 = () in
            let _2 = () in
            let _1 = () in
            let _endpos = _endpos__3_ in
            let _v : 'tv_condition = let _endpos = _endpos__3_ in
            let _startpos = _startpos__1_ in
            
# 109 "parser.mly"
  ( Sblock [], {fp = _startpos; lp = _endpos} )
# 532 "parser.ml"
             in
            _menhir_goto_condition _menhir_env _menhir_stack _endpos _menhir_s _v) : 'freshtv742)) : 'freshtv744)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv745 * _menhir_state * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv746)) : 'freshtv748)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv749 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv750)

and _menhir_run169 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CHAR _v ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState169 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState169 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState169 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState169 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState169 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState169 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState169 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState169 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState169 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState169 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState169 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState169

and _menhir_run173 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run150 _menhir_env (Obj.magic _menhir_stack) MenhirState173 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHAR _v ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState173 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState173 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState173 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FOR ->
        _menhir_run141 _menhir_env (Obj.magic _menhir_stack) MenhirState173 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run135 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState173 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IF ->
        _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState173 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState173 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState173 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState173 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState173 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState173 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | RETURN ->
        _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState173 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState173 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState173 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | WHILE ->
        _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState173 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState173

and _menhir_reduce38 : _menhir_env -> ((('ttv_tail * Lexing.position * _menhir_state * (
# 27 "parser.mly"
       (string)
# 629 "parser.ml"
) * Lexing.position) * Lexing.position) * _menhir_state * 'tv_separated_nonempty_list_COMMA_expr_) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let ((((_menhir_stack, _endpos_i_, _menhir_s, (i : (
# 27 "parser.mly"
       (string)
# 635 "parser.ml"
    )), _startpos_i_), _startpos__2_), _, (e : 'tv_separated_nonempty_list_COMMA_expr_)), _endpos__4_) = _menhir_stack in
    let _4 = () in
    let _2 = () in
    let _startpos = _startpos_i_ in
    let _endpos = _endpos__4_ in
    let _v : 'tv_expr = let _endpos = _endpos__4_ in
    let _startpos = _startpos_i_ in
    
# 143 "parser.mly"
  ( Ecall (i, e), {fp = _startpos; lp = _endpos} )
# 646 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_goto_access : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_access -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    match _menhir_s with
    | MenhirState125 | MenhirState132 | MenhirState169 | MenhirState145 | MenhirState147 | MenhirState155 | MenhirState137 | MenhirState128 | MenhirState62 | MenhirState64 | MenhirState66 | MenhirState69 | MenhirState72 | MenhirState115 | MenhirState75 | MenhirState90 | MenhirState91 | MenhirState107 | MenhirState108 | MenhirState105 | MenhirState93 | MenhirState103 | MenhirState101 | MenhirState99 | MenhirState95 | MenhirState97 | MenhirState78 | MenhirState87 | MenhirState85 | MenhirState80 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv733 * Lexing.position * _menhir_state * 'tv_access * Lexing.position) = Obj.magic _menhir_stack in
        (_menhir_reduce19 _menhir_env (Obj.magic _menhir_stack) : 'freshtv734)
    | MenhirState198 | MenhirState192 | MenhirState124 | MenhirState127 | MenhirState134 | MenhirState171 | MenhirState173 | MenhirState149 | MenhirState150 | MenhirState151 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv739 * Lexing.position * _menhir_state * 'tv_access * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COLONEQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv735 * Lexing.position * _menhir_state * 'tv_access * Lexing.position) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CHAR _v ->
                _menhir_run76 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState155 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | CHARVAL ->
                _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState155 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FALSE ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState155 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState155 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INT _v ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState155 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LPAR ->
                _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState155 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NEW ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState155 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NOT ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState155 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NULL ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState155 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | SUB ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState155 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TRUE ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState155 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState155) : 'freshtv736)
        | ADD | AND | DIV | DOT | EQ | GE | GT | LE | LT | MUL | NEQ | OR | REM | SUB ->
            _menhir_reduce19 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv737 * Lexing.position * _menhir_state * 'tv_access * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv738)) : 'freshtv740)
    | _ ->
        _menhir_fail ()

and _menhir_goto_nonempty_list_stmt_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_nonempty_list_stmt_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState151 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv649 * _menhir_state * 'tv_stmt) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv647 * _menhir_state * 'tv_stmt) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (x : 'tv_stmt)), _, (xs : 'tv_nonempty_list_stmt_)) = _menhir_stack in
        let _v : 'tv_nonempty_list_stmt_ = 
# 198 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( x :: xs )
# 721 "parser.ml"
         in
        _menhir_goto_nonempty_list_stmt_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv648)) : 'freshtv650)
    | MenhirState150 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv661 * _menhir_state * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv657 * _menhir_state * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
            let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
            ((let _menhir_stack = (_menhir_stack, _startpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEMICOLON ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv653 * _menhir_state * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) = Obj.magic _menhir_stack in
                let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv651 * _menhir_state * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) = Obj.magic _menhir_stack in
                let (_endpos__4_ : Lexing.position) = _endpos in
                ((let (((_menhir_stack, _menhir_s, _startpos__1_), _, (s : 'tv_nonempty_list_stmt_)), _startpos__3_) = _menhir_stack in
                let _4 = () in
                let _3 = () in
                let _1 = () in
                let _v : 'tv_stmt = let _endpos = _endpos__4_ in
                let _startpos = _startpos__1_ in
                
# 98 "parser.mly"
  ( Sblock s, {fp = _startpos; lp = _endpos} )
# 755 "parser.ml"
                 in
                _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv652)) : 'freshtv654)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv655 * _menhir_state * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv656)) : 'freshtv658)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv659 * _menhir_state * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv660)) : 'freshtv662)
    | MenhirState149 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((('freshtv677 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 777 "parser.ml"
        ) * Lexing.position)) * 'tv_option_REVERSE_) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((('freshtv673 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 787 "parser.ml"
            ) * Lexing.position)) * 'tv_option_REVERSE_) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
            let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
            ((let _menhir_stack = (_menhir_stack, _startpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | LOOP ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((((((('freshtv669 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 799 "parser.ml"
                ) * Lexing.position)) * 'tv_option_REVERSE_) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | SEMICOLON ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (((((((((('freshtv665 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 809 "parser.ml"
                    ) * Lexing.position)) * 'tv_option_REVERSE_) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position)) = Obj.magic _menhir_stack in
                    let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (((((((((('freshtv663 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 817 "parser.ml"
                    ) * Lexing.position)) * 'tv_option_REVERSE_) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position)) = Obj.magic _menhir_stack in
                    let (_endpos__12_ : Lexing.position) = _endpos in
                    ((let (((((((_menhir_stack, _menhir_s, _startpos__1_), _endpos_i_, (i : (
# 27 "parser.mly"
       (string)
# 823 "parser.ml"
                    )), _startpos_i_), (r : 'tv_option_REVERSE_)), _endpos_e1_, _, (e1 : 'tv_expr), _startpos_e1_), _endpos_e2_, _, (e2 : 'tv_expr), _startpos_e2_), _, (s : 'tv_nonempty_list_stmt_)), _startpos__10_) = _menhir_stack in
                    let _12 = () in
                    let _11 = () in
                    let _10 = () in
                    let _8 = () in
                    let _6 = () in
                    let _3 = () in
                    let _1 = () in
                    let _v : 'tv_stmt = let _endpos = _endpos__12_ in
                    let _startpos = _startpos__1_ in
                    
# 102 "parser.mly"
  ( Sfor (i, (match r with Some _ -> true | _ -> false), e1, e2, s), {fp = _startpos; lp = _endpos} )
# 837 "parser.ml"
                     in
                    _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv664)) : 'freshtv666)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (((((((((('freshtv667 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 847 "parser.ml"
                    ) * Lexing.position)) * 'tv_option_REVERSE_) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position)) = Obj.magic _menhir_stack in
                    ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv668)) : 'freshtv670)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((((((('freshtv671 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 858 "parser.ml"
                ) * Lexing.position)) * 'tv_option_REVERSE_) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv672)) : 'freshtv674)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((('freshtv675 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 869 "parser.ml"
            ) * Lexing.position)) * 'tv_option_REVERSE_) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv676)) : 'freshtv678)
    | MenhirState134 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv679 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ELSE ->
            _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState165 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | ELSIF ->
            _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState165 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | END ->
            _menhir_run166 _menhir_env (Obj.magic _menhir_stack) MenhirState165 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState165) : 'freshtv680)
    | MenhirState171 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv681 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ELSE ->
            _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState172 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | ELSIF ->
            _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState172 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | END ->
            _menhir_run166 _menhir_env (Obj.magic _menhir_stack) MenhirState172 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState172) : 'freshtv682)
    | MenhirState173 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv697 * _menhir_state * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv693 * _menhir_state * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
            let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
            ((let _menhir_stack = (_menhir_stack, _startpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | IF ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv689 * _menhir_state * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) = Obj.magic _menhir_stack in
                let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
                ((let _menhir_stack = (_menhir_stack, _startpos) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | SEMICOLON ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv685 * _menhir_state * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
                    let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv683 * _menhir_state * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
                    let (_endpos__5_ : Lexing.position) = _endpos in
                    ((let ((((_menhir_stack, _menhir_s, _startpos__1_), _, (s : 'tv_nonempty_list_stmt_)), _startpos__3_), _startpos__4_) = _menhir_stack in
                    let _5 = () in
                    let _4 = () in
                    let _3 = () in
                    let _1 = () in
                    let _endpos = _endpos__5_ in
                    let _v : 'tv_condition = let _endpos = _endpos__5_ in
                    let _startpos = _startpos__1_ in
                    
# 111 "parser.mly"
  ( Sblock s, {fp = _startpos; lp = _endpos} )
# 946 "parser.ml"
                     in
                    _menhir_goto_condition _menhir_env _menhir_stack _endpos _menhir_s _v) : 'freshtv684)) : 'freshtv686)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv687 * _menhir_state * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s, _), _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv688)) : 'freshtv690)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv691 * _menhir_state * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv692)) : 'freshtv694)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv695 * _menhir_state * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv696)) : 'freshtv698)
    | MenhirState127 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv713 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv709 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
            let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
            ((let _menhir_stack = (_menhir_stack, _startpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | LOOP ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((('freshtv705 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | SEMICOLON ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((((('freshtv701 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position)) = Obj.magic _menhir_stack in
                    let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((((('freshtv699 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position)) = Obj.magic _menhir_stack in
                    let (_endpos__7_ : Lexing.position) = _endpos in
                    ((let ((((_menhir_stack, _menhir_s, _startpos__1_), _endpos_e_, _, (e : 'tv_expr), _startpos_e_), _, (s : 'tv_nonempty_list_stmt_)), _startpos__5_) = _menhir_stack in
                    let _7 = () in
                    let _6 = () in
                    let _5 = () in
                    let _3 = () in
                    let _1 = () in
                    let _v : 'tv_stmt = let _endpos = _endpos__7_ in
                    let _startpos = _startpos__1_ in
                    
# 104 "parser.mly"
  ( Swhile (e, s), {fp = _startpos; lp = _endpos} )
# 1009 "parser.ml"
                     in
                    _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv700)) : 'freshtv702)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((((('freshtv703 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position)) = Obj.magic _menhir_stack in
                    ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv704)) : 'freshtv706)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((('freshtv707 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv708)) : 'freshtv710)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv711 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv712)) : 'freshtv714)
    | MenhirState124 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((('freshtv719 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 1038 "parser.ml"
        ) * Lexing.position) * _menhir_state * 'tv_option_params_) * Lexing.position) * _menhir_state * 'tv_stype)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((('freshtv715 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 1048 "parser.ml"
            ) * Lexing.position) * _menhir_state * 'tv_option_params_) * Lexing.position) * _menhir_state * 'tv_stype)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
            let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
            ((let _menhir_stack = (_menhir_stack, _startpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | IDENT _v ->
                _menhir_run186 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState185 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | SEMICOLON ->
                _menhir_reduce50 _menhir_env (Obj.magic _menhir_stack) MenhirState185
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState185) : 'freshtv716)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((('freshtv717 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 1070 "parser.ml"
            ) * Lexing.position) * _menhir_state * 'tv_option_params_) * Lexing.position) * _menhir_state * 'tv_stype)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv718)) : 'freshtv720)
    | MenhirState192 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv725 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 1079 "parser.ml"
        ) * Lexing.position) * _menhir_state * 'tv_option_params_)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv721 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 1089 "parser.ml"
            ) * Lexing.position) * _menhir_state * 'tv_option_params_)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
            let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
            ((let _menhir_stack = (_menhir_stack, _startpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | IDENT _v ->
                _menhir_run186 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState194 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | SEMICOLON ->
                _menhir_reduce50 _menhir_env (Obj.magic _menhir_stack) MenhirState194
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState194) : 'freshtv722)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv723 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 1111 "parser.ml"
            ) * Lexing.position) * _menhir_state * 'tv_option_params_)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv724)) : 'freshtv726)
    | MenhirState198 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((((((('freshtv731)) * Lexing.position))) * Lexing.position) * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 1120 "parser.ml"
        ) * Lexing.position)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((((((((('freshtv727)) * Lexing.position))) * Lexing.position) * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 1130 "parser.ml"
            ) * Lexing.position)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
            let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
            ((let _menhir_stack = (_menhir_stack, _startpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | IDENT _v ->
                _menhir_run186 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState200 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | SEMICOLON ->
                _menhir_reduce50 _menhir_env (Obj.magic _menhir_stack) MenhirState200
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState200) : 'freshtv728)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((((((((('freshtv729)) * Lexing.position))) * Lexing.position) * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 1152 "parser.ml"
            ) * Lexing.position)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv730)) : 'freshtv732)
    | _ ->
        _menhir_fail ()

and _menhir_goto_separated_nonempty_list_COMMA_expr_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_separated_nonempty_list_COMMA_expr_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState72 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv629 * Lexing.position * _menhir_state * (
# 27 "parser.mly"
       (string)
# 1168 "parser.ml"
        ) * Lexing.position) * Lexing.position) * _menhir_state * 'tv_separated_nonempty_list_COMMA_expr_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RPAR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv625 * Lexing.position * _menhir_state * (
# 27 "parser.mly"
       (string)
# 1178 "parser.ml"
            ) * Lexing.position) * Lexing.position) * _menhir_state * 'tv_separated_nonempty_list_COMMA_expr_) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_stack = (_menhir_stack, _endpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            _menhir_reduce38 _menhir_env (Obj.magic _menhir_stack)) : 'freshtv626)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv627 * Lexing.position * _menhir_state * (
# 27 "parser.mly"
       (string)
# 1191 "parser.ml"
            ) * Lexing.position) * Lexing.position) * _menhir_state * 'tv_separated_nonempty_list_COMMA_expr_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv628)) : 'freshtv630)
    | MenhirState115 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv633 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_separated_nonempty_list_COMMA_expr_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv631 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_separated_nonempty_list_COMMA_expr_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _endpos_x_, _menhir_s, (x : 'tv_expr), _startpos_x_), _, (xs : 'tv_separated_nonempty_list_COMMA_expr_)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_separated_nonempty_list_COMMA_expr_ = 
# 218 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( x :: xs )
# 1205 "parser.ml"
         in
        _menhir_goto_separated_nonempty_list_COMMA_expr_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv632)) : 'freshtv634)
    | MenhirState137 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv645 * Lexing.position * _menhir_state * (
# 27 "parser.mly"
       (string)
# 1213 "parser.ml"
        ) * Lexing.position) * Lexing.position) * _menhir_state * 'tv_separated_nonempty_list_COMMA_expr_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RPAR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv641 * Lexing.position * _menhir_state * (
# 27 "parser.mly"
       (string)
# 1223 "parser.ml"
            ) * Lexing.position) * Lexing.position) * _menhir_state * 'tv_separated_nonempty_list_COMMA_expr_) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_stack = (_menhir_stack, _endpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEMICOLON ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv637 * Lexing.position * _menhir_state * (
# 27 "parser.mly"
       (string)
# 1235 "parser.ml"
                ) * Lexing.position) * Lexing.position) * _menhir_state * 'tv_separated_nonempty_list_COMMA_expr_) * Lexing.position) = Obj.magic _menhir_stack in
                let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv635 * Lexing.position * _menhir_state * (
# 27 "parser.mly"
       (string)
# 1243 "parser.ml"
                ) * Lexing.position) * Lexing.position) * _menhir_state * 'tv_separated_nonempty_list_COMMA_expr_) * Lexing.position) = Obj.magic _menhir_stack in
                let (_endpos__5_ : Lexing.position) = _endpos in
                ((let ((((_menhir_stack, _endpos_i_, _menhir_s, (i : (
# 27 "parser.mly"
       (string)
# 1249 "parser.ml"
                )), _startpos_i_), _startpos__2_), _, (e : 'tv_separated_nonempty_list_COMMA_expr_)), _endpos__4_) = _menhir_stack in
                let _5 = () in
                let _4 = () in
                let _2 = () in
                let _v : 'tv_stmt = let _endpos = _endpos__5_ in
                let _startpos = _startpos_i_ in
                
# 94 "parser.mly"
  ( Scall (i, e), {fp = _startpos; lp = _endpos} )
# 1259 "parser.ml"
                 in
                _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv636)) : 'freshtv638)
            | ADD | AND | DIV | DOT | EQ | GE | GT | LE | LT | MUL | NEQ | OR | REM | SUB ->
                _menhir_reduce38 _menhir_env (Obj.magic _menhir_stack)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv639 * Lexing.position * _menhir_state * (
# 27 "parser.mly"
       (string)
# 1271 "parser.ml"
                ) * Lexing.position) * Lexing.position) * _menhir_state * 'tv_separated_nonempty_list_COMMA_expr_) * Lexing.position) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv640)) : 'freshtv642)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv643 * Lexing.position * _menhir_state * (
# 27 "parser.mly"
       (string)
# 1282 "parser.ml"
            ) * Lexing.position) * Lexing.position) * _menhir_state * 'tv_separated_nonempty_list_COMMA_expr_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv644)) : 'freshtv646)
    | _ ->
        _menhir_fail ()

and _menhir_run78 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * 'tv_expr * Lexing.position -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _startpos ->
    let _menhir_stack = (_menhir_stack, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CHAR _v ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState78 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState78 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState78 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState78 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState78 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState78 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState78 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState78 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState78 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState78 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState78 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState78

and _menhir_run80 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * 'tv_expr * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CHAR _v ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState80 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState80 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState80 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState80 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState80 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState80 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState80 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState80 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState80 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState80 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState80 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState80

and _menhir_run90 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * 'tv_expr * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CHAR _v ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState90 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | ELSE ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv623 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState90 in
        let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CHAR _v ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState91 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | CHARVAL ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | FALSE ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState91 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | IDENT _v ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState91 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | INT _v ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState91 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LPAR ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | NEW ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | NOT ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | NULL ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState91 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | SUB ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TRUE ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState91 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState91) : 'freshtv624)
    | FALSE ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState90 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState90 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState90 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState90 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState90 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState90

and _menhir_run93 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * 'tv_expr * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CHAR _v ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState93 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState93 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState93 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState93 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState93 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState93 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState93 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState93 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState93 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState93 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState93 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState93

and _menhir_run85 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * 'tv_expr * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CHAR _v ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState85 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState85 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState85 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState85 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState85 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState85 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState85

and _menhir_run95 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * 'tv_expr * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CHAR _v ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState95 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState95 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState95 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState95 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState95 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState95 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState95 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState95 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState95 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState95 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState95 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState95

and _menhir_run99 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * 'tv_expr * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CHAR _v ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState99 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState99 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState99 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState99 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState99 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState99 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState99 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState99 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState99 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState99 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState99 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState99

and _menhir_run101 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * 'tv_expr * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CHAR _v ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState101 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState101 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState101 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState101 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState101 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState101 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState101 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState101 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState101 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState101 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState101 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState101

and _menhir_run103 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * 'tv_expr * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CHAR _v ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState103 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState103 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState103 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState103 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState103 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState103 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState103

and _menhir_run105 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * 'tv_expr * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CHAR _v ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState105 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState105 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState105 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState105 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState105 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState105 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState105

and _menhir_run82 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * 'tv_expr * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv619 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_v : (
# 27 "parser.mly"
       (string)
# 1657 "parser.ml"
        )) = _v in
        let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv617 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        let (_endpos_i_ : Lexing.position) = _endpos in
        let ((i : (
# 27 "parser.mly"
       (string)
# 1667 "parser.ml"
        )) : (
# 27 "parser.mly"
       (string)
# 1671 "parser.ml"
        )) = _v in
        let (_startpos_i_ : Lexing.position) = _startpos in
        ((let (_menhir_stack, _endpos_e_, _menhir_s, (e : 'tv_expr), _startpos_e_) = _menhir_stack in
        let _2 = () in
        let _startpos = _startpos_e_ in
        let _endpos = _endpos_i_ in
        let _v : 'tv_access = 
# 191 "parser.mly"
  ( Arecord (e, i) )
# 1681 "parser.ml"
         in
        _menhir_goto_access _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv618)) : 'freshtv620)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv621 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv622)

and _menhir_run87 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * 'tv_expr * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CHAR _v ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState87 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState87 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState87 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState87 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState87 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState87 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState87 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState87 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState87 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState87 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState87 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState87

and _menhir_run107 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * 'tv_expr * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CHAR _v ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState107 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState107 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState107 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState107 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState107 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState107 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState107 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState107 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState107 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState107 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | THEN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv615 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState107 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CHAR _v ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState108 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | CHARVAL ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | FALSE ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState108 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | IDENT _v ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState108 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | INT _v ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState108 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LPAR ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | NEW ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | NOT ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | NULL ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState108 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | SUB ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TRUE ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState108 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState108) : 'freshtv616)
    | TRUE ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState107 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState107

and _menhir_run97 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * 'tv_expr * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CHAR _v ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState97 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState97 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState97 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState97 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState97 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState97 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState97 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState97 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState97 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState97 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState97 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState97

and _menhir_goto_separated_nonempty_list_SEMICOLON_param_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_separated_nonempty_list_SEMICOLON_param_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState36 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv609 * _menhir_state * Lexing.position) * _menhir_state * 'tv_separated_nonempty_list_SEMICOLON_param_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RPAR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv605 * _menhir_state * Lexing.position) * _menhir_state * 'tv_separated_nonempty_list_SEMICOLON_param_) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv603 * _menhir_state * Lexing.position) * _menhir_state * 'tv_separated_nonempty_list_SEMICOLON_param_) = Obj.magic _menhir_stack in
            let (_endpos__3_ : Lexing.position) = _endpos in
            ((let ((_menhir_stack, _menhir_s, _startpos__1_), _, (p : 'tv_separated_nonempty_list_SEMICOLON_param_)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_params = 
# 168 "parser.mly"
  ( List.fold_left ( @ ) [] p )
# 1846 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv601) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_params) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv599) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_params) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv597) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((x : 'tv_params) : 'tv_params) = _v in
            ((let _v : 'tv_option_params_ = 
# 103 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( Some x )
# 1863 "parser.ml"
             in
            _menhir_goto_option_params_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv598)) : 'freshtv600)) : 'freshtv602)) : 'freshtv604)) : 'freshtv606)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv607 * _menhir_state * Lexing.position) * _menhir_state * 'tv_separated_nonempty_list_SEMICOLON_param_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv608)) : 'freshtv610)
    | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv613 * _menhir_state * 'tv_param) * Lexing.position) * _menhir_state * 'tv_separated_nonempty_list_SEMICOLON_param_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv611 * _menhir_state * 'tv_param) * Lexing.position) * _menhir_state * 'tv_separated_nonempty_list_SEMICOLON_param_) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (x : 'tv_param)), _endpos__2_), _, (xs : 'tv_separated_nonempty_list_SEMICOLON_param_)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_separated_nonempty_list_SEMICOLON_param_ = 
# 218 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( x :: xs )
# 1883 "parser.ml"
         in
        _menhir_goto_separated_nonempty_list_SEMICOLON_param_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv612)) : 'freshtv614)
    | _ ->
        _menhir_fail ()

and _menhir_goto_nonempty_list_field_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_nonempty_list_field_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState14 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv591 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 1898 "parser.ml"
        ) * Lexing.position))) * _menhir_state * 'tv_nonempty_list_field_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv587 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 1908 "parser.ml"
            ) * Lexing.position))) * _menhir_state * 'tv_nonempty_list_field_) = Obj.magic _menhir_stack in
            let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
            ((let _menhir_stack = (_menhir_stack, _startpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | RECORD ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((('freshtv583 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 1920 "parser.ml"
                ) * Lexing.position))) * _menhir_state * 'tv_nonempty_list_field_) * Lexing.position) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | SEMICOLON ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (((((('freshtv579 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 1930 "parser.ml"
                    ) * Lexing.position))) * _menhir_state * 'tv_nonempty_list_field_) * Lexing.position)) = Obj.magic _menhir_stack in
                    let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (((((('freshtv577 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 1938 "parser.ml"
                    ) * Lexing.position))) * _menhir_state * 'tv_nonempty_list_field_) * Lexing.position)) = Obj.magic _menhir_stack in
                    let (_endpos__8_ : Lexing.position) = _endpos in
                    ((let ((((_menhir_stack, _menhir_s, _startpos__1_), _endpos_i_, (i : (
# 27 "parser.mly"
       (string)
# 1944 "parser.ml"
                    )), _startpos_i_), _, (f : 'tv_nonempty_list_field_)), _startpos__6_) = _menhir_stack in
                    let _8 = () in
                    let _7 = () in
                    let _6 = () in
                    let _4 = () in
                    let _3 = () in
                    let _1 = () in
                    let _v : 'tv_decl = let _endpos = _endpos__8_ in
                    let _startpos = _startpos__1_ in
                    
# 71 "parser.mly"
  ( Drecordtype (i, List.fold_left ( @ ) [] f), {fp = _startpos; lp = _endpos} )
# 1957 "parser.ml"
                     in
                    _menhir_goto_decl _menhir_env _menhir_stack _menhir_s _v) : 'freshtv578)) : 'freshtv580)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (((((('freshtv581 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 1967 "parser.ml"
                    ) * Lexing.position))) * _menhir_state * 'tv_nonempty_list_field_) * Lexing.position)) = Obj.magic _menhir_stack in
                    ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv582)) : 'freshtv584)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((('freshtv585 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 1978 "parser.ml"
                ) * Lexing.position))) * _menhir_state * 'tv_nonempty_list_field_) * Lexing.position) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv586)) : 'freshtv588)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv589 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 1989 "parser.ml"
            ) * Lexing.position))) * _menhir_state * 'tv_nonempty_list_field_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv590)) : 'freshtv592)
    | MenhirState29 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv595 * _menhir_state * 'tv_field) * _menhir_state * 'tv_nonempty_list_field_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv593 * _menhir_state * 'tv_field) * _menhir_state * 'tv_nonempty_list_field_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (x : 'tv_field)), _, (xs : 'tv_nonempty_list_field_)) = _menhir_stack in
        let _v : 'tv_nonempty_list_field_ = 
# 198 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( x :: xs )
# 2002 "parser.ml"
         in
        _menhir_goto_nonempty_list_field_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv594)) : 'freshtv596)
    | _ ->
        _menhir_fail ()

and _menhir_goto_option_expr_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_option_expr_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv575 * _menhir_state * Lexing.position) * _menhir_state * 'tv_option_expr_) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SEMICOLON ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv571 * _menhir_state * Lexing.position) * _menhir_state * 'tv_option_expr_) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv569 * _menhir_state * Lexing.position) * _menhir_state * 'tv_option_expr_) = Obj.magic _menhir_stack in
        let (_endpos__3_ : Lexing.position) = _endpos in
        ((let ((_menhir_stack, _menhir_s, _startpos__1_), _, (e : 'tv_option_expr_)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_stmt = let _endpos = _endpos__3_ in
        let _startpos = _startpos__1_ in
        
# 96 "parser.mly"
  ( Sreturn e, {fp = _startpos; lp = _endpos} )
# 2032 "parser.ml"
         in
        _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv570)) : 'freshtv572)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv573 * _menhir_state * Lexing.position) * _menhir_state * 'tv_option_expr_) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv574)) : 'freshtv576)

and _menhir_reduce1 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 27 "parser.mly"
       (string)
# 2046 "parser.ml"
) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _endpos_i_, _menhir_s, (i : (
# 27 "parser.mly"
       (string)
# 2052 "parser.ml"
    )), _startpos_i_) = _menhir_stack in
    let _startpos = _startpos_i_ in
    let _endpos = _endpos_i_ in
    let _v : 'tv_access = 
# 189 "parser.mly"
  ( Aident i )
# 2059 "parser.ml"
     in
    _menhir_goto_access _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_goto_stmt : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_stmt -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv567 * _menhir_state * 'tv_stmt) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run150 _menhir_env (Obj.magic _menhir_stack) MenhirState151 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHAR _v ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState151 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState151 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState151 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FOR ->
        _menhir_run141 _menhir_env (Obj.magic _menhir_stack) MenhirState151 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run135 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState151 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IF ->
        _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState151 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState151 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState151 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState151 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState151 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState151 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | RETURN ->
        _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState151 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState151 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState151 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | WHILE ->
        _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState151 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | ELSE | ELSIF | END ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv565 * _menhir_state * 'tv_stmt) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (x : 'tv_stmt)) = _menhir_stack in
        let _v : 'tv_nonempty_list_stmt_ = 
# 196 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( [ x ] )
# 2110 "parser.ml"
         in
        _menhir_goto_nonempty_list_stmt_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv566)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState151) : 'freshtv568)

and _menhir_goto_option_REVERSE_ : _menhir_env -> 'ttv_tail -> 'tv_option_REVERSE_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((('freshtv563 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 2125 "parser.ml"
    ) * Lexing.position)) * 'tv_option_REVERSE_) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CHAR _v ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState145 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState145 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState145 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState145 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState145 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState145 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState145 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState145 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState145 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState145 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState145 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState145) : 'freshtv564)

and _menhir_run71 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 27 "parser.mly"
       (string)
# 2160 "parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAR ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv559 * Lexing.position * _menhir_state * (
# 27 "parser.mly"
       (string)
# 2172 "parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        ((let _menhir_stack = (_menhir_stack, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CHAR _v ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState72 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | CHARVAL ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | FALSE ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState72 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | IDENT _v ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState72 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | INT _v ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState72 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LPAR ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | NEW ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | NOT ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | NULL ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState72 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | SUB ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TRUE ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState72 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState72) : 'freshtv560)
    | ADD | AND | COMMA | DIV | DOT | DOUBLEDOT | EQ | GE | GT | LE | LOOP | LT | MUL | NEQ | OR | REM | RPAR | SEMICOLON | SUB | THEN ->
        _menhir_reduce1 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv561 * Lexing.position * _menhir_state * (
# 27 "parser.mly"
       (string)
# 2214 "parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv562)

and _menhir_goto_expr : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_expr -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    match _menhir_s with
    | MenhirState75 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv383 * _menhir_state * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | AND ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | RPAR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv379 * _menhir_state * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv377 * _menhir_state * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            let (_endpos__4_ : Lexing.position) = _endpos in
            ((let (((_menhir_stack, _menhir_s, _startpos__1_), _startpos__2_), _endpos_e_, _, (e : 'tv_expr), _startpos_e_) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos__4_ in
            let _v : 'tv_expr = let _endpos = _endpos__4_ in
            let _startpos = _startpos__1_ in
            
# 145 "parser.mly"
  ( Echarval e, {fp = _startpos; lp = _endpos} )
# 2274 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv378)) : 'freshtv380)
        | SUB ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv381 * _menhir_state * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv382)) : 'freshtv384)
    | MenhirState78 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv389 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIV ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | ADD | AND | COMMA | DOUBLEDOT | EQ | GE | GT | LE | LOOP | LT | NEQ | OR | RPAR | SEMICOLON | SUB | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv385 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : 'tv_expr), _startpos_e1_), _startpos__10_), _endpos_e2_, _, (e2 : 'tv_expr), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 155 "parser.mly"
            ( Bsub )
# 2312 "parser.ml"
              
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
            
# 135 "parser.mly"
  ( Ebinop (e1, o, e2), {fp = _startpos; lp = _endpos} )
# 2320 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv386)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv387 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv388)) : 'freshtv390)
    | MenhirState80 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv395 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOT ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | ADD | AND | COMMA | DIV | DOUBLEDOT | EQ | GE | GT | LE | LOOP | LT | MUL | NEQ | OR | REM | RPAR | SEMICOLON | SUB | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv391 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : 'tv_expr), _startpos_e1_), _endpos_e2_, _, (e2 : 'tv_expr), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 158 "parser.mly"
            ( Brem )
# 2350 "parser.ml"
              
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
            
# 135 "parser.mly"
  ( Ebinop (e1, o, e2), {fp = _startpos; lp = _endpos} )
# 2358 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv392)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv393 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv394)) : 'freshtv396)
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv401 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOT ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | ADD | AND | COMMA | DIV | DOUBLEDOT | EQ | GE | GT | LE | LOOP | LT | MUL | NEQ | OR | REM | RPAR | SEMICOLON | SUB | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv397 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : 'tv_expr), _startpos_e1_), _endpos_e2_, _, (e2 : 'tv_expr), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 156 "parser.mly"
            ( Bmul )
# 2388 "parser.ml"
              
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
            
# 135 "parser.mly"
  ( Ebinop (e1, o, e2), {fp = _startpos; lp = _endpos} )
# 2396 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv398)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv399 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv400)) : 'freshtv402)
    | MenhirState87 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv407 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOT ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | ADD | AND | COMMA | DIV | DOUBLEDOT | EQ | GE | GT | LE | LOOP | LT | MUL | NEQ | OR | REM | RPAR | SEMICOLON | SUB | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv403 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : 'tv_expr), _startpos_e1_), _endpos_e2_, _, (e2 : 'tv_expr), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 157 "parser.mly"
            ( Bdiv )
# 2426 "parser.ml"
              
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
            
# 135 "parser.mly"
  ( Ebinop (e1, o, e2), {fp = _startpos; lp = _endpos} )
# 2434 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv404)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv405 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv406)) : 'freshtv408)
    | MenhirState91 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv413 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | AND ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | COMMA | DOUBLEDOT | LOOP | OR | RPAR | SEMICOLON | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv409 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : 'tv_expr), _startpos_e1_), _, _startpos__3_), _endpos_e2_, _, (e2 : 'tv_expr), _startpos_e2_) = _menhir_stack in
            let _3 = () in
            let _2 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : 'tv_expr = let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
            
# 133 "parser.mly"
  ( Ebinop (e1, Borelse, e2), {fp = _startpos; lp = _endpos} )
# 2489 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv410)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv411 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv412)) : 'freshtv414)
    | MenhirState93 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv419 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | AND | COMMA | DOUBLEDOT | LOOP | OR | RPAR | SEMICOLON | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv415 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : 'tv_expr), _startpos_e1_), _endpos_e2_, _, (e2 : 'tv_expr), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 149 "parser.mly"
            ( Bneq )
# 2537 "parser.ml"
              
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
            
# 135 "parser.mly"
  ( Ebinop (e1, o, e2), {fp = _startpos; lp = _endpos} )
# 2545 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv416)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv417 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv418)) : 'freshtv420)
    | MenhirState95 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv425 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | AND | COMMA | DOUBLEDOT | EQ | LOOP | NEQ | OR | RPAR | SEMICOLON | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv421 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : 'tv_expr), _startpos_e1_), _endpos_e2_, _, (e2 : 'tv_expr), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 150 "parser.mly"
            ( Blt )
# 2585 "parser.ml"
              
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
            
# 135 "parser.mly"
  ( Ebinop (e1, o, e2), {fp = _startpos; lp = _endpos} )
# 2593 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv422)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv423 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv424)) : 'freshtv426)
    | MenhirState97 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv431 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIV ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | ADD | AND | COMMA | DOUBLEDOT | EQ | GE | GT | LE | LOOP | LT | NEQ | OR | RPAR | SEMICOLON | SUB | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv427 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : 'tv_expr), _startpos_e1_), _endpos_e2_, _, (e2 : 'tv_expr), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 154 "parser.mly"
            ( Badd )
# 2629 "parser.ml"
              
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
            
# 135 "parser.mly"
  ( Ebinop (e1, o, e2), {fp = _startpos; lp = _endpos} )
# 2637 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv428)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv429 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv430)) : 'freshtv432)
    | MenhirState99 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv437 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | AND | COMMA | DOUBLEDOT | EQ | LOOP | NEQ | OR | RPAR | SEMICOLON | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv433 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : 'tv_expr), _startpos_e1_), _endpos_e2_, _, (e2 : 'tv_expr), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 151 "parser.mly"
            ( Ble )
# 2677 "parser.ml"
              
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
            
# 135 "parser.mly"
  ( Ebinop (e1, o, e2), {fp = _startpos; lp = _endpos} )
# 2685 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv434)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv435 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv436)) : 'freshtv438)
    | MenhirState101 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv443 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | AND | COMMA | DOUBLEDOT | EQ | LOOP | NEQ | OR | RPAR | SEMICOLON | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv439 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : 'tv_expr), _startpos_e1_), _endpos_e2_, _, (e2 : 'tv_expr), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 152 "parser.mly"
            ( Bgt )
# 2725 "parser.ml"
              
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
            
# 135 "parser.mly"
  ( Ebinop (e1, o, e2), {fp = _startpos; lp = _endpos} )
# 2733 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv440)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv441 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv442)) : 'freshtv444)
    | MenhirState103 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv449 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | AND | COMMA | DOUBLEDOT | EQ | LOOP | NEQ | OR | RPAR | SEMICOLON | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv445 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : 'tv_expr), _startpos_e1_), _endpos_e2_, _, (e2 : 'tv_expr), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 153 "parser.mly"
            ( Bge )
# 2773 "parser.ml"
              
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
            
# 135 "parser.mly"
  ( Ebinop (e1, o, e2), {fp = _startpos; lp = _endpos} )
# 2781 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv446)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv447 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv448)) : 'freshtv450)
    | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv455 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | AND | COMMA | DOUBLEDOT | LOOP | OR | RPAR | SEMICOLON | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv451 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : 'tv_expr), _startpos_e1_), _endpos_e2_, _, (e2 : 'tv_expr), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 148 "parser.mly"
            ( Beq )
# 2829 "parser.ml"
              
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
            
# 135 "parser.mly"
  ( Ebinop (e1, o, e2), {fp = _startpos; lp = _endpos} )
# 2837 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv452)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv453 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv454)) : 'freshtv456)
    | MenhirState108 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv461 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | AND | COMMA | DOUBLEDOT | LOOP | OR | RPAR | SEMICOLON | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv457 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : 'tv_expr), _startpos_e1_), _), _endpos_e2_, _, (e2 : 'tv_expr), _startpos_e2_) = _menhir_stack in
            let _3 = () in
            let _2 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : 'tv_expr = let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
            
# 131 "parser.mly"
  ( Ebinop (e1, Bandthen, e2), {fp = _startpos; lp = _endpos} )
# 2890 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv458)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv459 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv460)) : 'freshtv462)
    | MenhirState107 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv467 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | AND | COMMA | DOUBLEDOT | LOOP | OR | RPAR | SEMICOLON | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv463 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : 'tv_expr), _startpos_e1_), _endpos_e2_, _, (e2 : 'tv_expr), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 159 "parser.mly"
            ( Band )
# 2942 "parser.ml"
              
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
            
# 135 "parser.mly"
  ( Ebinop (e1, o, e2), {fp = _startpos; lp = _endpos} )
# 2950 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv464)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv465 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv466)) : 'freshtv468)
    | MenhirState90 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv473 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | AND ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | COMMA | DOUBLEDOT | LOOP | OR | RPAR | SEMICOLON | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv469 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : 'tv_expr), _startpos_e1_), _endpos_e2_, _, (e2 : 'tv_expr), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 160 "parser.mly"
            ( Bor )
# 3004 "parser.ml"
              
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
            
# 135 "parser.mly"
  ( Ebinop (e1, o, e2), {fp = _startpos; lp = _endpos} )
# 3012 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv470)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv471 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv472)) : 'freshtv474)
    | MenhirState137 | MenhirState115 | MenhirState72 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv481 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | AND ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack)
        | COMMA ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv475 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CHAR _v ->
                _menhir_run76 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState115 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | CHARVAL ->
                _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FALSE ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState115 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState115 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INT _v ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState115 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LPAR ->
                _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NEW ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NOT ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NULL ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState115 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | SUB ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TRUE ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState115 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState115) : 'freshtv476)
        | DIV ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | RPAR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv477 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _endpos_x_, _menhir_s, (x : 'tv_expr), _startpos_x_) = _menhir_stack in
            let _v : 'tv_separated_nonempty_list_COMMA_expr_ = 
# 216 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( [ x ] )
# 3095 "parser.ml"
             in
            _menhir_goto_separated_nonempty_list_COMMA_expr_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv478)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv479 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv480)) : 'freshtv482)
    | MenhirState69 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv489 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | AND ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | RPAR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv485 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv483 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            let (_endpos__3_ : Lexing.position) = _endpos in
            ((let ((_menhir_stack, _menhir_s, _startpos__1_), _endpos_e_, _, (e : 'tv_expr), _startpos_e_) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos__3_ in
            let _v : 'tv_expr = let _endpos = _endpos__3_ in
            let _startpos = _startpos__1_ in
            
# 127 "parser.mly"
  ( fst e, {fp = _startpos; lp = _endpos} )
# 3155 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv484)) : 'freshtv486)
        | SUB ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv487 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv488)) : 'freshtv490)
    | MenhirState66 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv495 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | AND | COMMA | DOUBLEDOT | LOOP | OR | RPAR | SEMICOLON | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv491 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _startpos__1_), _endpos_e_, _, (e : 'tv_expr), _startpos_e_) = _menhir_stack in
            let _1 = () in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos_e_ in
            let _v : 'tv_expr = let _endpos = _endpos_e_ in
            let _startpos = _startpos__1_ in
            
# 137 "parser.mly"
  ( Eneg e, {fp = _startpos; lp = _endpos} )
# 3209 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv492)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv493 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv494)) : 'freshtv496)
    | MenhirState64 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv501 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOT ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | ADD | AND | COMMA | DIV | DOUBLEDOT | EQ | GE | GT | LE | LOOP | LT | MUL | NEQ | OR | REM | RPAR | SEMICOLON | SUB | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv497 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _startpos__1_), _endpos_e_, _, (e : 'tv_expr), _startpos_e_) = _menhir_stack in
            let _1 = () in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos_e_ in
            let _v : 'tv_expr = let _endpos = _endpos_e_ in
            let _startpos = _startpos__1_ in
            
# 139 "parser.mly"
  ( Ebinop ((Eint 0, dummy_loc), Bsub, e), {fp = _startpos; lp = _endpos} )
# 3239 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv498)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv499 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv500)) : 'freshtv502)
    | MenhirState62 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv509 * _menhir_state * 'tv_separated_nonempty_list_COMMA_IDENT_ * Lexing.position)) * _menhir_state * 'tv_stype)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | AND ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv505 * _menhir_state * 'tv_separated_nonempty_list_COMMA_IDENT_ * Lexing.position)) * _menhir_state * 'tv_stype)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv503 * _menhir_state * 'tv_separated_nonempty_list_COMMA_IDENT_ * Lexing.position)) * _menhir_state * 'tv_stype)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            let (_endpos__6_ : Lexing.position) = _endpos in
            ((let (((_menhir_stack, _menhir_s, (i : 'tv_separated_nonempty_list_COMMA_IDENT_), _startpos_i_), _, (t : 'tv_stype)), _endpos_e_, _, (e : 'tv_expr), _startpos_e_) = _menhir_stack in
            let _6 = () in
            let _4 = () in
            let _2 = () in
            let _v : 'tv_decl = let _endpos = _endpos__6_ in
            let _startpos = _startpos_i_ in
            
# 75 "parser.mly"
  ( Dident (i, t, Some e), {fp = _startpos; lp = _endpos} )
# 3298 "parser.ml"
             in
            _menhir_goto_decl _menhir_env _menhir_stack _menhir_s _v) : 'freshtv504)) : 'freshtv506)
        | SUB ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv507 * _menhir_state * 'tv_separated_nonempty_list_COMMA_IDENT_ * Lexing.position)) * _menhir_state * 'tv_stype)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv508)) : 'freshtv510)
    | MenhirState125 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv515 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | AND ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | LOOP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv511 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BEGIN ->
                _menhir_run150 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | CHAR _v ->
                _menhir_run76 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState127 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | CHARVAL ->
                _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FALSE ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState127 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FOR ->
                _menhir_run141 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run135 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState127 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IF ->
                _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INT _v ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState127 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LPAR ->
                _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NEW ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NOT ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NULL ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState127 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | RETURN ->
                _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | SUB ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TRUE ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState127 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | WHILE ->
                _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState127) : 'freshtv512)
        | LT ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv513 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv514)) : 'freshtv516)
    | MenhirState128 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv521 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | AND ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv517 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _endpos_x_, _menhir_s, (x : 'tv_expr), _startpos_x_) = _menhir_stack in
            let _v : 'tv_option_expr_ = 
# 103 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( Some x )
# 3434 "parser.ml"
             in
            _menhir_goto_option_expr_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv518)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv519 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv520)) : 'freshtv522)
    | MenhirState132 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv527 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | AND ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv523 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BEGIN ->
                _menhir_run150 _menhir_env (Obj.magic _menhir_stack) MenhirState134 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | CHAR _v ->
                _menhir_run76 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState134 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | CHARVAL ->
                _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState134 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FALSE ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState134 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FOR ->
                _menhir_run141 _menhir_env (Obj.magic _menhir_stack) MenhirState134 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run135 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState134 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IF ->
                _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState134 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INT _v ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState134 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LPAR ->
                _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState134 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NEW ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState134 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NOT ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState134 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NULL ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState134 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | RETURN ->
                _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState134 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | SUB ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState134 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TRUE ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState134 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | WHILE ->
                _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState134 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState134) : 'freshtv524)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv525 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv526)) : 'freshtv528)
    | MenhirState145 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv533 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 3532 "parser.ml"
        ) * Lexing.position)) * 'tv_option_REVERSE_) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | AND ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLEDOT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv529 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 3550 "parser.ml"
            ) * Lexing.position)) * 'tv_option_REVERSE_) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CHAR _v ->
                _menhir_run76 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState147 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | CHARVAL ->
                _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState147 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FALSE ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState147 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState147 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INT _v ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState147 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LPAR ->
                _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState147 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NEW ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState147 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NOT ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState147 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NULL ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState147 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | SUB ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState147 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TRUE ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState147 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState147) : 'freshtv530)
        | EQ ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv531 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 3608 "parser.ml"
            ) * Lexing.position)) * 'tv_option_REVERSE_) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv532)) : 'freshtv534)
    | MenhirState147 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv539 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 3617 "parser.ml"
        ) * Lexing.position)) * 'tv_option_REVERSE_) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | AND ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | LOOP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv535 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 3643 "parser.ml"
            ) * Lexing.position)) * 'tv_option_REVERSE_) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BEGIN ->
                _menhir_run150 _menhir_env (Obj.magic _menhir_stack) MenhirState149 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | CHAR _v ->
                _menhir_run76 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState149 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | CHARVAL ->
                _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState149 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FALSE ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState149 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FOR ->
                _menhir_run141 _menhir_env (Obj.magic _menhir_stack) MenhirState149 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run135 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState149 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IF ->
                _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState149 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INT _v ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState149 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LPAR ->
                _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState149 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NEW ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState149 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NOT ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState149 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NULL ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState149 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | RETURN ->
                _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState149 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | SUB ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState149 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TRUE ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState149 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | WHILE ->
                _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState149 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState149) : 'freshtv536)
        | LT ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv537 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 3703 "parser.ml"
            ) * Lexing.position)) * 'tv_option_REVERSE_) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv538)) : 'freshtv540)
    | MenhirState198 | MenhirState192 | MenhirState124 | MenhirState127 | MenhirState134 | MenhirState171 | MenhirState173 | MenhirState149 | MenhirState150 | MenhirState151 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv543 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | AND ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv541 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv542)) : 'freshtv544)
    | MenhirState155 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv551 * Lexing.position * _menhir_state * 'tv_access * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | AND ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv547 * Lexing.position * _menhir_state * 'tv_access * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv545 * Lexing.position * _menhir_state * 'tv_access * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            let (_endpos__4_ : Lexing.position) = _endpos in
            ((let ((_menhir_stack, _endpos_a_, _menhir_s, (a : 'tv_access), _startpos_a_), _endpos_e_, _, (e : 'tv_expr), _startpos_e_) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _v : 'tv_stmt = let _endpos = _endpos__4_ in
            let _startpos = _startpos_a_ in
            
# 90 "parser.mly"
  ( Saccess (a, e), {fp = _startpos; lp = _endpos} )
# 3796 "parser.ml"
             in
            _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv546)) : 'freshtv548)
        | SUB ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv549 * Lexing.position * _menhir_state * 'tv_access * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv550)) : 'freshtv552)
    | MenhirState169 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv557 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | AND ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv553 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BEGIN ->
                _menhir_run150 _menhir_env (Obj.magic _menhir_stack) MenhirState171 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | CHAR _v ->
                _menhir_run76 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState171 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | CHARVAL ->
                _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState171 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FALSE ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState171 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FOR ->
                _menhir_run141 _menhir_env (Obj.magic _menhir_stack) MenhirState171 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run135 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState171 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IF ->
                _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState171 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INT _v ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState171 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LPAR ->
                _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState171 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NEW ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState171 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NOT ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState171 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NULL ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState171 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | RETURN ->
                _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState171 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | SUB ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState171 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TRUE ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState171 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | WHILE ->
                _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState171 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState171) : 'freshtv554)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv555 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv556)) : 'freshtv558)
    | _ ->
        _menhir_fail ()

and _menhir_goto_stype : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_stype -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv345 * _menhir_state * 'tv_separated_nonempty_list_COMMA_IDENT_ * Lexing.position)) * _menhir_state * 'tv_stype) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv341 * _menhir_state * 'tv_separated_nonempty_list_COMMA_IDENT_ * Lexing.position)) * _menhir_state * 'tv_stype) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv339 * _menhir_state * 'tv_separated_nonempty_list_COMMA_IDENT_ * Lexing.position)) * _menhir_state * 'tv_stype) = Obj.magic _menhir_stack in
            let (_endpos__4_ : Lexing.position) = _endpos in
            ((let ((_menhir_stack, _menhir_s, (i : 'tv_separated_nonempty_list_COMMA_IDENT_), _startpos_i_), _, (t : 'tv_stype)) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _v : 'tv_field = 
# 164 "parser.mly"
  ( List.map (fun x -> (x, t)) i )
# 3918 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv337) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_field) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv335 * _menhir_state * 'tv_field) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | IDENT _v ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState29 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | END ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv333 * _menhir_state * 'tv_field) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, (x : 'tv_field)) = _menhir_stack in
                let _v : 'tv_nonempty_list_field_ = 
# 196 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( [ x ] )
# 3939 "parser.ml"
                 in
                _menhir_goto_nonempty_list_field_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv334)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState29) : 'freshtv336)) : 'freshtv338)) : 'freshtv340)) : 'freshtv342)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv343 * _menhir_state * 'tv_separated_nonempty_list_COMMA_IDENT_ * Lexing.position)) * _menhir_state * 'tv_stype) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv344)) : 'freshtv346)
    | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv359 * _menhir_state * 'tv_separated_nonempty_list_COMMA_IDENT_ * Lexing.position)) * 'tv_option_mode_) * _menhir_state * 'tv_stype) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv357 * _menhir_state * 'tv_separated_nonempty_list_COMMA_IDENT_ * Lexing.position)) * 'tv_option_mode_) * _menhir_state * 'tv_stype) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (i : 'tv_separated_nonempty_list_COMMA_IDENT_), _startpos_i_), (m : 'tv_option_mode_)), _, (t : 'tv_stype)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_param = 
# 172 "parser.mly"
  ( List.map (fun x -> (x, (match m with Some l -> l | None -> Min), t)) i )
# 3963 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv355) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_param) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv353 * _menhir_state * 'tv_param) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv347 * _menhir_state * 'tv_param) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_stack = (_menhir_stack, _endpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | IDENT _v ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState47 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState47) : 'freshtv348)
        | RPAR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv349 * _menhir_state * 'tv_param) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (x : 'tv_param)) = _menhir_stack in
            let _v : 'tv_separated_nonempty_list_SEMICOLON_param_ = 
# 216 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( [ x ] )
# 3996 "parser.ml"
             in
            _menhir_goto_separated_nonempty_list_SEMICOLON_param_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv350)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv351 * _menhir_state * 'tv_param) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv352)) : 'freshtv354)) : 'freshtv356)) : 'freshtv358)) : 'freshtv360)
    | MenhirState55 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv365 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 4011 "parser.ml"
        ) * Lexing.position) * _menhir_state * 'tv_option_params_) * Lexing.position) * _menhir_state * 'tv_stype) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IS ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv361 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 4021 "parser.ml"
            ) * Lexing.position) * _menhir_state * 'tv_option_params_) * Lexing.position) * _menhir_state * 'tv_stype) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | FUNCTION ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState57 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | PROCEDURE ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TYPE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | BEGIN ->
                _menhir_reduce42 _menhir_env (Obj.magic _menhir_stack) MenhirState57
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState57) : 'freshtv362)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv363 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 4047 "parser.ml"
            ) * Lexing.position) * _menhir_state * 'tv_option_params_) * Lexing.position) * _menhir_state * 'tv_stype) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv364)) : 'freshtv366)
    | MenhirState59 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv375 * _menhir_state * 'tv_separated_nonempty_list_COMMA_IDENT_ * Lexing.position)) * _menhir_state * 'tv_stype) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COLONEQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv367 * _menhir_state * 'tv_separated_nonempty_list_COMMA_IDENT_ * Lexing.position)) * _menhir_state * 'tv_stype) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CHAR _v ->
                _menhir_run76 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState62 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | CHARVAL ->
                _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FALSE ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState62 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState62 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INT _v ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState62 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LPAR ->
                _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NEW ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NOT ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NULL ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState62 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | SUB ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TRUE ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState62 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState62) : 'freshtv368)
        | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv371 * _menhir_state * 'tv_separated_nonempty_list_COMMA_IDENT_ * Lexing.position)) * _menhir_state * 'tv_stype) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv369 * _menhir_state * 'tv_separated_nonempty_list_COMMA_IDENT_ * Lexing.position)) * _menhir_state * 'tv_stype) = Obj.magic _menhir_stack in
            let (_endpos__4_ : Lexing.position) = _endpos in
            ((let ((_menhir_stack, _menhir_s, (i : 'tv_separated_nonempty_list_COMMA_IDENT_), _startpos_i_), _, (t : 'tv_stype)) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _v : 'tv_decl = let _endpos = _endpos__4_ in
            let _startpos = _startpos_i_ in
            
# 73 "parser.mly"
  ( Dident (i, t, None), {fp = _startpos; lp = _endpos} )
# 4105 "parser.ml"
             in
            _menhir_goto_decl _menhir_env _menhir_stack _menhir_s _v) : 'freshtv370)) : 'freshtv372)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv373 * _menhir_state * 'tv_separated_nonempty_list_COMMA_IDENT_ * Lexing.position)) * _menhir_state * 'tv_stype) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv374)) : 'freshtv376)
    | _ ->
        _menhir_fail ()

and _menhir_run125 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CHAR _v ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState125 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState125 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState125 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState125 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState125 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState125 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState125

and _menhir_run63 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv331) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _1 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_expr = let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    
# 121 "parser.mly"
  ( Ebool true, {fp = _startpos; lp = _endpos} )
# 4167 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv332)

and _menhir_run64 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CHAR _v ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState64 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState64 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState64 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState64 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState64 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState64 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState64 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState64 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState64 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState64 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState64 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState64

and _menhir_run128 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CHAR _v ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState128 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState128 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState128 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState128 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState128 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState128 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState128 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState128 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState128 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState128 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState128 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SEMICOLON ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv329) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState128 in
        ((let _v : 'tv_option_expr_ = 
# 101 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( None )
# 4239 "parser.ml"
         in
        _menhir_goto_option_expr_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv330)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState128

and _menhir_run65 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv327) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _1 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_expr = let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    
# 125 "parser.mly"
  ( Enull, {fp = _startpos; lp = _endpos} )
# 4263 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv328)

and _menhir_run66 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CHAR _v ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState66 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState66 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState66 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState66 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState66 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState66 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState66

and _menhir_run67 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv323 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_v : (
# 27 "parser.mly"
       (string)
# 4313 "parser.ml"
        )) = _v in
        let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv321 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos_i_ : Lexing.position) = _endpos in
        let ((i : (
# 27 "parser.mly"
       (string)
# 4323 "parser.ml"
        )) : (
# 27 "parser.mly"
       (string)
# 4327 "parser.ml"
        )) = _v in
        let (_startpos_i_ : Lexing.position) = _startpos in
        ((let (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let _1 = () in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_i_ in
        let _v : 'tv_expr = let _endpos = _endpos_i_ in
        let _startpos = _startpos__1_ in
        
# 141 "parser.mly"
  ( Enew i, {fp = _startpos; lp = _endpos} )
# 4339 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv322)) : 'freshtv324)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv325 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv326)

and _menhir_run69 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CHAR _v ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState69 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState69 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState69 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState69 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState69 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState69 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState69

and _menhir_run70 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 29 "parser.mly"
       (int)
# 4386 "parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv319) = Obj.magic _menhir_stack in
    let (_endpos_n_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((n : (
# 29 "parser.mly"
       (int)
# 4397 "parser.ml"
    )) : (
# 29 "parser.mly"
       (int)
# 4401 "parser.ml"
    )) = _v in
    let (_startpos_n_ : Lexing.position) = _startpos in
    ((let _startpos = _startpos_n_ in
    let _endpos = _endpos_n_ in
    let _v : 'tv_expr = let _endpos = _endpos_n_ in
    let _startpos = _startpos_n_ in
    
# 117 "parser.mly"
  ( Eint n, {fp = _startpos; lp = _endpos} )
# 4411 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv320)

and _menhir_run132 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CHAR _v ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState132 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState132 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState132 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState132 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState132 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState132 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState132

and _menhir_run135 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 27 "parser.mly"
       (string)
# 4451 "parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAR ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv311 * Lexing.position * _menhir_state * (
# 27 "parser.mly"
       (string)
# 4463 "parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        ((let _menhir_stack = (_menhir_stack, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CHAR _v ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState137 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | CHARVAL ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState137 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | FALSE ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState137 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | IDENT _v ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState137 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | INT _v ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState137 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LPAR ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState137 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | NEW ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState137 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | NOT ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState137 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | NULL ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState137 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | SUB ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState137 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TRUE ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState137 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState137) : 'freshtv312)
    | SEMICOLON ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv315 * Lexing.position * _menhir_state * (
# 27 "parser.mly"
       (string)
# 4501 "parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv313 * Lexing.position * _menhir_state * (
# 27 "parser.mly"
       (string)
# 4509 "parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos__2_ : Lexing.position) = _endpos in
        ((let (_menhir_stack, _endpos_i_, _menhir_s, (i : (
# 27 "parser.mly"
       (string)
# 4515 "parser.ml"
        )), _startpos_i_) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_stmt = let _endpos = _endpos__2_ in
        let _startpos = _startpos_i_ in
        
# 92 "parser.mly"
  ( Scall (i, []), {fp = _startpos; lp = _endpos} )
# 4523 "parser.ml"
         in
        _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv314)) : 'freshtv316)
    | ADD | AND | COLONEQ | DIV | DOT | EQ | GE | GT | LE | LT | MUL | NEQ | OR | REM | SUB ->
        _menhir_reduce1 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv317 * Lexing.position * _menhir_state * (
# 27 "parser.mly"
       (string)
# 4535 "parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv318)

and _menhir_run141 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv307 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_v : (
# 27 "parser.mly"
       (string)
# 4553 "parser.ml"
        )) = _v in
        let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        ((let _menhir_stack = (_menhir_stack, _endpos, _v, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv303 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 4565 "parser.ml"
            ) * Lexing.position) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | REVERSE ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv297) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv295) = Obj.magic _menhir_stack in
                ((let x = () in
                let _v : 'tv_option_REVERSE_ = 
# 103 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( Some x )
# 4580 "parser.ml"
                 in
                _menhir_goto_option_REVERSE_ _menhir_env _menhir_stack _v) : 'freshtv296)) : 'freshtv298)
            | CHAR _ | CHARVAL | FALSE | IDENT _ | INT _ | LPAR | NEW | NOT | NULL | SUB | TRUE ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv299) = Obj.magic _menhir_stack in
                ((let _v : 'tv_option_REVERSE_ = 
# 101 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( None )
# 4589 "parser.ml"
                 in
                _menhir_goto_option_REVERSE_ _menhir_env _menhir_stack _v) : 'freshtv300)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv301 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 4599 "parser.ml"
                ) * Lexing.position)) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, _), _, _, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv302)) : 'freshtv304)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv305 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 4610 "parser.ml"
            ) * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _), _, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv306)) : 'freshtv308)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv309 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv310)

and _menhir_run73 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv293) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _1 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_expr = let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    
# 123 "parser.mly"
  ( Ebool false, {fp = _startpos; lp = _endpos} )
# 4638 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv294)

and _menhir_run74 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAR ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv289 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        ((let _menhir_stack = (_menhir_stack, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CHAR _v ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState75 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | CHARVAL ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | FALSE ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState75 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | IDENT _v ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState75 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | INT _v ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState75 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LPAR ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | NEW ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | NOT ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | NULL ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState75 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | SUB ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TRUE ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState75 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState75) : 'freshtv290)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv291 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv292)

and _menhir_run76 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 30 "parser.mly"
       (char)
# 4693 "parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv287) = Obj.magic _menhir_stack in
    let (_endpos_c_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((c : (
# 30 "parser.mly"
       (char)
# 4704 "parser.ml"
    )) : (
# 30 "parser.mly"
       (char)
# 4708 "parser.ml"
    )) = _v in
    let (_startpos_c_ : Lexing.position) = _startpos in
    ((let _startpos = _startpos_c_ in
    let _endpos = _endpos_c_ in
    let _v : 'tv_expr = let _endpos = _endpos_c_ in
    let _startpos = _startpos_c_ in
    
# 119 "parser.mly"
  ( Echar c, {fp = _startpos; lp = _endpos} )
# 4718 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv288)

and _menhir_run150 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run150 _menhir_env (Obj.magic _menhir_stack) MenhirState150 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHAR _v ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState150 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState150 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState150 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FOR ->
        _menhir_run141 _menhir_env (Obj.magic _menhir_stack) MenhirState150 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run135 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState150 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IF ->
        _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState150 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState150 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState150 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState150 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState150 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState150 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | RETURN ->
        _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState150 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState150 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState150 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | WHILE ->
        _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState150 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState150

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_option_mode_ : _menhir_env -> 'ttv_tail -> 'tv_option_mode_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv285 * _menhir_state * 'tv_separated_nonempty_list_COMMA_IDENT_ * Lexing.position)) * 'tv_option_mode_) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ACCESS ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | IDENT _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState43 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState43) : 'freshtv286)

and _menhir_goto_mode : _menhir_env -> 'ttv_tail -> 'tv_mode -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv283) = Obj.magic _menhir_stack in
    let (_v : 'tv_mode) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv281) = Obj.magic _menhir_stack in
    let ((x : 'tv_mode) : 'tv_mode) = _v in
    ((let _v : 'tv_option_mode_ = 
# 103 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( Some x )
# 4798 "parser.ml"
     in
    _menhir_goto_option_mode_ _menhir_env _menhir_stack _v) : 'freshtv282)) : 'freshtv284)

and _menhir_run20 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 27 "parser.mly"
       (string)
# 4805 "parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv279) = Obj.magic _menhir_stack in
    let (_endpos_i_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((i : (
# 27 "parser.mly"
       (string)
# 4816 "parser.ml"
    )) : (
# 27 "parser.mly"
       (string)
# 4820 "parser.ml"
    )) = _v in
    let (_startpos_i_ : Lexing.position) = _startpos in
    ((let _v : 'tv_stype = 
# 183 "parser.mly"
  ( STident i )
# 4826 "parser.ml"
     in
    _menhir_goto_stype _menhir_env _menhir_stack _menhir_s _v) : 'freshtv280)

and _menhir_run21 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv275 * _menhir_state) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_v : (
# 27 "parser.mly"
       (string)
# 4843 "parser.ml"
        )) = _v in
        let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv273 * _menhir_state) = Obj.magic _menhir_stack in
        let (_endpos_i_ : Lexing.position) = _endpos in
        let ((i : (
# 27 "parser.mly"
       (string)
# 4853 "parser.ml"
        )) : (
# 27 "parser.mly"
       (string)
# 4857 "parser.ml"
        )) = _v in
        let (_startpos_i_ : Lexing.position) = _startpos in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_stype = 
# 185 "parser.mly"
  ( STaccess i )
# 4865 "parser.ml"
         in
        _menhir_goto_stype _menhir_env _menhir_stack _menhir_s _v) : 'freshtv274)) : 'freshtv276)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv277 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv278)

and _menhir_goto_option_params_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_option_params_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState35 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv265 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 4885 "parser.ml"
        ) * Lexing.position) * _menhir_state * 'tv_option_params_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IS ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv261 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 4895 "parser.ml"
            ) * Lexing.position) * _menhir_state * 'tv_option_params_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | FUNCTION ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState51 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | PROCEDURE ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TYPE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | BEGIN ->
                _menhir_reduce42 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState51) : 'freshtv262)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv263 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 4921 "parser.ml"
            ) * Lexing.position) * _menhir_state * 'tv_option_params_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv264)) : 'freshtv266)
    | MenhirState53 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv271 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 4930 "parser.ml"
        ) * Lexing.position) * _menhir_state * 'tv_option_params_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RETURN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv267 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 4940 "parser.ml"
            ) * Lexing.position) * _menhir_state * 'tv_option_params_) = Obj.magic _menhir_stack in
            let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
            ((let _menhir_stack = (_menhir_stack, _startpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ACCESS ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState55
            | IDENT _v ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState55 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState55) : 'freshtv268)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv269 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 4962 "parser.ml"
            ) * Lexing.position) * _menhir_state * 'tv_option_params_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv270)) : 'freshtv272)
    | _ ->
        _menhir_fail ()

and _menhir_goto_list_decl_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_list_decl_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState57 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv243 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 4978 "parser.ml"
        ) * Lexing.position) * _menhir_state * 'tv_option_params_) * Lexing.position) * _menhir_state * 'tv_stype)) * _menhir_state * 'tv_list_decl_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BEGIN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv239 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 4988 "parser.ml"
            ) * Lexing.position) * _menhir_state * 'tv_option_params_) * Lexing.position) * _menhir_state * 'tv_stype)) * _menhir_state * 'tv_list_decl_) = Obj.magic _menhir_stack in
            let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
            ((let _menhir_stack = (_menhir_stack, _startpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BEGIN ->
                _menhir_run150 _menhir_env (Obj.magic _menhir_stack) MenhirState124 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | CHAR _v ->
                _menhir_run76 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState124 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | CHARVAL ->
                _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState124 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FALSE ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState124 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FOR ->
                _menhir_run141 _menhir_env (Obj.magic _menhir_stack) MenhirState124 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run135 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState124 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IF ->
                _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState124 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INT _v ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState124 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LPAR ->
                _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState124 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NEW ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState124 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NOT ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState124 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NULL ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState124 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | RETURN ->
                _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState124 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | SUB ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState124 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TRUE ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState124 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | WHILE ->
                _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState124 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState124) : 'freshtv240)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv241 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 5038 "parser.ml"
            ) * Lexing.position) * _menhir_state * 'tv_option_params_) * Lexing.position) * _menhir_state * 'tv_stype)) * _menhir_state * 'tv_list_decl_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv242)) : 'freshtv244)
    | MenhirState189 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv247 * _menhir_state * 'tv_decl) * _menhir_state * 'tv_list_decl_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv245 * _menhir_state * 'tv_decl) * _menhir_state * 'tv_list_decl_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (x : 'tv_decl)), _, (xs : 'tv_list_decl_)) = _menhir_stack in
        let _v : 'tv_list_decl_ = 
# 188 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( x :: xs )
# 5051 "parser.ml"
         in
        _menhir_goto_list_decl_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv246)) : 'freshtv248)
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv253 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 5059 "parser.ml"
        ) * Lexing.position) * _menhir_state * 'tv_option_params_)) * _menhir_state * 'tv_list_decl_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BEGIN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv249 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 5069 "parser.ml"
            ) * Lexing.position) * _menhir_state * 'tv_option_params_)) * _menhir_state * 'tv_list_decl_) = Obj.magic _menhir_stack in
            let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
            ((let _menhir_stack = (_menhir_stack, _startpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BEGIN ->
                _menhir_run150 _menhir_env (Obj.magic _menhir_stack) MenhirState192 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | CHAR _v ->
                _menhir_run76 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState192 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | CHARVAL ->
                _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState192 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FALSE ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState192 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FOR ->
                _menhir_run141 _menhir_env (Obj.magic _menhir_stack) MenhirState192 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run135 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState192 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IF ->
                _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState192 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INT _v ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState192 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LPAR ->
                _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState192 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NEW ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState192 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NOT ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState192 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NULL ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState192 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | RETURN ->
                _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState192 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | SUB ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState192 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TRUE ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState192 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | WHILE ->
                _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState192 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState192) : 'freshtv250)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv251 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 5119 "parser.ml"
            ) * Lexing.position) * _menhir_state * 'tv_option_params_)) * _menhir_state * 'tv_list_decl_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv252)) : 'freshtv254)
    | MenhirState9 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((((('freshtv259)) * Lexing.position))) * Lexing.position) * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 5128 "parser.ml"
        ) * Lexing.position)) * _menhir_state * 'tv_list_decl_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BEGIN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((((((('freshtv255)) * Lexing.position))) * Lexing.position) * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 5138 "parser.ml"
            ) * Lexing.position)) * _menhir_state * 'tv_list_decl_) = Obj.magic _menhir_stack in
            let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
            ((let _menhir_stack = (_menhir_stack, _startpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BEGIN ->
                _menhir_run150 _menhir_env (Obj.magic _menhir_stack) MenhirState198 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | CHAR _v ->
                _menhir_run76 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState198 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | CHARVAL ->
                _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState198 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FALSE ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState198 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FOR ->
                _menhir_run141 _menhir_env (Obj.magic _menhir_stack) MenhirState198 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run135 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState198 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IF ->
                _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState198 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INT _v ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState198 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LPAR ->
                _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState198 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NEW ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState198 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NOT ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState198 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NULL ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState198 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | RETURN ->
                _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState198 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | SUB ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState198 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TRUE ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState198 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | WHILE ->
                _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState198 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState198) : 'freshtv256)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((((((('freshtv257)) * Lexing.position))) * Lexing.position) * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 5188 "parser.ml"
            ) * Lexing.position)) * _menhir_state * 'tv_list_decl_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv258)) : 'freshtv260)
    | _ ->
        _menhir_fail ()

and _menhir_goto_decl : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_decl -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv237 * _menhir_state * 'tv_decl) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FUNCTION ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState189 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState189 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PROCEDURE ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState189 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TYPE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState189 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | BEGIN ->
        _menhir_reduce42 _menhir_env (Obj.magic _menhir_stack) MenhirState189
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState189) : 'freshtv238)

and _menhir_goto_separated_nonempty_list_COMMA_IDENT_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_separated_nonempty_list_COMMA_IDENT_ -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v, _startpos) in
    match _menhir_s with
    | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv203 * Lexing.position * _menhir_state * (
# 27 "parser.mly"
       (string)
# 5227 "parser.ml"
        ) * Lexing.position)) * _menhir_state * 'tv_separated_nonempty_list_COMMA_IDENT_ * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv201 * Lexing.position * _menhir_state * (
# 27 "parser.mly"
       (string)
# 5233 "parser.ml"
        ) * Lexing.position)) * _menhir_state * 'tv_separated_nonempty_list_COMMA_IDENT_ * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _endpos_x_, _menhir_s, (x : (
# 27 "parser.mly"
       (string)
# 5238 "parser.ml"
        )), _startpos_x_), _, (xs : 'tv_separated_nonempty_list_COMMA_IDENT_), _startpos_xs_) = _menhir_stack in
        let _2 = () in
        let _startpos = _startpos_x_ in
        let _v : 'tv_separated_nonempty_list_COMMA_IDENT_ = 
# 218 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( x :: xs )
# 5245 "parser.ml"
         in
        _menhir_goto_separated_nonempty_list_COMMA_IDENT_ _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv202)) : 'freshtv204)
    | MenhirState29 | MenhirState14 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv209 * _menhir_state * 'tv_separated_nonempty_list_COMMA_IDENT_ * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv205 * _menhir_state * 'tv_separated_nonempty_list_COMMA_IDENT_ * Lexing.position) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ACCESS ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | IDENT _v ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState19 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState19) : 'freshtv206)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv207 * _menhir_state * 'tv_separated_nonempty_list_COMMA_IDENT_ * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv208)) : 'freshtv210)
    | MenhirState47 | MenhirState36 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv229 * _menhir_state * 'tv_separated_nonempty_list_COMMA_IDENT_ * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv225 * _menhir_state * 'tv_separated_nonempty_list_COMMA_IDENT_ * Lexing.position) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | IN ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv219) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | OUT ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv213) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv211) = Obj.magic _menhir_stack in
                    ((let _2 = () in
                    let _1 = () in
                    let _v : 'tv_mode = 
# 177 "parser.mly"
  ( Minout )
# 5304 "parser.ml"
                     in
                    _menhir_goto_mode _menhir_env _menhir_stack _v) : 'freshtv212)) : 'freshtv214)
                | ACCESS | IDENT _ ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv215) = Obj.magic _menhir_stack in
                    ((let _1 = () in
                    let _v : 'tv_mode = 
# 179 "parser.mly"
  ( Min )
# 5314 "parser.ml"
                     in
                    _menhir_goto_mode _menhir_env _menhir_stack _v) : 'freshtv216)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv217) = Obj.magic _menhir_stack in
                    (raise _eRR : 'freshtv218)) : 'freshtv220)
            | ACCESS | IDENT _ ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv221) = Obj.magic _menhir_stack in
                ((let _v : 'tv_option_mode_ = 
# 101 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( None )
# 5329 "parser.ml"
                 in
                _menhir_goto_option_mode_ _menhir_env _menhir_stack _v) : 'freshtv222)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv223 * _menhir_state * 'tv_separated_nonempty_list_COMMA_IDENT_ * Lexing.position)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv224)) : 'freshtv226)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv227 * _menhir_state * 'tv_separated_nonempty_list_COMMA_IDENT_ * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv228)) : 'freshtv230)
    | MenhirState9 | MenhirState51 | MenhirState189 | MenhirState57 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv235 * _menhir_state * 'tv_separated_nonempty_list_COMMA_IDENT_ * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv231 * _menhir_state * 'tv_separated_nonempty_list_COMMA_IDENT_ * Lexing.position) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ACCESS ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | IDENT _v ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState59 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState59) : 'freshtv232)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv233 * _menhir_state * 'tv_separated_nonempty_list_COMMA_IDENT_ * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv234)) : 'freshtv236)
    | _ ->
        _menhir_fail ()

and _menhir_reduce58 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_option_params_ = 
# 101 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( None )
# 5381 "parser.ml"
     in
    _menhir_goto_option_params_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run36 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState36 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState36

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState200 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((((((('freshtv81)) * Lexing.position))) * Lexing.position) * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 5406 "parser.ml"
        ) * Lexing.position)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv82)
    | MenhirState198 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((((('freshtv83)) * Lexing.position))) * Lexing.position) * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 5415 "parser.ml"
        ) * Lexing.position)) * _menhir_state * 'tv_list_decl_) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv84)
    | MenhirState194 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv85 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 5424 "parser.ml"
        ) * Lexing.position) * _menhir_state * 'tv_option_params_)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv86)
    | MenhirState192 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv87 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 5433 "parser.ml"
        ) * Lexing.position) * _menhir_state * 'tv_option_params_)) * _menhir_state * 'tv_list_decl_) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv88)
    | MenhirState189 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv89 * _menhir_state * 'tv_decl) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv90)
    | MenhirState185 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((((('freshtv91 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 5447 "parser.ml"
        ) * Lexing.position) * _menhir_state * 'tv_option_params_) * Lexing.position) * _menhir_state * 'tv_stype)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv92)
    | MenhirState173 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv93 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv94)
    | MenhirState172 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv95 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv96)
    | MenhirState171 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv97 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv98)
    | MenhirState169 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv99 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv100)
    | MenhirState165 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv101 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv102)
    | MenhirState155 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv103 * Lexing.position * _menhir_state * 'tv_access * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv104)
    | MenhirState151 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv105 * _menhir_state * 'tv_stmt) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv106)
    | MenhirState150 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv107 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv108)
    | MenhirState149 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv109 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 5496 "parser.ml"
        ) * Lexing.position)) * 'tv_option_REVERSE_) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv110)
    | MenhirState147 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv111 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 5505 "parser.ml"
        ) * Lexing.position)) * 'tv_option_REVERSE_) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv112)
    | MenhirState145 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv113 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 5514 "parser.ml"
        ) * Lexing.position)) * 'tv_option_REVERSE_) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, _), _, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv114)
    | MenhirState137 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv115 * Lexing.position * _menhir_state * (
# 27 "parser.mly"
       (string)
# 5523 "parser.ml"
        ) * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _, _menhir_s, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv116)
    | MenhirState134 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv117 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv118)
    | MenhirState132 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv119 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv120)
    | MenhirState128 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv121 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv122)
    | MenhirState127 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv123 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv124)
    | MenhirState125 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv125 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv126)
    | MenhirState124 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv127 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 5557 "parser.ml"
        ) * Lexing.position) * _menhir_state * 'tv_option_params_) * Lexing.position) * _menhir_state * 'tv_stype)) * _menhir_state * 'tv_list_decl_) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv128)
    | MenhirState115 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv129 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv130)
    | MenhirState108 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv131 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv132)
    | MenhirState107 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv133 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv134)
    | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv135 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv136)
    | MenhirState103 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv137 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv138)
    | MenhirState101 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv139 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv140)
    | MenhirState99 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv141 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv142)
    | MenhirState97 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv143 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv144)
    | MenhirState95 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv145 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv146)
    | MenhirState93 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv147 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv148)
    | MenhirState91 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv149 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv150)
    | MenhirState90 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv151 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv152)
    | MenhirState87 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv153 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv154)
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv155 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv156)
    | MenhirState80 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv157 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv158)
    | MenhirState78 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv159 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _, _menhir_s, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv160)
    | MenhirState75 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv161 * _menhir_state * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv162)
    | MenhirState72 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv163 * Lexing.position * _menhir_state * (
# 27 "parser.mly"
       (string)
# 5651 "parser.ml"
        ) * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _, _menhir_s, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv164)
    | MenhirState69 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv165 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv166)
    | MenhirState66 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv167 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv168)
    | MenhirState64 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv169 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv170)
    | MenhirState62 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv171 * _menhir_state * 'tv_separated_nonempty_list_COMMA_IDENT_ * Lexing.position)) * _menhir_state * 'tv_stype)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv172)
    | MenhirState59 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv173 * _menhir_state * 'tv_separated_nonempty_list_COMMA_IDENT_ * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv174)
    | MenhirState57 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv175 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 5685 "parser.ml"
        ) * Lexing.position) * _menhir_state * 'tv_option_params_) * Lexing.position) * _menhir_state * 'tv_stype)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv176)
    | MenhirState55 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv177 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 5694 "parser.ml"
        ) * Lexing.position) * _menhir_state * 'tv_option_params_) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv178)
    | MenhirState53 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv179 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 5703 "parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv180)
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv181 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 5712 "parser.ml"
        ) * Lexing.position) * _menhir_state * 'tv_option_params_)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv182)
    | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv183 * _menhir_state * 'tv_param) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv184)
    | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv185 * _menhir_state * 'tv_separated_nonempty_list_COMMA_IDENT_ * Lexing.position)) * 'tv_option_mode_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv186)
    | MenhirState36 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv187 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv188)
    | MenhirState35 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv189 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 5736 "parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv190)
    | MenhirState29 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv191 * _menhir_state * 'tv_field) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv192)
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv193 * _menhir_state * 'tv_separated_nonempty_list_COMMA_IDENT_ * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv194)
    | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv195 * Lexing.position * _menhir_state * (
# 27 "parser.mly"
       (string)
# 5755 "parser.ml"
        ) * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv196)
    | MenhirState14 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv197 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 5764 "parser.ml"
        ) * Lexing.position))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv198)
    | MenhirState9 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((('freshtv199)) * Lexing.position))) * Lexing.position) * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 5773 "parser.ml"
        ) * Lexing.position)) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv200)

and _menhir_reduce42 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_list_decl_ = 
# 186 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( [] )
# 5782 "parser.ml"
     in
    _menhir_goto_list_decl_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv77 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_v : (
# 27 "parser.mly"
       (string)
# 5799 "parser.ml"
        )) = _v in
        let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        ((let _menhir_stack = (_menhir_stack, _endpos, _v, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IS ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv69 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 5811 "parser.ml"
            ) * Lexing.position) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ACCESS ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv63 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 5821 "parser.ml"
                ) * Lexing.position)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | IDENT _v ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv59 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 5831 "parser.ml"
                    ) * Lexing.position))) = Obj.magic _menhir_stack in
                    let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
                    let (_v : (
# 27 "parser.mly"
       (string)
# 5837 "parser.ml"
                    )) = _v in
                    let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
                    ((let _menhir_stack = (_menhir_stack, _endpos, _v, _startpos) in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | SEMICOLON ->
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : (((('freshtv55 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 5849 "parser.ml"
                        ) * Lexing.position))) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 5853 "parser.ml"
                        ) * Lexing.position) = Obj.magic _menhir_stack in
                        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
                        ((let _menhir_env = _menhir_discard _menhir_env in
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : (((('freshtv53 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 5861 "parser.ml"
                        ) * Lexing.position))) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 5865 "parser.ml"
                        ) * Lexing.position) = Obj.magic _menhir_stack in
                        let (_endpos__6_ : Lexing.position) = _endpos in
                        ((let (((_menhir_stack, _menhir_s, _startpos__1_), _endpos_i1_, (i1 : (
# 27 "parser.mly"
       (string)
# 5871 "parser.ml"
                        )), _startpos_i1_), _endpos_i2_, (i2 : (
# 27 "parser.mly"
       (string)
# 5875 "parser.ml"
                        )), _startpos_i2_) = _menhir_stack in
                        let _6 = () in
                        let _4 = () in
                        let _3 = () in
                        let _1 = () in
                        let _v : 'tv_decl = let _endpos = _endpos__6_ in
                        let _startpos = _startpos__1_ in
                        
# 69 "parser.mly"
  ( Daccesstype (i1, i2), {fp = _startpos; lp = _endpos} )
# 5886 "parser.ml"
                         in
                        _menhir_goto_decl _menhir_env _menhir_stack _menhir_s _v) : 'freshtv54)) : 'freshtv56)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : (((('freshtv57 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 5896 "parser.ml"
                        ) * Lexing.position))) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 5900 "parser.ml"
                        ) * Lexing.position) = Obj.magic _menhir_stack in
                        ((let (((_menhir_stack, _menhir_s, _), _, _, _), _, _, _) = _menhir_stack in
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv58)) : 'freshtv60)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv61 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 5911 "parser.ml"
                    ) * Lexing.position))) = Obj.magic _menhir_stack in
                    ((let ((_menhir_stack, _menhir_s, _), _, _, _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)) : 'freshtv64)
            | RECORD ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv65 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 5920 "parser.ml"
                ) * Lexing.position)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | IDENT _v ->
                    _menhir_run15 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState14 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState14) : 'freshtv66)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv67 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 5938 "parser.ml"
                ) * Lexing.position)) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, _), _, _, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv68)) : 'freshtv70)
        | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv73 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 5947 "parser.ml"
            ) * Lexing.position) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv71 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 5955 "parser.ml"
            ) * Lexing.position) = Obj.magic _menhir_stack in
            let (_endpos__3_ : Lexing.position) = _endpos in
            ((let ((_menhir_stack, _menhir_s, _startpos__1_), _endpos_i_, (i : (
# 27 "parser.mly"
       (string)
# 5961 "parser.ml"
            )), _startpos_i_) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_decl = let _endpos = _endpos__3_ in
            let _startpos = _startpos__1_ in
            
# 67 "parser.mly"
  ( Dtype i, {fp = _startpos; lp = _endpos} )
# 5970 "parser.ml"
             in
            _menhir_goto_decl _menhir_env _menhir_stack _menhir_s _v) : 'freshtv72)) : 'freshtv74)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv75 * _menhir_state * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 5980 "parser.ml"
            ) * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _), _, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv76)) : 'freshtv78)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv79 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv80)

and _menhir_run34 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv49 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_v : (
# 27 "parser.mly"
       (string)
# 6005 "parser.ml"
        )) = _v in
        let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        ((let _menhir_stack = (_menhir_stack, _endpos, _v, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | LPAR ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | IS ->
            _menhir_reduce58 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState35) : 'freshtv50)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv51 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)

and _menhir_run15 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 27 "parser.mly"
       (string)
# 6031 "parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMMA ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv43 * Lexing.position * _menhir_state * (
# 27 "parser.mly"
       (string)
# 6043 "parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IDENT _v ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState16 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState16) : 'freshtv44)
    | COLON ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv45 * Lexing.position * _menhir_state * (
# 27 "parser.mly"
       (string)
# 6059 "parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _endpos_x_, _menhir_s, (x : (
# 27 "parser.mly"
       (string)
# 6064 "parser.ml"
        )), _startpos_x_) = _menhir_stack in
        let _startpos = _startpos_x_ in
        let _v : 'tv_separated_nonempty_list_COMMA_IDENT_ = 
# 216 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( [ x ] )
# 6070 "parser.ml"
         in
        _menhir_goto_separated_nonempty_list_COMMA_IDENT_ _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv46)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv47 * Lexing.position * _menhir_state * (
# 27 "parser.mly"
       (string)
# 6080 "parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)

and _menhir_run52 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv39 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_v : (
# 27 "parser.mly"
       (string)
# 6098 "parser.ml"
        )) = _v in
        let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        ((let _menhir_stack = (_menhir_stack, _endpos, _v, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | LPAR ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | RETURN ->
            _menhir_reduce58 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState53) : 'freshtv40)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv41 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and file : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 49 "parser.mly"
      (Ast.file)
# 6136 "parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env =
      let (lexer : Lexing.lexbuf -> token) = lexer in
      let (lexbuf : Lexing.lexbuf) = lexbuf in
      ((let _tok = Obj.magic () in
      {
        _menhir_lexer = lexer;
        _menhir_lexbuf = lexbuf;
        _menhir_token = _tok;
        _menhir_error = false;
      }) : _menhir_env)
    in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv37) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | WITH ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv33) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | STDLIB ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv29) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEMICOLON ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv25)) = Obj.magic _menhir_stack in
                let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
                ((let _menhir_stack = (_menhir_stack, _endpos) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | USE ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv21)) * Lexing.position) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | STDLIB ->
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : ((('freshtv17)) * Lexing.position)) = Obj.magic _menhir_stack in
                        ((let _menhir_env = _menhir_discard _menhir_env in
                        let _tok = _menhir_env._menhir_token in
                        match _tok with
                        | SEMICOLON ->
                            let (_menhir_env : _menhir_env) = _menhir_env in
                            let (_menhir_stack : (((('freshtv13)) * Lexing.position))) = Obj.magic _menhir_stack in
                            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
                            ((let _menhir_stack = (_menhir_stack, _endpos) in
                            let _menhir_env = _menhir_discard _menhir_env in
                            let _tok = _menhir_env._menhir_token in
                            match _tok with
                            | PROCEDURE ->
                                let (_menhir_env : _menhir_env) = _menhir_env in
                                let (_menhir_stack : ((((('freshtv9)) * Lexing.position))) * Lexing.position) = Obj.magic _menhir_stack in
                                let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
                                ((let _menhir_stack = (_menhir_stack, _startpos) in
                                let _menhir_env = _menhir_discard _menhir_env in
                                let _tok = _menhir_env._menhir_token in
                                match _tok with
                                | IDENT _v ->
                                    let (_menhir_env : _menhir_env) = _menhir_env in
                                    let (_menhir_stack : (((((('freshtv5)) * Lexing.position))) * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
                                    let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
                                    let (_v : (
# 27 "parser.mly"
       (string)
# 6210 "parser.ml"
                                    )) = _v in
                                    let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
                                    ((let _menhir_stack = (_menhir_stack, _endpos, _v, _startpos) in
                                    let _menhir_env = _menhir_discard _menhir_env in
                                    let _tok = _menhir_env._menhir_token in
                                    match _tok with
                                    | IS ->
                                        let (_menhir_env : _menhir_env) = _menhir_env in
                                        let (_menhir_stack : ((((((('freshtv1)) * Lexing.position))) * Lexing.position) * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 6222 "parser.ml"
                                        ) * Lexing.position) = Obj.magic _menhir_stack in
                                        ((let _menhir_env = _menhir_discard _menhir_env in
                                        let _tok = _menhir_env._menhir_token in
                                        match _tok with
                                        | FUNCTION ->
                                            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                                        | IDENT _v ->
                                            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState9 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                                        | PROCEDURE ->
                                            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                                        | TYPE ->
                                            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                                        | BEGIN ->
                                            _menhir_reduce42 _menhir_env (Obj.magic _menhir_stack) MenhirState9
                                        | _ ->
                                            assert (not _menhir_env._menhir_error);
                                            _menhir_env._menhir_error <- true;
                                            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState9) : 'freshtv2)
                                    | _ ->
                                        assert (not _menhir_env._menhir_error);
                                        _menhir_env._menhir_error <- true;
                                        let (_menhir_env : _menhir_env) = _menhir_env in
                                        let (_menhir_stack : ((((((('freshtv3)) * Lexing.position))) * Lexing.position) * Lexing.position) * Lexing.position * (
# 27 "parser.mly"
       (string)
# 6248 "parser.ml"
                                        ) * Lexing.position) = Obj.magic _menhir_stack in
                                        (raise _eRR : 'freshtv4)) : 'freshtv6)
                                | _ ->
                                    assert (not _menhir_env._menhir_error);
                                    _menhir_env._menhir_error <- true;
                                    let (_menhir_env : _menhir_env) = _menhir_env in
                                    let (_menhir_stack : (((((('freshtv7)) * Lexing.position))) * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
                                    (raise _eRR : 'freshtv8)) : 'freshtv10)
                            | _ ->
                                assert (not _menhir_env._menhir_error);
                                _menhir_env._menhir_error <- true;
                                let (_menhir_env : _menhir_env) = _menhir_env in
                                let (_menhir_stack : ((((('freshtv11)) * Lexing.position))) * Lexing.position) = Obj.magic _menhir_stack in
                                (raise _eRR : 'freshtv12)) : 'freshtv14)
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            let (_menhir_env : _menhir_env) = _menhir_env in
                            let (_menhir_stack : (((('freshtv15)) * Lexing.position))) = Obj.magic _menhir_stack in
                            (raise _eRR : 'freshtv16)) : 'freshtv18)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : ((('freshtv19)) * Lexing.position)) = Obj.magic _menhir_stack in
                        (raise _eRR : 'freshtv20)) : 'freshtv22)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv23)) * Lexing.position) = Obj.magic _menhir_stack in
                    (raise _eRR : 'freshtv24)) : 'freshtv26)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv27)) = Obj.magic _menhir_stack in
                (raise _eRR : 'freshtv28)) : 'freshtv30)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv31) = Obj.magic _menhir_stack in
            (raise _eRR : 'freshtv32)) : 'freshtv34)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv35) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv36)) : 'freshtv38))

# 220 "/home/md5/.opam/default/lib/menhir/standard.mly"
  


# 6304 "parser.ml"
