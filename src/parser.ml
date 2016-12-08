
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
# 31 "parser.mly"
       (int)
# 38 "parser.ml"
  )
    | IN
    | IF
    | IDENT of (
# 29 "parser.mly"
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
# 32 "parser.mly"
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
  | MenhirState201
  | MenhirState199
  | MenhirState195
  | MenhirState193
  | MenhirState190
  | MenhirState186
  | MenhirState174
  | MenhirState173
  | MenhirState172
  | MenhirState170
  | MenhirState166
  | MenhirState156
  | MenhirState150
  | MenhirState146
  | MenhirState145
  | MenhirState144
  | MenhirState142
  | MenhirState140
  | MenhirState136
  | MenhirState135
  | MenhirState133
  | MenhirState129
  | MenhirState128
  | MenhirState126
  | MenhirState125
  | MenhirState114
  | MenhirState110
  | MenhirState109
  | MenhirState107
  | MenhirState105
  | MenhirState103
  | MenhirState101
  | MenhirState99
  | MenhirState97
  | MenhirState95
  | MenhirState93
  | MenhirState92
  | MenhirState90
  | MenhirState88
  | MenhirState85
  | MenhirState83
  | MenhirState81
  | MenhirState77
  | MenhirState74
  | MenhirState70
  | MenhirState68
  | MenhirState67
  | MenhirState65
  | MenhirState63
  | MenhirState60
  | MenhirState58
  | MenhirState56
  | MenhirState54
  | MenhirState53
  | MenhirState52
  | MenhirState48
  | MenhirState44
  | MenhirState37
  | MenhirState36
  | MenhirState35
  | MenhirState32
  | MenhirState30
  | MenhirState28
  | MenhirState18
  | MenhirState17
  | MenhirState15
  | MenhirState11
  | MenhirState10
  | MenhirState7

# 3 "parser.mly"
  
  open Ast
  open Lexing

  let check_same_identifiers (i1, _) o2 = match o2 with
    | Some (i2, _) when String.lowercase i1 <> String.lowercase i2 -> failwith ("Two different identifiers")
    | _ -> ()

  let dummy_loc =
    { fp = Lexing.dummy_pos; lp = Lexing.dummy_pos }

# 171 "parser.ml"

let rec _menhir_reduce55 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_option_identifier_ = 
# 101 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( None )
# 178 "parser.ml"
     in
    _menhir_goto_option_identifier_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_condition : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_condition -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v ->
    match _menhir_s with
    | MenhirState173 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv803 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_condition) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv801 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
        let (_endpos_c_ : Lexing.position) = _endpos in
        let (_ : _menhir_state) = _menhir_s in
        let ((c : 'tv_condition) : 'tv_condition) = _v in
        ((let (((_menhir_stack, _menhir_s, _startpos__1_), _endpos_e_, _, (e : 'tv_expr), _startpos_e_), _, (s : 'tv_nonempty_list_stmt_)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _endpos = _endpos_c_ in
        let _v : 'tv_condition = let _endpos = _endpos_c_ in
        let _startpos = _startpos__1_ in
        
# 114 "parser.mly"
  ( Sif (e, s, [c]), {fp = _startpos; lp = _endpos} )
# 205 "parser.ml"
         in
        _menhir_goto_condition _menhir_env _menhir_stack _endpos _menhir_s _v) : 'freshtv802)) : 'freshtv804)
    | MenhirState166 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv807 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_condition) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv805 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
        let (_endpos_c_ : Lexing.position) = _endpos in
        let (_ : _menhir_state) = _menhir_s in
        let ((c : 'tv_condition) : 'tv_condition) = _v in
        ((let (((_menhir_stack, _menhir_s, _startpos__1_), _endpos_e_, _, (e : 'tv_expr), _startpos_e_), _, (s : 'tv_nonempty_list_stmt_)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_stmt = let _endpos = _endpos_c_ in
        let _startpos = _startpos__1_ in
        
# 101 "parser.mly"
  ( Sif (e, s, [c]), {fp = _startpos; lp = _endpos} )
# 227 "parser.ml"
         in
        _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv806)) : 'freshtv808)
    | _ ->
        _menhir_fail ()

and _menhir_run167 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv797 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        ((let _menhir_stack = (_menhir_stack, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv793 * _menhir_state * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv791 * _menhir_state * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
            let (_endpos__3_ : Lexing.position) = _endpos in
            ((let ((_menhir_stack, _menhir_s, _startpos__1_), _startpos__2_) = _menhir_stack in
            let _3 = () in
            let _2 = () in
            let _1 = () in
            let _endpos = _endpos__3_ in
            let _v : 'tv_condition = let _endpos = _endpos__3_ in
            let _startpos = _startpos__1_ in
            
# 110 "parser.mly"
  ( Sblock [], {fp = _startpos; lp = _endpos} )
# 265 "parser.ml"
             in
            _menhir_goto_condition _menhir_env _menhir_stack _endpos _menhir_s _v) : 'freshtv792)) : 'freshtv794)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv795 * _menhir_state * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv796)) : 'freshtv798)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv799 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv800)

and _menhir_run170 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CHAR _v ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState170 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState170 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState170 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState170 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState170 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState170 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState170 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState170 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState170 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState170 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState170 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState170

and _menhir_run174 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState174 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHAR _v ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState174 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState174 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState174 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FOR ->
        _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState174 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState174 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IF ->
        _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState174 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState174 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState174 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState174 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState174 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState174 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | RETURN ->
        _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState174 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState174 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState174 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | WHILE ->
        _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState174 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState174

and _menhir_reduce38 : _menhir_env -> ((('ttv_tail * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * Lexing.position) * _menhir_state * 'tv_separated_nonempty_list_COMMA_expr_) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let ((((_menhir_stack, _endpos_i_, _menhir_s, (i : 'tv_identifier), _startpos_i_), _startpos__2_), _, (e : 'tv_separated_nonempty_list_COMMA_expr_)), _endpos__4_) = _menhir_stack in
    let _4 = () in
    let _2 = () in
    let _startpos = _startpos_i_ in
    let _endpos = _endpos__4_ in
    let _v : 'tv_expr = let _endpos = _endpos__4_ in
    let _startpos = _startpos_i_ in
    
# 144 "parser.mly"
  ( Ecall (i, e), {fp = _startpos; lp = _endpos} )
# 371 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_goto_nonempty_list_stmt_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_nonempty_list_stmt_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState146 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv707 * _menhir_state * 'tv_stmt) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv705 * _menhir_state * 'tv_stmt) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (x : 'tv_stmt)), _, (xs : 'tv_nonempty_list_stmt_)) = _menhir_stack in
        let _v : 'tv_nonempty_list_stmt_ = 
# 198 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( x :: xs )
# 388 "parser.ml"
         in
        _menhir_goto_nonempty_list_stmt_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv706)) : 'freshtv708)
    | MenhirState145 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv719 * _menhir_state * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv715 * _menhir_state * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
            let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
            ((let _menhir_stack = (_menhir_stack, _startpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEMICOLON ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv711 * _menhir_state * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) = Obj.magic _menhir_stack in
                let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv709 * _menhir_state * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) = Obj.magic _menhir_stack in
                let (_endpos__4_ : Lexing.position) = _endpos in
                ((let (((_menhir_stack, _menhir_s, _startpos__1_), _, (s : 'tv_nonempty_list_stmt_)), _startpos__3_) = _menhir_stack in
                let _4 = () in
                let _3 = () in
                let _1 = () in
                let _v : 'tv_stmt = let _endpos = _endpos__4_ in
                let _startpos = _startpos__1_ in
                
# 99 "parser.mly"
  ( Sblock s, {fp = _startpos; lp = _endpos} )
# 422 "parser.ml"
                 in
                _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv710)) : 'freshtv712)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv713 * _menhir_state * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv714)) : 'freshtv716)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv717 * _menhir_state * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv718)) : 'freshtv720)
    | MenhirState144 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((('freshtv735 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) * 'tv_option_REVERSE_) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((('freshtv731 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) * 'tv_option_REVERSE_) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
            let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
            ((let _menhir_stack = (_menhir_stack, _startpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | LOOP ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((((((('freshtv727 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) * 'tv_option_REVERSE_) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | SEMICOLON ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (((((((((('freshtv723 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) * 'tv_option_REVERSE_) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position)) = Obj.magic _menhir_stack in
                    let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (((((((((('freshtv721 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) * 'tv_option_REVERSE_) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position)) = Obj.magic _menhir_stack in
                    let (_endpos__12_ : Lexing.position) = _endpos in
                    ((let (((((((_menhir_stack, _menhir_s, _startpos__1_), _endpos_i_, _, (i : 'tv_identifier), _startpos_i_), (r : 'tv_option_REVERSE_)), _endpos_e1_, _, (e1 : 'tv_expr), _startpos_e1_), _endpos_e2_, _, (e2 : 'tv_expr), _startpos_e2_), _, (s : 'tv_nonempty_list_stmt_)), _startpos__10_) = _menhir_stack in
                    let _12 = () in
                    let _11 = () in
                    let _10 = () in
                    let _8 = () in
                    let _6 = () in
                    let _3 = () in
                    let _1 = () in
                    let _v : 'tv_stmt = let _startpos = _startpos__1_ in
                    
# 103 "parser.mly"
  ( Sfor (i, (match r with Some _ -> true | _ -> false), e1, e2, s), {fp = _startpos; lp = _endpos_e2_} )
# 479 "parser.ml"
                     in
                    _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv722)) : 'freshtv724)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (((((((((('freshtv725 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) * 'tv_option_REVERSE_) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position)) = Obj.magic _menhir_stack in
                    ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv726)) : 'freshtv728)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((((((('freshtv729 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) * 'tv_option_REVERSE_) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv730)) : 'freshtv732)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((('freshtv733 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) * 'tv_option_REVERSE_) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv734)) : 'freshtv736)
    | MenhirState135 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv737 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ELSE ->
            _menhir_run174 _menhir_env (Obj.magic _menhir_stack) MenhirState166 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | ELSIF ->
            _menhir_run170 _menhir_env (Obj.magic _menhir_stack) MenhirState166 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | END ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState166 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState166) : 'freshtv738)
    | MenhirState172 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv739 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ELSE ->
            _menhir_run174 _menhir_env (Obj.magic _menhir_stack) MenhirState173 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | ELSIF ->
            _menhir_run170 _menhir_env (Obj.magic _menhir_stack) MenhirState173 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | END ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState173 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState173) : 'freshtv740)
    | MenhirState174 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv755 * _menhir_state * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv751 * _menhir_state * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
            let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
            ((let _menhir_stack = (_menhir_stack, _startpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | IF ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv747 * _menhir_state * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) = Obj.magic _menhir_stack in
                let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
                ((let _menhir_stack = (_menhir_stack, _startpos) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | SEMICOLON ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv743 * _menhir_state * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
                    let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv741 * _menhir_state * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
                    let (_endpos__5_ : Lexing.position) = _endpos in
                    ((let ((((_menhir_stack, _menhir_s, _startpos__1_), _, (s : 'tv_nonempty_list_stmt_)), _startpos__3_), _startpos__4_) = _menhir_stack in
                    let _5 = () in
                    let _4 = () in
                    let _3 = () in
                    let _1 = () in
                    let _endpos = _endpos__5_ in
                    let _v : 'tv_condition = let _endpos = _endpos__5_ in
                    let _startpos = _startpos__1_ in
                    
# 112 "parser.mly"
  ( Sblock s, {fp = _startpos; lp = _endpos} )
# 576 "parser.ml"
                     in
                    _menhir_goto_condition _menhir_env _menhir_stack _endpos _menhir_s _v) : 'freshtv742)) : 'freshtv744)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv745 * _menhir_state * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s, _), _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv746)) : 'freshtv748)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv749 * _menhir_state * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv750)) : 'freshtv752)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv753 * _menhir_state * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv754)) : 'freshtv756)
    | MenhirState128 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv771 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv767 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
            let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
            ((let _menhir_stack = (_menhir_stack, _startpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | LOOP ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((('freshtv763 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | SEMICOLON ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((((('freshtv759 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position)) = Obj.magic _menhir_stack in
                    let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((((('freshtv757 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position)) = Obj.magic _menhir_stack in
                    let (_endpos__7_ : Lexing.position) = _endpos in
                    ((let ((((_menhir_stack, _menhir_s, _startpos__1_), _endpos_e_, _, (e : 'tv_expr), _startpos_e_), _, (s : 'tv_nonempty_list_stmt_)), _startpos__5_) = _menhir_stack in
                    let _7 = () in
                    let _6 = () in
                    let _5 = () in
                    let _3 = () in
                    let _1 = () in
                    let _v : 'tv_stmt = let _endpos = _endpos__7_ in
                    let _startpos = _startpos__1_ in
                    
# 105 "parser.mly"
  ( Swhile (e, s), {fp = _startpos; lp = _endpos} )
# 639 "parser.ml"
                     in
                    _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv758)) : 'freshtv760)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((((('freshtv761 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position)) = Obj.magic _menhir_stack in
                    ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv762)) : 'freshtv764)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((('freshtv765 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv766)) : 'freshtv768)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv769 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv770)) : 'freshtv772)
    | MenhirState125 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((('freshtv777 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * _menhir_state * 'tv_option_params_) * Lexing.position) * _menhir_state * 'tv_stype)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((('freshtv773 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * _menhir_state * 'tv_option_params_) * Lexing.position) * _menhir_state * 'tv_stype)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
            let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
            ((let _menhir_stack = (_menhir_stack, _startpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | IDENT _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState186 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | SEMICOLON ->
                _menhir_reduce55 _menhir_env (Obj.magic _menhir_stack) MenhirState186
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState186) : 'freshtv774)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((('freshtv775 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * _menhir_state * 'tv_option_params_) * Lexing.position) * _menhir_state * 'tv_stype)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv776)) : 'freshtv778)
    | MenhirState193 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv783 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * _menhir_state * 'tv_option_params_)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv779 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * _menhir_state * 'tv_option_params_)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
            let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
            ((let _menhir_stack = (_menhir_stack, _startpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | IDENT _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState195 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | SEMICOLON ->
                _menhir_reduce55 _menhir_env (Obj.magic _menhir_stack) MenhirState195
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState195) : 'freshtv780)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv781 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * _menhir_state * 'tv_option_params_)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv782)) : 'freshtv784)
    | MenhirState199 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((((((('freshtv789)) * Lexing.position))) * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((((((((('freshtv785)) * Lexing.position))) * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
            let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
            ((let _menhir_stack = (_menhir_stack, _startpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | IDENT _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState201 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | SEMICOLON ->
                _menhir_reduce55 _menhir_env (Obj.magic _menhir_stack) MenhirState201
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState201) : 'freshtv786)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((((((((('freshtv787)) * Lexing.position))) * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv788)) : 'freshtv790)
    | _ ->
        _menhir_fail ()

and _menhir_reduce19 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * 'tv_access * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _endpos_a_, _menhir_s, (a : 'tv_access), _startpos_a_) = _menhir_stack in
    let _startpos = _startpos_a_ in
    let _endpos = _endpos_a_ in
    let _v : 'tv_expr = let _endpos = _endpos_a_ in
    let _startpos = _startpos_a_ in
    
# 130 "parser.mly"
  ( Eaccess a, {fp = _startpos; lp = _endpos} )
# 763 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_goto_option_expr_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_option_expr_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv703 * _menhir_state * Lexing.position) * _menhir_state * 'tv_option_expr_) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SEMICOLON ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv699 * _menhir_state * Lexing.position) * _menhir_state * 'tv_option_expr_) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv697 * _menhir_state * Lexing.position) * _menhir_state * 'tv_option_expr_) = Obj.magic _menhir_stack in
        let (_endpos__3_ : Lexing.position) = _endpos in
        ((let ((_menhir_stack, _menhir_s, _startpos__1_), _, (e : 'tv_option_expr_)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_stmt = let _endpos = _endpos__3_ in
        let _startpos = _startpos__1_ in
        
# 97 "parser.mly"
  ( Sreturn e, {fp = _startpos; lp = _endpos} )
# 791 "parser.ml"
         in
        _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv698)) : 'freshtv700)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv701 * _menhir_state * Lexing.position) * _menhir_state * 'tv_option_expr_) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv702)) : 'freshtv704)

and _menhir_run126 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CHAR _v ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState126 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState126 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState126 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState126 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState126 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState126 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState126 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState126 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState126 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState126 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState126 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState126

and _menhir_run129 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CHAR _v ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState129 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState129 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState129 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState129 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState129 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState129 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SEMICOLON ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv695) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState129 in
        ((let _v : 'tv_option_expr_ = 
# 101 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( None )
# 870 "parser.ml"
         in
        _menhir_goto_option_expr_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv696)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState129

and _menhir_run133 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CHAR _v ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState133 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState133 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState133 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState133

and _menhir_run136 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState136 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState136

and _menhir_run145 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState145 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHAR _v ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState145 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState145 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState145 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FOR ->
        _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState145 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState145 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IF ->
        _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState145 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState145 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState145 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState145 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState145 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState145 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | RETURN ->
        _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState145 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState145 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState145 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | WHILE ->
        _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState145 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState145

and _menhir_goto_separated_nonempty_list_COMMA_expr_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_separated_nonempty_list_COMMA_expr_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState77 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv677 * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * Lexing.position) * _menhir_state * 'tv_separated_nonempty_list_COMMA_expr_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RPAR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv673 * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * Lexing.position) * _menhir_state * 'tv_separated_nonempty_list_COMMA_expr_) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_stack = (_menhir_stack, _endpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            _menhir_reduce38 _menhir_env (Obj.magic _menhir_stack)) : 'freshtv674)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv675 * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * Lexing.position) * _menhir_state * 'tv_separated_nonempty_list_COMMA_expr_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv676)) : 'freshtv678)
    | MenhirState114 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv681 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_separated_nonempty_list_COMMA_expr_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv679 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_separated_nonempty_list_COMMA_expr_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _endpos_x_, _menhir_s, (x : 'tv_expr), _startpos_x_), _, (xs : 'tv_separated_nonempty_list_COMMA_expr_)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_separated_nonempty_list_COMMA_expr_ = 
# 218 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( x :: xs )
# 1001 "parser.ml"
         in
        _menhir_goto_separated_nonempty_list_COMMA_expr_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv680)) : 'freshtv682)
    | MenhirState150 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv693 * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * Lexing.position) * _menhir_state * 'tv_separated_nonempty_list_COMMA_expr_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RPAR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv689 * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * Lexing.position) * _menhir_state * 'tv_separated_nonempty_list_COMMA_expr_) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_stack = (_menhir_stack, _endpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEMICOLON ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv685 * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * Lexing.position) * _menhir_state * 'tv_separated_nonempty_list_COMMA_expr_) * Lexing.position) = Obj.magic _menhir_stack in
                let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv683 * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * Lexing.position) * _menhir_state * 'tv_separated_nonempty_list_COMMA_expr_) * Lexing.position) = Obj.magic _menhir_stack in
                let (_endpos__5_ : Lexing.position) = _endpos in
                ((let ((((_menhir_stack, _endpos_i_, _menhir_s, (i : 'tv_identifier), _startpos_i_), _startpos__2_), _, (e : 'tv_separated_nonempty_list_COMMA_expr_)), _endpos__4_) = _menhir_stack in
                let _5 = () in
                let _4 = () in
                let _2 = () in
                let _v : 'tv_stmt = let _endpos = _endpos__5_ in
                let _startpos = _startpos_i_ in
                
# 95 "parser.mly"
  ( Scall (i, e), {fp = _startpos; lp = _endpos} )
# 1035 "parser.ml"
                 in
                _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv684)) : 'freshtv686)
            | ADD | AND | DIV | DOT | EQ | GE | GT | LE | LT | MUL | NEQ | OR | REM | SUB ->
                _menhir_reduce38 _menhir_env (Obj.magic _menhir_stack)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv687 * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * Lexing.position) * _menhir_state * 'tv_separated_nonempty_list_COMMA_expr_) * Lexing.position) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv688)) : 'freshtv690)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv691 * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * Lexing.position) * _menhir_state * 'tv_separated_nonempty_list_COMMA_expr_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv692)) : 'freshtv694)
    | _ ->
        _menhir_fail ()

and _menhir_run81 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * 'tv_expr * Lexing.position -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _startpos ->
    let _menhir_stack = (_menhir_stack, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CHAR _v ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState81 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState81 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState81 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState81 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState81 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState81 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState81 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState81 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState81 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState81 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState81 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState81

and _menhir_run83 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * 'tv_expr * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CHAR _v ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState83 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState83 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState83 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState83 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState83 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState83 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState83 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState83 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState83 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState83 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState83 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState83

and _menhir_run92 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * 'tv_expr * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CHAR _v ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState92 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState92 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | ELSE ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv671 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState92 in
        let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CHAR _v ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState93 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | CHARVAL ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState93 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | FALSE ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState93 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | IDENT _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState93 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | INT _v ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState93 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LPAR ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState93 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | NEW ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState93 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | NOT ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState93 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | NULL ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState93 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | SUB ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState93 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TRUE ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState93 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState93) : 'freshtv672)
    | FALSE ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState92 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState92 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState92 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState92 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState92 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState92 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState92 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState92 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState92 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState92

and _menhir_run95 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * 'tv_expr * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CHAR _v ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState95 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState95 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState95 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState95 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState95 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState95 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState95 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState95 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState95 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState95 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState95 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState95

and _menhir_run88 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * 'tv_expr * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CHAR _v ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState88 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState88 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState88 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState88 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState88 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState88 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState88 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState88 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState88 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState88 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState88 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState88

and _menhir_run97 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * 'tv_expr * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CHAR _v ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState97 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState97 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState97 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState97 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState97 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState97 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState97 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState97 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState97 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState97 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState97 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState97

and _menhir_run101 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * 'tv_expr * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CHAR _v ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState101 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState101 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState101 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState101 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState101 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState101 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState101 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState101 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState101 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState101 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState101 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
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
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState103 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState103 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState103 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState103 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState103 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState103 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
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
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState105 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState105 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState105 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState105 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState105 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState105 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState105

and _menhir_run107 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * 'tv_expr * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CHAR _v ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState107 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState107 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState107 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState107 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState107 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState107 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState107 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState107 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState107 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState107 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState107 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState107

and _menhir_run85 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * 'tv_expr * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState85 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState85

and _menhir_run90 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * 'tv_expr * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CHAR _v ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState90 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState90 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState90 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState90 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState90 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState90 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState90

and _menhir_run109 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * 'tv_expr * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CHAR _v ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState109 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState109 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState109 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState109 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState109 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState109 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState109 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState109 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState109 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState109 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | THEN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv669 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState109 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CHAR _v ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState110 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | CHARVAL ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | FALSE ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState110 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | IDENT _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState110 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | INT _v ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState110 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LPAR ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | NEW ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | NOT ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | NULL ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState110 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | SUB ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TRUE ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState110 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState110) : 'freshtv670)
    | TRUE ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState109 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState109

and _menhir_run99 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * 'tv_expr * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CHAR _v ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState99 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState99 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState99 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState99 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState99 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState99 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState99 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState99 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState99 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState99 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState99 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState99

and _menhir_goto_option_params_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_option_params_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState36 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv661 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * _menhir_state * 'tv_option_params_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IS ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv657 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * _menhir_state * 'tv_option_params_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | FUNCTION ->
                _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState52 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState52 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | PROCEDURE ->
                _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState52 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TYPE ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState52 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | BEGIN ->
                _menhir_reduce43 _menhir_env (Obj.magic _menhir_stack) MenhirState52
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState52) : 'freshtv658)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv659 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * _menhir_state * 'tv_option_params_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv660)) : 'freshtv662)
    | MenhirState54 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv667 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * _menhir_state * 'tv_option_params_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RETURN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv663 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * _menhir_state * 'tv_option_params_) = Obj.magic _menhir_stack in
            let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
            ((let _menhir_stack = (_menhir_stack, _startpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ACCESS ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState56 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState56 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState56) : 'freshtv664)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv665 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * _menhir_state * 'tv_option_params_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv666)) : 'freshtv668)
    | _ ->
        _menhir_fail ()

and _menhir_goto_option_mode_ : _menhir_env -> 'ttv_tail -> 'tv_option_mode_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv655 * _menhir_state * 'tv_separated_nonempty_list_COMMA_identifier_ * Lexing.position)) * 'tv_option_mode_) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ACCESS ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState44 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState44) : 'freshtv656)

and _menhir_goto_mode : _menhir_env -> 'ttv_tail -> 'tv_mode -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv653) = Obj.magic _menhir_stack in
    let (_v : 'tv_mode) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv651) = Obj.magic _menhir_stack in
    let ((x : 'tv_mode) : 'tv_mode) = _v in
    ((let _v : 'tv_option_mode_ = 
# 103 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( Some x )
# 1652 "parser.ml"
     in
    _menhir_goto_option_mode_ _menhir_env _menhir_stack _v) : 'freshtv652)) : 'freshtv654)

and _menhir_run18 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState18 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState18

and _menhir_goto_separated_nonempty_list_SEMICOLON_param_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_separated_nonempty_list_SEMICOLON_param_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState37 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv645 * _menhir_state * Lexing.position) * _menhir_state * 'tv_separated_nonempty_list_SEMICOLON_param_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RPAR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv641 * _menhir_state * Lexing.position) * _menhir_state * 'tv_separated_nonempty_list_SEMICOLON_param_) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv639 * _menhir_state * Lexing.position) * _menhir_state * 'tv_separated_nonempty_list_SEMICOLON_param_) = Obj.magic _menhir_stack in
            let (_endpos__3_ : Lexing.position) = _endpos in
            ((let ((_menhir_stack, _menhir_s, _startpos__1_), _, (p : 'tv_separated_nonempty_list_SEMICOLON_param_)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_params = 
# 169 "parser.mly"
  ( List.fold_left ( @ ) [] p )
# 1693 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv637) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_params) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv635) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_params) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv633) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((x : 'tv_params) : 'tv_params) = _v in
            ((let _v : 'tv_option_params_ = 
# 103 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( Some x )
# 1710 "parser.ml"
             in
            _menhir_goto_option_params_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv634)) : 'freshtv636)) : 'freshtv638)) : 'freshtv640)) : 'freshtv642)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv643 * _menhir_state * Lexing.position) * _menhir_state * 'tv_separated_nonempty_list_SEMICOLON_param_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv644)) : 'freshtv646)
    | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv649 * _menhir_state * 'tv_param) * Lexing.position) * _menhir_state * 'tv_separated_nonempty_list_SEMICOLON_param_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv647 * _menhir_state * 'tv_param) * Lexing.position) * _menhir_state * 'tv_separated_nonempty_list_SEMICOLON_param_) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (x : 'tv_param)), _endpos__2_), _, (xs : 'tv_separated_nonempty_list_SEMICOLON_param_)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_separated_nonempty_list_SEMICOLON_param_ = 
# 218 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( x :: xs )
# 1730 "parser.ml"
         in
        _menhir_goto_separated_nonempty_list_SEMICOLON_param_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv648)) : 'freshtv650)
    | _ ->
        _menhir_fail ()

and _menhir_goto_nonempty_list_field_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_nonempty_list_field_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv627 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position))) * _menhir_state * 'tv_nonempty_list_field_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv623 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position))) * _menhir_state * 'tv_nonempty_list_field_) = Obj.magic _menhir_stack in
            let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
            ((let _menhir_stack = (_menhir_stack, _startpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | RECORD ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((('freshtv619 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position))) * _menhir_state * 'tv_nonempty_list_field_) * Lexing.position) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | SEMICOLON ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (((((('freshtv615 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position))) * _menhir_state * 'tv_nonempty_list_field_) * Lexing.position)) = Obj.magic _menhir_stack in
                    let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (((((('freshtv613 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position))) * _menhir_state * 'tv_nonempty_list_field_) * Lexing.position)) = Obj.magic _menhir_stack in
                    let (_endpos__8_ : Lexing.position) = _endpos in
                    ((let ((((_menhir_stack, _menhir_s, _startpos__1_), _endpos_i_, _, (i : 'tv_identifier), _startpos_i_), _, (f : 'tv_nonempty_list_field_)), _startpos__6_) = _menhir_stack in
                    let _8 = () in
                    let _7 = () in
                    let _6 = () in
                    let _4 = () in
                    let _3 = () in
                    let _1 = () in
                    let _v : 'tv_decl = let _endpos = _endpos__8_ in
                    let _startpos = _startpos__1_ in
                    
# 72 "parser.mly"
  ( Drecordtype (i, List.fold_left ( @ ) [] f), {fp = _startpos; lp = _endpos} )
# 1780 "parser.ml"
                     in
                    _menhir_goto_decl _menhir_env _menhir_stack _menhir_s _v) : 'freshtv614)) : 'freshtv616)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (((((('freshtv617 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position))) * _menhir_state * 'tv_nonempty_list_field_) * Lexing.position)) = Obj.magic _menhir_stack in
                    ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv618)) : 'freshtv620)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((('freshtv621 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position))) * _menhir_state * 'tv_nonempty_list_field_) * Lexing.position) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv622)) : 'freshtv624)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv625 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position))) * _menhir_state * 'tv_nonempty_list_field_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv626)) : 'freshtv628)
    | MenhirState30 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv631 * _menhir_state * 'tv_field) * _menhir_state * 'tv_nonempty_list_field_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv629 * _menhir_state * 'tv_field) * _menhir_state * 'tv_nonempty_list_field_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (x : 'tv_field)), _, (xs : 'tv_nonempty_list_field_)) = _menhir_stack in
        let _v : 'tv_nonempty_list_field_ = 
# 198 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( x :: xs )
# 1813 "parser.ml"
         in
        _menhir_goto_nonempty_list_field_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv630)) : 'freshtv632)
    | _ ->
        _menhir_fail ()

and _menhir_goto_list_decl_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_list_decl_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState58 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv595 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * _menhir_state * 'tv_option_params_) * Lexing.position) * _menhir_state * 'tv_stype)) * _menhir_state * 'tv_list_decl_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BEGIN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv591 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * _menhir_state * 'tv_option_params_) * Lexing.position) * _menhir_state * 'tv_stype)) * _menhir_state * 'tv_list_decl_) = Obj.magic _menhir_stack in
            let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
            ((let _menhir_stack = (_menhir_stack, _startpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BEGIN ->
                _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | CHAR _v ->
                _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState125 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | CHARVAL ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FALSE ->
                _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState125 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FOR ->
                _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState125 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IF ->
                _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INT _v ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState125 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LPAR ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NEW ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NOT ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NULL ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState125 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | RETURN ->
                _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | SUB ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TRUE ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState125 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | WHILE ->
                _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState125) : 'freshtv592)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv593 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * _menhir_state * 'tv_option_params_) * Lexing.position) * _menhir_state * 'tv_stype)) * _menhir_state * 'tv_list_decl_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv594)) : 'freshtv596)
    | MenhirState190 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv599 * _menhir_state * 'tv_decl) * _menhir_state * 'tv_list_decl_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv597 * _menhir_state * 'tv_decl) * _menhir_state * 'tv_list_decl_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (x : 'tv_decl)), _, (xs : 'tv_list_decl_)) = _menhir_stack in
        let _v : 'tv_list_decl_ = 
# 188 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( x :: xs )
# 1889 "parser.ml"
         in
        _menhir_goto_list_decl_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv598)) : 'freshtv600)
    | MenhirState52 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv605 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * _menhir_state * 'tv_option_params_)) * _menhir_state * 'tv_list_decl_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BEGIN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv601 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * _menhir_state * 'tv_option_params_)) * _menhir_state * 'tv_list_decl_) = Obj.magic _menhir_stack in
            let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
            ((let _menhir_stack = (_menhir_stack, _startpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BEGIN ->
                _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState193 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | CHAR _v ->
                _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState193 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | CHARVAL ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState193 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FALSE ->
                _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState193 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FOR ->
                _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState193 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState193 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IF ->
                _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState193 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INT _v ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState193 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LPAR ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState193 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NEW ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState193 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NOT ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState193 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NULL ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState193 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | RETURN ->
                _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState193 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | SUB ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState193 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TRUE ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState193 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | WHILE ->
                _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState193 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState193) : 'freshtv602)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv603 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * _menhir_state * 'tv_option_params_)) * _menhir_state * 'tv_list_decl_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv604)) : 'freshtv606)
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((((('freshtv611)) * Lexing.position))) * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) * _menhir_state * 'tv_list_decl_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BEGIN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((((((('freshtv607)) * Lexing.position))) * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) * _menhir_state * 'tv_list_decl_) = Obj.magic _menhir_stack in
            let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
            ((let _menhir_stack = (_menhir_stack, _startpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BEGIN ->
                _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState199 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | CHAR _v ->
                _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState199 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | CHARVAL ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState199 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FALSE ->
                _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState199 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FOR ->
                _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState199 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState199 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IF ->
                _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState199 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INT _v ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState199 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LPAR ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState199 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NEW ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState199 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NOT ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState199 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NULL ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState199 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | RETURN ->
                _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState199 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | SUB ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState199 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TRUE ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState199 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | WHILE ->
                _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState199 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState199) : 'freshtv608)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((((((('freshtv609)) * Lexing.position))) * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) * _menhir_state * 'tv_list_decl_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv610)) : 'freshtv612)
    | _ ->
        _menhir_fail ()

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_option_identifier_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_option_identifier_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState186 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((((('freshtv563 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * _menhir_state * 'tv_option_params_) * Lexing.position) * _menhir_state * 'tv_stype)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) * _menhir_state * 'tv_option_identifier_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((((('freshtv559 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * _menhir_state * 'tv_option_params_) * Lexing.position) * _menhir_state * 'tv_stype)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) * _menhir_state * 'tv_option_identifier_) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((((('freshtv557 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * _menhir_state * 'tv_option_params_) * Lexing.position) * _menhir_state * 'tv_stype)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) * _menhir_state * 'tv_option_identifier_) = Obj.magic _menhir_stack in
            let (_endpos__12_ : Lexing.position) = _endpos in
            ((let ((((((((((_menhir_stack, _menhir_s, _startpos__1_), _endpos_i1_, _, (i1 : 'tv_identifier), _startpos_i1_), _, (p : 'tv_option_params_)), _startpos__4_), _, (t : 'tv_stype)), _, (d : 'tv_list_decl_)), _startpos__8_), _, (s : 'tv_nonempty_list_stmt_)), _startpos__10_), _, (o2 : 'tv_option_identifier_)) = _menhir_stack in
            let _12 = () in
            let _10 = () in
            let _8 = () in
            let _6 = () in
            let _4 = () in
            let _1 = () in
            let _v : 'tv_decl = let _endpos = _endpos__12_ in
            let _startpos = _startpos__1_ in
            
# 83 "parser.mly"
  (
    check_same_identifiers i1 o2;
    Dfunction (i1, (match p with Some l -> l | None -> []), t, d, s), {fp = _startpos; lp = _endpos}
  )
# 2047 "parser.ml"
             in
            _menhir_goto_decl _menhir_env _menhir_stack _menhir_s _v) : 'freshtv558)) : 'freshtv560)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((((('freshtv561 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * _menhir_state * 'tv_option_params_) * Lexing.position) * _menhir_state * 'tv_stype)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) * _menhir_state * 'tv_option_identifier_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv562)) : 'freshtv564)
    | MenhirState195 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((('freshtv571 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * _menhir_state * 'tv_option_params_)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) * _menhir_state * 'tv_option_identifier_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((('freshtv567 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * _menhir_state * 'tv_option_params_)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) * _menhir_state * 'tv_option_identifier_) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((('freshtv565 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * _menhir_state * 'tv_option_params_)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) * _menhir_state * 'tv_option_identifier_) = Obj.magic _menhir_stack in
            let (_endpos__10_ : Lexing.position) = _endpos in
            ((let ((((((((_menhir_stack, _menhir_s, _startpos__1_), _endpos_i1_, _, (i1 : 'tv_identifier), _startpos_i1_), _, (p : 'tv_option_params_)), _, (d : 'tv_list_decl_)), _startpos__6_), _, (s : 'tv_nonempty_list_stmt_)), _startpos__8_), _, (o2 : 'tv_option_identifier_)) = _menhir_stack in
            let _10 = () in
            let _8 = () in
            let _6 = () in
            let _4 = () in
            let _1 = () in
            let _v : 'tv_decl = let _endpos = _endpos__10_ in
            let _startpos = _startpos__1_ in
            
# 78 "parser.mly"
  (
    check_same_identifiers i1 o2; 
    Dfunction (i1, (match p with Some l -> l | None -> []), (STunit, dummy_loc), d, s), {fp = _startpos; lp = _endpos}
  )
# 2085 "parser.ml"
             in
            _menhir_goto_decl _menhir_env _menhir_stack _menhir_s _v) : 'freshtv566)) : 'freshtv568)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((('freshtv569 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * _menhir_state * 'tv_option_params_)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) * _menhir_state * 'tv_option_identifier_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv570)) : 'freshtv572)
    | MenhirState201 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((((((((('freshtv589)) * Lexing.position))) * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) * _menhir_state * 'tv_option_identifier_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((((((((((('freshtv585)) * Lexing.position))) * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) * _menhir_state * 'tv_option_identifier_) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_stack = (_menhir_stack, _endpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | EOF ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((((((((((((('freshtv581)) * Lexing.position))) * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) * _menhir_state * 'tv_option_identifier_) * Lexing.position) = Obj.magic _menhir_stack in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((((((((((((('freshtv579)) * Lexing.position))) * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) * _menhir_state * 'tv_option_identifier_) * Lexing.position) = Obj.magic _menhir_stack in
                ((let ((((((((((_menhir_stack, _endpos__3_), _endpos__6_), _startpos__7_), _endpos_i1_, _, (i1 : 'tv_identifier), _startpos_i1_), _, (d : 'tv_list_decl_)), _startpos__11_), _, (s : 'tv_nonempty_list_stmt_)), _startpos__13_), _, (o2 : 'tv_option_identifier_)), _endpos__15_) = _menhir_stack in
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
# 50 "parser.mly"
      (Ast.file)
# 2130 "parser.ml"
                ) = 
# 60 "parser.mly"
  ( 
    check_same_identifiers i1 o2;
    { main_name = i1; glob_decl = d; stmts = s }
  )
# 2137 "parser.ml"
                 in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv577) = _menhir_stack in
                let (_v : (
# 50 "parser.mly"
      (Ast.file)
# 2144 "parser.ml"
                )) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv575) = Obj.magic _menhir_stack in
                let (_v : (
# 50 "parser.mly"
      (Ast.file)
# 2151 "parser.ml"
                )) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv573) = Obj.magic _menhir_stack in
                let ((_1 : (
# 50 "parser.mly"
      (Ast.file)
# 2158 "parser.ml"
                )) : (
# 50 "parser.mly"
      (Ast.file)
# 2162 "parser.ml"
                )) = _v in
                (Obj.magic _1 : 'freshtv574)) : 'freshtv576)) : 'freshtv578)) : 'freshtv580)) : 'freshtv582)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((((((((((((('freshtv583)) * Lexing.position))) * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) * _menhir_state * 'tv_option_identifier_) * Lexing.position) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv584)) : 'freshtv586)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((((((((((('freshtv587)) * Lexing.position))) * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) * _menhir_state * 'tv_option_identifier_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv588)) : 'freshtv590)
    | _ ->
        _menhir_fail ()

and _menhir_goto_stmt : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_stmt -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv555 * _menhir_state * 'tv_stmt) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState146 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHAR _v ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState146 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState146 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState146 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FOR ->
        _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState146 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState146 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IF ->
        _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState146 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState146 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState146 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState146 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState146 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState146 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | RETURN ->
        _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState146 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState146 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState146 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | WHILE ->
        _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState146 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | ELSE | ELSIF | END ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv553 * _menhir_state * 'tv_stmt) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (x : 'tv_stmt)) = _menhir_stack in
        let _v : 'tv_nonempty_list_stmt_ = 
# 196 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( [ x ] )
# 2229 "parser.ml"
         in
        _menhir_goto_nonempty_list_stmt_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv554)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState146) : 'freshtv556)

and _menhir_goto_option_REVERSE_ : _menhir_env -> 'ttv_tail -> 'tv_option_REVERSE_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((('freshtv551 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) * 'tv_option_REVERSE_) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CHAR _v ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState140 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState140 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState140 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState140 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState140 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState140 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState140 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState140 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState140 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState140 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState140 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState140) : 'freshtv552)

and _menhir_goto_access : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_access -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    match _menhir_s with
    | MenhirState126 | MenhirState133 | MenhirState170 | MenhirState140 | MenhirState142 | MenhirState156 | MenhirState150 | MenhirState129 | MenhirState63 | MenhirState65 | MenhirState67 | MenhirState70 | MenhirState74 | MenhirState77 | MenhirState114 | MenhirState92 | MenhirState93 | MenhirState109 | MenhirState110 | MenhirState107 | MenhirState95 | MenhirState105 | MenhirState103 | MenhirState101 | MenhirState97 | MenhirState99 | MenhirState81 | MenhirState90 | MenhirState88 | MenhirState83 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv543 * Lexing.position * _menhir_state * 'tv_access * Lexing.position) = Obj.magic _menhir_stack in
        (_menhir_reduce19 _menhir_env (Obj.magic _menhir_stack) : 'freshtv544)
    | MenhirState199 | MenhirState193 | MenhirState125 | MenhirState128 | MenhirState135 | MenhirState172 | MenhirState174 | MenhirState144 | MenhirState145 | MenhirState146 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv549 * Lexing.position * _menhir_state * 'tv_access * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COLONEQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv545 * Lexing.position * _menhir_state * 'tv_access * Lexing.position) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CHAR _v ->
                _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState156 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | CHARVAL ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState156 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FALSE ->
                _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState156 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState156 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INT _v ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState156 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LPAR ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState156 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NEW ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState156 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NOT ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState156 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NULL ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState156 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | SUB ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState156 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TRUE ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState156 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState156) : 'freshtv546)
        | ADD | AND | DIV | DOT | EQ | GE | GT | LE | LT | MUL | NEQ | OR | REM | SUB ->
            _menhir_reduce19 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv547 * Lexing.position * _menhir_state * 'tv_access * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv548)) : 'freshtv550)
    | _ ->
        _menhir_fail ()

and _menhir_reduce1 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _endpos_i_, _menhir_s, (i : 'tv_identifier), _startpos_i_) = _menhir_stack in
    let _startpos = _startpos_i_ in
    let _endpos = _endpos_i_ in
    let _v : 'tv_access = let _endpos = _endpos_i_ in
    let _startpos = _startpos_i_ in
    
# 194 "parser.mly"
  ( Aident i, {fp = _startpos; lp = _endpos} )
# 2340 "parser.ml"
     in
    _menhir_goto_access _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_run64 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv541) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _1 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_expr = let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    
# 122 "parser.mly"
  ( Ebool true, {fp = _startpos; lp = _endpos} )
# 2360 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv542)

and _menhir_run65 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CHAR _v ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState65 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState65 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState65 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState65 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState65 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState65 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState65 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState65 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState65 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState65 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState65 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState65

and _menhir_run66 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv539) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _1 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_expr = let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    
# 126 "parser.mly"
  ( Enull, {fp = _startpos; lp = _endpos} )
# 2413 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv540)

and _menhir_run67 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CHAR _v ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState67 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState67 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState67 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState67 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState67 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState67 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState67

and _menhir_run68 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState68 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState68

and _menhir_run70 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CHAR _v ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState70 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CHARVAL ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState70 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState70 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState70 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAR ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState70 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SUB ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState70 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState70

and _menhir_run71 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 31 "parser.mly"
       (int)
# 2499 "parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv537) = Obj.magic _menhir_stack in
    let (_endpos_n_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((n : (
# 31 "parser.mly"
       (int)
# 2510 "parser.ml"
    )) : (
# 31 "parser.mly"
       (int)
# 2514 "parser.ml"
    )) = _v in
    let (_startpos_n_ : Lexing.position) = _startpos in
    ((let _startpos = _startpos_n_ in
    let _endpos = _endpos_n_ in
    let _v : 'tv_expr = let _endpos = _endpos_n_ in
    let _startpos = _startpos_n_ in
    
# 118 "parser.mly"
  ( Eint n, {fp = _startpos; lp = _endpos} )
# 2524 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv538)

and _menhir_run72 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv535) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _1 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_expr = let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    
# 124 "parser.mly"
  ( Ebool false, {fp = _startpos; lp = _endpos} )
# 2544 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv536)

and _menhir_run73 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAR ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv531 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        ((let _menhir_stack = (_menhir_stack, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CHAR _v ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState74 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | CHARVAL ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | FALSE ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState74 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | IDENT _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState74 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | INT _v ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState74 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LPAR ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | NEW ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | NOT ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | NULL ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState74 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | SUB ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TRUE ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState74 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState74) : 'freshtv532)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv533 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv534)

and _menhir_run75 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 32 "parser.mly"
       (char)
# 2599 "parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv529) = Obj.magic _menhir_stack in
    let (_endpos_c_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((c : (
# 32 "parser.mly"
       (char)
# 2610 "parser.ml"
    )) : (
# 32 "parser.mly"
       (char)
# 2614 "parser.ml"
    )) = _v in
    let (_startpos_c_ : Lexing.position) = _startpos in
    ((let _startpos = _startpos_c_ in
    let _endpos = _endpos_c_ in
    let _v : 'tv_expr = let _endpos = _endpos_c_ in
    let _startpos = _startpos_c_ in
    
# 120 "parser.mly"
  ( Echar c, {fp = _startpos; lp = _endpos} )
# 2624 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv530)

and _menhir_goto_expr : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_expr -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    match _menhir_s with
    | MenhirState150 | MenhirState114 | MenhirState77 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv353 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | AND ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack)
        | COMMA ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv347 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CHAR _v ->
                _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState114 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | CHARVAL ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState114 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FALSE ->
                _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState114 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState114 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INT _v ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState114 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LPAR ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState114 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NEW ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState114 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NOT ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState114 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NULL ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState114 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | SUB ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState114 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TRUE ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState114 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState114) : 'freshtv348)
        | DIV ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | RPAR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv349 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _endpos_x_, _menhir_s, (x : 'tv_expr), _startpos_x_) = _menhir_stack in
            let _v : 'tv_separated_nonempty_list_COMMA_expr_ = 
# 216 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( [ x ] )
# 2705 "parser.ml"
             in
            _menhir_goto_separated_nonempty_list_COMMA_expr_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv350)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv351 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv352)) : 'freshtv354)
    | MenhirState81 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv359 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIV ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | ADD | AND | COMMA | DOUBLEDOT | EQ | GE | GT | LE | LOOP | LT | NEQ | OR | RPAR | SEMICOLON | SUB | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv355 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : 'tv_expr), _startpos_e1_), _startpos__10_), _endpos_e2_, _, (e2 : 'tv_expr), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 156 "parser.mly"
            ( Bsub )
# 2741 "parser.ml"
              
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
            
# 136 "parser.mly"
  ( Ebinop (e1, o, e2), {fp = _startpos; lp = _endpos} )
# 2749 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv356)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv357 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv358)) : 'freshtv360)
    | MenhirState83 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv365 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | ADD | AND | COMMA | DIV | DOUBLEDOT | EQ | GE | GT | LE | LOOP | LT | MUL | NEQ | OR | REM | RPAR | SEMICOLON | SUB | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv361 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : 'tv_expr), _startpos_e1_), _endpos_e2_, _, (e2 : 'tv_expr), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 159 "parser.mly"
            ( Brem )
# 2779 "parser.ml"
              
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
            
# 136 "parser.mly"
  ( Ebinop (e1, o, e2), {fp = _startpos; lp = _endpos} )
# 2787 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv362)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv363 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv364)) : 'freshtv366)
    | MenhirState88 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv371 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | ADD | AND | COMMA | DIV | DOUBLEDOT | EQ | GE | GT | LE | LOOP | LT | MUL | NEQ | OR | REM | RPAR | SEMICOLON | SUB | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv367 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : 'tv_expr), _startpos_e1_), _endpos_e2_, _, (e2 : 'tv_expr), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 157 "parser.mly"
            ( Bmul )
# 2817 "parser.ml"
              
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
            
# 136 "parser.mly"
  ( Ebinop (e1, o, e2), {fp = _startpos; lp = _endpos} )
# 2825 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv368)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv369 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv370)) : 'freshtv372)
    | MenhirState90 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv377 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | ADD | AND | COMMA | DIV | DOUBLEDOT | EQ | GE | GT | LE | LOOP | LT | MUL | NEQ | OR | REM | RPAR | SEMICOLON | SUB | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv373 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : 'tv_expr), _startpos_e1_), _endpos_e2_, _, (e2 : 'tv_expr), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 158 "parser.mly"
            ( Bdiv )
# 2855 "parser.ml"
              
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
            
# 136 "parser.mly"
  ( Ebinop (e1, o, e2), {fp = _startpos; lp = _endpos} )
# 2863 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv374)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv375 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv376)) : 'freshtv378)
    | MenhirState93 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv383 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | AND ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | COMMA | DOUBLEDOT | LOOP | OR | RPAR | SEMICOLON | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv379 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : 'tv_expr), _startpos_e1_), _, _startpos__3_), _endpos_e2_, _, (e2 : 'tv_expr), _startpos_e2_) = _menhir_stack in
            let _3 = () in
            let _2 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : 'tv_expr = let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
            
# 134 "parser.mly"
  ( Ebinop (e1, Borelse, e2), {fp = _startpos; lp = _endpos} )
# 2918 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv380)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv381 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv382)) : 'freshtv384)
    | MenhirState95 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv389 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | AND | COMMA | DOUBLEDOT | LOOP | OR | RPAR | SEMICOLON | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv385 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : 'tv_expr), _startpos_e1_), _endpos_e2_, _, (e2 : 'tv_expr), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 150 "parser.mly"
            ( Bneq )
# 2966 "parser.ml"
              
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
            
# 136 "parser.mly"
  ( Ebinop (e1, o, e2), {fp = _startpos; lp = _endpos} )
# 2974 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv386)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv387 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv388)) : 'freshtv390)
    | MenhirState97 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv395 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | AND | COMMA | DOUBLEDOT | EQ | LOOP | NEQ | OR | RPAR | SEMICOLON | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv391 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : 'tv_expr), _startpos_e1_), _endpos_e2_, _, (e2 : 'tv_expr), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 151 "parser.mly"
            ( Blt )
# 3014 "parser.ml"
              
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
            
# 136 "parser.mly"
  ( Ebinop (e1, o, e2), {fp = _startpos; lp = _endpos} )
# 3022 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv392)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv393 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv394)) : 'freshtv396)
    | MenhirState99 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv401 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIV ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | ADD | AND | COMMA | DOUBLEDOT | EQ | GE | GT | LE | LOOP | LT | NEQ | OR | RPAR | SEMICOLON | SUB | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv397 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : 'tv_expr), _startpos_e1_), _endpos_e2_, _, (e2 : 'tv_expr), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 155 "parser.mly"
            ( Badd )
# 3058 "parser.ml"
              
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
            
# 136 "parser.mly"
  ( Ebinop (e1, o, e2), {fp = _startpos; lp = _endpos} )
# 3066 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv398)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv399 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv400)) : 'freshtv402)
    | MenhirState101 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv407 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | AND | COMMA | DOUBLEDOT | EQ | LOOP | NEQ | OR | RPAR | SEMICOLON | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv403 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : 'tv_expr), _startpos_e1_), _endpos_e2_, _, (e2 : 'tv_expr), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 152 "parser.mly"
            ( Ble )
# 3106 "parser.ml"
              
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
            
# 136 "parser.mly"
  ( Ebinop (e1, o, e2), {fp = _startpos; lp = _endpos} )
# 3114 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv404)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv405 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv406)) : 'freshtv408)
    | MenhirState103 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv413 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | AND | COMMA | DOUBLEDOT | EQ | LOOP | NEQ | OR | RPAR | SEMICOLON | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv409 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : 'tv_expr), _startpos_e1_), _endpos_e2_, _, (e2 : 'tv_expr), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 153 "parser.mly"
            ( Bgt )
# 3154 "parser.ml"
              
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
            
# 136 "parser.mly"
  ( Ebinop (e1, o, e2), {fp = _startpos; lp = _endpos} )
# 3162 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv410)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv411 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv412)) : 'freshtv414)
    | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv419 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | AND | COMMA | DOUBLEDOT | EQ | LOOP | NEQ | OR | RPAR | SEMICOLON | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv415 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : 'tv_expr), _startpos_e1_), _endpos_e2_, _, (e2 : 'tv_expr), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 154 "parser.mly"
            ( Bge )
# 3202 "parser.ml"
              
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
            
# 136 "parser.mly"
  ( Ebinop (e1, o, e2), {fp = _startpos; lp = _endpos} )
# 3210 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv416)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv417 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv418)) : 'freshtv420)
    | MenhirState107 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv425 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | AND | COMMA | DOUBLEDOT | LOOP | OR | RPAR | SEMICOLON | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv421 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : 'tv_expr), _startpos_e1_), _endpos_e2_, _, (e2 : 'tv_expr), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 149 "parser.mly"
            ( Beq )
# 3258 "parser.ml"
              
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
            
# 136 "parser.mly"
  ( Ebinop (e1, o, e2), {fp = _startpos; lp = _endpos} )
# 3266 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv422)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv423 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv424)) : 'freshtv426)
    | MenhirState110 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv431 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | AND | COMMA | DOUBLEDOT | LOOP | OR | RPAR | SEMICOLON | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv427 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : 'tv_expr), _startpos_e1_), _), _endpos_e2_, _, (e2 : 'tv_expr), _startpos_e2_) = _menhir_stack in
            let _3 = () in
            let _2 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : 'tv_expr = let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
            
# 132 "parser.mly"
  ( Ebinop (e1, Bandthen, e2), {fp = _startpos; lp = _endpos} )
# 3319 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv428)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv429 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv430)) : 'freshtv432)
    | MenhirState109 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv437 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | AND | COMMA | DOUBLEDOT | LOOP | OR | RPAR | SEMICOLON | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv433 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : 'tv_expr), _startpos_e1_), _endpos_e2_, _, (e2 : 'tv_expr), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 160 "parser.mly"
            ( Band )
# 3371 "parser.ml"
              
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
            
# 136 "parser.mly"
  ( Ebinop (e1, o, e2), {fp = _startpos; lp = _endpos} )
# 3379 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv434)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv435 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv436)) : 'freshtv438)
    | MenhirState92 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv443 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | AND ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | COMMA | DOUBLEDOT | LOOP | OR | RPAR | SEMICOLON | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv439 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : 'tv_expr), _startpos_e1_), _endpos_e2_, _, (e2 : 'tv_expr), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 161 "parser.mly"
            ( Bor )
# 3433 "parser.ml"
              
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
            
# 136 "parser.mly"
  ( Ebinop (e1, o, e2), {fp = _startpos; lp = _endpos} )
# 3441 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv440)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv441 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv442)) : 'freshtv444)
    | MenhirState74 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv451 * _menhir_state * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | AND ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | RPAR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv447 * _menhir_state * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv445 * _menhir_state * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            let (_endpos__4_ : Lexing.position) = _endpos in
            ((let (((_menhir_stack, _menhir_s, _startpos__1_), _startpos__2_), _endpos_e_, _, (e : 'tv_expr), _startpos_e_) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos__4_ in
            let _v : 'tv_expr = let _endpos = _endpos__4_ in
            let _startpos = _startpos__1_ in
            
# 146 "parser.mly"
  ( Echarval e, {fp = _startpos; lp = _endpos} )
# 3502 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv446)) : 'freshtv448)
        | SUB ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv449 * _menhir_state * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv450)) : 'freshtv452)
    | MenhirState70 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv459 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | AND ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | RPAR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv455 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv453 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            let (_endpos__3_ : Lexing.position) = _endpos in
            ((let ((_menhir_stack, _menhir_s, _startpos__1_), _endpos_e_, _, (e : 'tv_expr), _startpos_e_) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos__3_ in
            let _v : 'tv_expr = let _endpos = _endpos__3_ in
            let _startpos = _startpos__1_ in
            
# 128 "parser.mly"
  ( fst e, {fp = _startpos; lp = _endpos} )
# 3564 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv454)) : 'freshtv456)
        | SUB ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv457 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv458)) : 'freshtv460)
    | MenhirState67 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv465 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | AND | COMMA | DOUBLEDOT | LOOP | OR | RPAR | SEMICOLON | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv461 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _startpos__1_), _endpos_e_, _, (e : 'tv_expr), _startpos_e_) = _menhir_stack in
            let _1 = () in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos_e_ in
            let _v : 'tv_expr = let _endpos = _endpos_e_ in
            let _startpos = _startpos__1_ in
            
# 138 "parser.mly"
  ( Eneg e, {fp = _startpos; lp = _endpos} )
# 3618 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv462)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv463 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv464)) : 'freshtv466)
    | MenhirState65 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv471 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | ADD | AND | COMMA | DIV | DOUBLEDOT | EQ | GE | GT | LE | LOOP | LT | MUL | NEQ | OR | REM | RPAR | SEMICOLON | SUB | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv467 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _startpos__1_), _endpos_e_, _, (e : 'tv_expr), _startpos_e_) = _menhir_stack in
            let _1 = () in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos_e_ in
            let _v : 'tv_expr = let _endpos = _endpos_e_ in
            let _startpos = _startpos__1_ in
            
# 140 "parser.mly"
  ( Ebinop ((Eint 0, dummy_loc), Bsub, e), {fp = _startpos; lp = _endpos} )
# 3648 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv468)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv469 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv470)) : 'freshtv472)
    | MenhirState63 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv479 * _menhir_state * 'tv_separated_nonempty_list_COMMA_identifier_ * Lexing.position)) * _menhir_state * 'tv_stype)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | AND ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv475 * _menhir_state * 'tv_separated_nonempty_list_COMMA_identifier_ * Lexing.position)) * _menhir_state * 'tv_stype)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv473 * _menhir_state * 'tv_separated_nonempty_list_COMMA_identifier_ * Lexing.position)) * _menhir_state * 'tv_stype)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            let (_endpos__6_ : Lexing.position) = _endpos in
            ((let (((_menhir_stack, _menhir_s, (i : 'tv_separated_nonempty_list_COMMA_identifier_), _startpos_i_), _, (t : 'tv_stype)), _endpos_e_, _, (e : 'tv_expr), _startpos_e_) = _menhir_stack in
            let _6 = () in
            let _4 = () in
            let _2 = () in
            let _v : 'tv_decl = let _endpos = _endpos__6_ in
            let _startpos = _startpos_i_ in
            
# 76 "parser.mly"
  ( Dident (i, t, Some e), {fp = _startpos; lp = _endpos} )
# 3707 "parser.ml"
             in
            _menhir_goto_decl _menhir_env _menhir_stack _menhir_s _v) : 'freshtv474)) : 'freshtv476)
        | SUB ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv477 * _menhir_state * 'tv_separated_nonempty_list_COMMA_identifier_ * Lexing.position)) * _menhir_state * 'tv_stype)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv478)) : 'freshtv480)
    | MenhirState126 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv485 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | AND ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack)
        | LOOP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv481 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BEGIN ->
                _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState128 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | CHAR _v ->
                _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState128 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | CHARVAL ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState128 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FALSE ->
                _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState128 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FOR ->
                _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState128 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState128 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IF ->
                _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState128 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INT _v ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState128 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LPAR ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState128 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NEW ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState128 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NOT ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState128 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NULL ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState128 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | RETURN ->
                _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState128 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | SUB ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState128 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TRUE ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState128 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | WHILE ->
                _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState128 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState128) : 'freshtv482)
        | LT ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv483 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv484)) : 'freshtv486)
    | MenhirState129 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv491 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | AND ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv487 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _endpos_x_, _menhir_s, (x : 'tv_expr), _startpos_x_) = _menhir_stack in
            let _v : 'tv_option_expr_ = 
# 103 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( Some x )
# 3843 "parser.ml"
             in
            _menhir_goto_option_expr_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv488)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv489 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv490)) : 'freshtv492)
    | MenhirState133 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv497 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | AND ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv493 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BEGIN ->
                _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState135 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | CHAR _v ->
                _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState135 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | CHARVAL ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState135 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FALSE ->
                _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState135 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FOR ->
                _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState135 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState135 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IF ->
                _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState135 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INT _v ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState135 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LPAR ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState135 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NEW ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState135 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NOT ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState135 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NULL ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState135 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | RETURN ->
                _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState135 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | SUB ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState135 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TRUE ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState135 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | WHILE ->
                _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState135 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState135) : 'freshtv494)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv495 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv496)) : 'freshtv498)
    | MenhirState140 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv503 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) * 'tv_option_REVERSE_) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | AND ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLEDOT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv499 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) * 'tv_option_REVERSE_) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CHAR _v ->
                _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState142 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | CHARVAL ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState142 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FALSE ->
                _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState142 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState142 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INT _v ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState142 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LPAR ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState142 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NEW ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState142 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NOT ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState142 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NULL ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState142 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | SUB ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState142 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TRUE ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState142 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState142) : 'freshtv500)
        | EQ ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv501 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) * 'tv_option_REVERSE_) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv502)) : 'freshtv504)
    | MenhirState142 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv509 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) * 'tv_option_REVERSE_) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | AND ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack)
        | LOOP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv505 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) * 'tv_option_REVERSE_) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BEGIN ->
                _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState144 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | CHAR _v ->
                _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState144 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | CHARVAL ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState144 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FALSE ->
                _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState144 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FOR ->
                _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState144 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState144 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IF ->
                _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState144 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INT _v ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState144 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LPAR ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState144 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NEW ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState144 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NOT ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState144 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NULL ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState144 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | RETURN ->
                _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState144 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | SUB ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState144 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TRUE ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState144 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | WHILE ->
                _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState144 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState144) : 'freshtv506)
        | LT ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv507 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) * 'tv_option_REVERSE_) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv508)) : 'freshtv510)
    | MenhirState199 | MenhirState193 | MenhirState125 | MenhirState128 | MenhirState135 | MenhirState172 | MenhirState174 | MenhirState144 | MenhirState145 | MenhirState146 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv513 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | AND ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv511 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv512)) : 'freshtv514)
    | MenhirState156 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv521 * Lexing.position * _menhir_state * 'tv_access * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | AND ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv517 * Lexing.position * _menhir_state * 'tv_access * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv515 * Lexing.position * _menhir_state * 'tv_access * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            let (_endpos__4_ : Lexing.position) = _endpos in
            ((let ((_menhir_stack, _endpos_a_, _menhir_s, (a : 'tv_access), _startpos_a_), _endpos_e_, _, (e : 'tv_expr), _startpos_e_) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _v : 'tv_stmt = let _endpos = _endpos__4_ in
            let _startpos = _startpos_a_ in
            
# 91 "parser.mly"
  ( Saccess (a, e), {fp = _startpos; lp = _endpos} )
# 4181 "parser.ml"
             in
            _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv516)) : 'freshtv518)
        | SUB ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv519 * Lexing.position * _menhir_state * 'tv_access * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv520)) : 'freshtv522)
    | MenhirState170 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv527 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ADD ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | AND ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack)
        | REM ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv523 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BEGIN ->
                _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState172 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | CHAR _v ->
                _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState172 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | CHARVAL ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState172 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FALSE ->
                _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState172 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FOR ->
                _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState172 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState172 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IF ->
                _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState172 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INT _v ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState172 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LPAR ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState172 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NEW ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState172 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NOT ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState172 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NULL ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState172 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | RETURN ->
                _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState172 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | SUB ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState172 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TRUE ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState172 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | WHILE ->
                _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState172 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState172) : 'freshtv524)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv525 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv526)) : 'freshtv528)
    | _ ->
        _menhir_fail ()

and _menhir_reduce59 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_option_params_ = 
# 101 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( None )
# 4284 "parser.ml"
     in
    _menhir_goto_option_params_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run37 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState37 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState37

and _menhir_goto_separated_nonempty_list_COMMA_identifier_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_separated_nonempty_list_COMMA_identifier_ -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v, _startpos) in
    match _menhir_s with
    | MenhirState30 | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv315 * _menhir_state * 'tv_separated_nonempty_list_COMMA_identifier_ * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv311 * _menhir_state * 'tv_separated_nonempty_list_COMMA_identifier_ * Lexing.position) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ACCESS ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState17 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState17) : 'freshtv312)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv313 * _menhir_state * 'tv_separated_nonempty_list_COMMA_identifier_ * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv314)) : 'freshtv316)
    | MenhirState28 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv319 * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) * _menhir_state * 'tv_separated_nonempty_list_COMMA_identifier_ * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv317 * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) * _menhir_state * 'tv_separated_nonempty_list_COMMA_identifier_ * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _endpos_x_, _menhir_s, (x : 'tv_identifier), _startpos_x_), _, (xs : 'tv_separated_nonempty_list_COMMA_identifier_), _startpos_xs_) = _menhir_stack in
        let _2 = () in
        let _startpos = _startpos_x_ in
        let _v : 'tv_separated_nonempty_list_COMMA_identifier_ = 
# 218 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( x :: xs )
# 4343 "parser.ml"
         in
        _menhir_goto_separated_nonempty_list_COMMA_identifier_ _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv318)) : 'freshtv320)
    | MenhirState48 | MenhirState37 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv339 * _menhir_state * 'tv_separated_nonempty_list_COMMA_identifier_ * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv335 * _menhir_state * 'tv_separated_nonempty_list_COMMA_identifier_ * Lexing.position) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | IN ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv329) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | OUT ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv323) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv321) = Obj.magic _menhir_stack in
                    ((let _2 = () in
                    let _1 = () in
                    let _v : 'tv_mode = 
# 182 "parser.mly"
  ( Minout )
# 4375 "parser.ml"
                     in
                    _menhir_goto_mode _menhir_env _menhir_stack _v) : 'freshtv322)) : 'freshtv324)
                | ACCESS | IDENT _ ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv325) = Obj.magic _menhir_stack in
                    ((let _1 = () in
                    let _v : 'tv_mode = 
# 184 "parser.mly"
  ( Min )
# 4385 "parser.ml"
                     in
                    _menhir_goto_mode _menhir_env _menhir_stack _v) : 'freshtv326)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv327) = Obj.magic _menhir_stack in
                    (raise _eRR : 'freshtv328)) : 'freshtv330)
            | ACCESS | IDENT _ ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv331) = Obj.magic _menhir_stack in
                ((let _v : 'tv_option_mode_ = 
# 101 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( None )
# 4400 "parser.ml"
                 in
                _menhir_goto_option_mode_ _menhir_env _menhir_stack _v) : 'freshtv332)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv333 * _menhir_state * 'tv_separated_nonempty_list_COMMA_identifier_ * Lexing.position)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv334)) : 'freshtv336)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv337 * _menhir_state * 'tv_separated_nonempty_list_COMMA_identifier_ * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv338)) : 'freshtv340)
    | MenhirState10 | MenhirState52 | MenhirState190 | MenhirState58 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv345 * _menhir_state * 'tv_separated_nonempty_list_COMMA_identifier_ * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv341 * _menhir_state * 'tv_separated_nonempty_list_COMMA_identifier_ * Lexing.position) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ACCESS ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState60 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState60) : 'freshtv342)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv343 * _menhir_state * 'tv_separated_nonempty_list_COMMA_identifier_ * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv344)) : 'freshtv346)
    | _ ->
        _menhir_fail ()

and _menhir_goto_stype : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_stype -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv279 * _menhir_state * 'tv_separated_nonempty_list_COMMA_identifier_ * Lexing.position)) * _menhir_state * 'tv_stype) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv275 * _menhir_state * 'tv_separated_nonempty_list_COMMA_identifier_ * Lexing.position)) * _menhir_state * 'tv_stype) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv273 * _menhir_state * 'tv_separated_nonempty_list_COMMA_identifier_ * Lexing.position)) * _menhir_state * 'tv_stype) = Obj.magic _menhir_stack in
            let (_endpos__4_ : Lexing.position) = _endpos in
            ((let ((_menhir_stack, _menhir_s, (i : 'tv_separated_nonempty_list_COMMA_identifier_), _startpos_i_), _, (t : 'tv_stype)) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _v : 'tv_field = 
# 165 "parser.mly"
  ( List.map (fun x -> (x, t)) i )
# 4471 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv271) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_field) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv269 * _menhir_state * 'tv_field) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | IDENT _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState30 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | END ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv267 * _menhir_state * 'tv_field) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, (x : 'tv_field)) = _menhir_stack in
                let _v : 'tv_nonempty_list_field_ = 
# 196 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( [ x ] )
# 4492 "parser.ml"
                 in
                _menhir_goto_nonempty_list_field_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv268)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState30) : 'freshtv270)) : 'freshtv272)) : 'freshtv274)) : 'freshtv276)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv277 * _menhir_state * 'tv_separated_nonempty_list_COMMA_identifier_ * Lexing.position)) * _menhir_state * 'tv_stype) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv278)) : 'freshtv280)
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv293 * _menhir_state * 'tv_separated_nonempty_list_COMMA_identifier_ * Lexing.position)) * 'tv_option_mode_) * _menhir_state * 'tv_stype) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv291 * _menhir_state * 'tv_separated_nonempty_list_COMMA_identifier_ * Lexing.position)) * 'tv_option_mode_) * _menhir_state * 'tv_stype) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (i : 'tv_separated_nonempty_list_COMMA_identifier_), _startpos_i_), (m : 'tv_option_mode_)), _, (t : 'tv_stype)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_param = 
# 173 "parser.mly"
  ( List.map (fun x -> (x, (match m with Some l -> l | None -> Min), t)) i )
# 4516 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv289) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_param) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv287 * _menhir_state * 'tv_param) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv281 * _menhir_state * 'tv_param) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_stack = (_menhir_stack, _endpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | IDENT _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState48 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState48) : 'freshtv282)
        | RPAR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv283 * _menhir_state * 'tv_param) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (x : 'tv_param)) = _menhir_stack in
            let _v : 'tv_separated_nonempty_list_SEMICOLON_param_ = 
# 216 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( [ x ] )
# 4549 "parser.ml"
             in
            _menhir_goto_separated_nonempty_list_SEMICOLON_param_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv284)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv285 * _menhir_state * 'tv_param) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv286)) : 'freshtv288)) : 'freshtv290)) : 'freshtv292)) : 'freshtv294)
    | MenhirState56 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv299 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * _menhir_state * 'tv_option_params_) * Lexing.position) * _menhir_state * 'tv_stype) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IS ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv295 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * _menhir_state * 'tv_option_params_) * Lexing.position) * _menhir_state * 'tv_stype) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | FUNCTION ->
                _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState58 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | PROCEDURE ->
                _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TYPE ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | BEGIN ->
                _menhir_reduce43 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState58) : 'freshtv296)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv297 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * _menhir_state * 'tv_option_params_) * Lexing.position) * _menhir_state * 'tv_stype) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv298)) : 'freshtv300)
    | MenhirState60 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv309 * _menhir_state * 'tv_separated_nonempty_list_COMMA_identifier_ * Lexing.position)) * _menhir_state * 'tv_stype) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COLONEQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv301 * _menhir_state * 'tv_separated_nonempty_list_COMMA_identifier_ * Lexing.position)) * _menhir_state * 'tv_stype) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CHAR _v ->
                _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState63 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | CHARVAL ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FALSE ->
                _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState63 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState63 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INT _v ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState63 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LPAR ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NEW ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NOT ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NULL ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState63 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | SUB ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TRUE ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState63 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState63) : 'freshtv302)
        | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv305 * _menhir_state * 'tv_separated_nonempty_list_COMMA_identifier_ * Lexing.position)) * _menhir_state * 'tv_stype) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv303 * _menhir_state * 'tv_separated_nonempty_list_COMMA_identifier_ * Lexing.position)) * _menhir_state * 'tv_stype) = Obj.magic _menhir_stack in
            let (_endpos__4_ : Lexing.position) = _endpos in
            ((let ((_menhir_stack, _menhir_s, (i : 'tv_separated_nonempty_list_COMMA_identifier_), _startpos_i_), _, (t : 'tv_stype)) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _v : 'tv_decl = let _endpos = _endpos__4_ in
            let _startpos = _startpos_i_ in
            
# 74 "parser.mly"
  ( Dident (i, t, None), {fp = _startpos; lp = _endpos} )
# 4646 "parser.ml"
             in
            _menhir_goto_decl _menhir_env _menhir_stack _menhir_s _v) : 'freshtv304)) : 'freshtv306)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv307 * _menhir_state * 'tv_separated_nonempty_list_COMMA_identifier_ * Lexing.position)) * _menhir_state * 'tv_stype) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv308)) : 'freshtv310)
    | _ ->
        _menhir_fail ()

and _menhir_goto_decl : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_decl -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv265 * _menhir_state * 'tv_decl) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FUNCTION ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState190 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState190 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PROCEDURE ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState190 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TYPE ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState190 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | BEGIN ->
        _menhir_reduce43 _menhir_env (Obj.magic _menhir_stack) MenhirState190
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState190) : 'freshtv266)

and _menhir_reduce43 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_list_decl_ = 
# 186 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( [] )
# 4687 "parser.ml"
     in
    _menhir_goto_list_decl_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run11 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState11 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState11

and _menhir_run35 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState35 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState35

and _menhir_run53 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState53 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState53

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState201 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((((((('freshtv127)) * Lexing.position))) * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv128)
    | MenhirState199 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((((('freshtv129)) * Lexing.position))) * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) * _menhir_state * 'tv_list_decl_) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv130)
    | MenhirState195 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv131 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * _menhir_state * 'tv_option_params_)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv132)
    | MenhirState193 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv133 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * _menhir_state * 'tv_option_params_)) * _menhir_state * 'tv_list_decl_) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv134)
    | MenhirState190 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv135 * _menhir_state * 'tv_decl) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv136)
    | MenhirState186 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((((('freshtv137 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * _menhir_state * 'tv_option_params_) * Lexing.position) * _menhir_state * 'tv_stype)) * _menhir_state * 'tv_list_decl_) * Lexing.position) * _menhir_state * 'tv_nonempty_list_stmt_) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv138)
    | MenhirState174 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv139 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv140)
    | MenhirState173 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv141 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv142)
    | MenhirState172 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv143 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv144)
    | MenhirState170 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv145 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv146)
    | MenhirState166 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv147 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * 'tv_nonempty_list_stmt_) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv148)
    | MenhirState156 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv149 * Lexing.position * _menhir_state * 'tv_access * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv150)
    | MenhirState150 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv151 * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _, _menhir_s, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv152)
    | MenhirState146 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv153 * _menhir_state * 'tv_stmt) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv154)
    | MenhirState145 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv155 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv156)
    | MenhirState144 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv157 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) * 'tv_option_REVERSE_) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv158)
    | MenhirState142 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv159 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) * 'tv_option_REVERSE_) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv160)
    | MenhirState140 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv161 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) * 'tv_option_REVERSE_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _, _menhir_s, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv162)
    | MenhirState136 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv163 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv164)
    | MenhirState135 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv165 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv166)
    | MenhirState133 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv167 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv168)
    | MenhirState129 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv169 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv170)
    | MenhirState128 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv171 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv172)
    | MenhirState126 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv173 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv174)
    | MenhirState125 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv175 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * _menhir_state * 'tv_option_params_) * Lexing.position) * _menhir_state * 'tv_stype)) * _menhir_state * 'tv_list_decl_) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv176)
    | MenhirState114 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv177 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv178)
    | MenhirState110 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv179 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv180)
    | MenhirState109 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv181 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv182)
    | MenhirState107 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv183 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv184)
    | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv185 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv186)
    | MenhirState103 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv187 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv188)
    | MenhirState101 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv189 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv190)
    | MenhirState99 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv191 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv192)
    | MenhirState97 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv193 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv194)
    | MenhirState95 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv195 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv196)
    | MenhirState93 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv197 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv198)
    | MenhirState92 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv199 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv200)
    | MenhirState90 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv201 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv202)
    | MenhirState88 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv203 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv204)
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv205 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv206)
    | MenhirState83 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv207 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv208)
    | MenhirState81 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv209 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _, _menhir_s, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv210)
    | MenhirState77 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv211 * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _, _menhir_s, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv212)
    | MenhirState74 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv213 * _menhir_state * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv214)
    | MenhirState70 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv215 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv216)
    | MenhirState68 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv217 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv218)
    | MenhirState67 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv219 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv220)
    | MenhirState65 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv221 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv222)
    | MenhirState63 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv223 * _menhir_state * 'tv_separated_nonempty_list_COMMA_identifier_ * Lexing.position)) * _menhir_state * 'tv_stype)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv224)
    | MenhirState60 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv225 * _menhir_state * 'tv_separated_nonempty_list_COMMA_identifier_ * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv226)
    | MenhirState58 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv227 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * _menhir_state * 'tv_option_params_) * Lexing.position) * _menhir_state * 'tv_stype)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv228)
    | MenhirState56 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv229 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * _menhir_state * 'tv_option_params_) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv230)
    | MenhirState54 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv231 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv232)
    | MenhirState53 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv233 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv234)
    | MenhirState52 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv235 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) * _menhir_state * 'tv_option_params_)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv236)
    | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv237 * _menhir_state * 'tv_param) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv238)
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv239 * _menhir_state * 'tv_separated_nonempty_list_COMMA_identifier_ * Lexing.position)) * 'tv_option_mode_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv240)
    | MenhirState37 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv241 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv242)
    | MenhirState36 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv243 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv244)
    | MenhirState35 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv245 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv246)
    | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv247 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _, _menhir_s, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv248)
    | MenhirState30 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv249 * _menhir_state * 'tv_field) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv250)
    | MenhirState28 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv251 * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv252)
    | MenhirState18 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv253 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv254)
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv255 * _menhir_state * 'tv_separated_nonempty_list_COMMA_identifier_ * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv256)
    | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv257 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv258)
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv259 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv260)
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((('freshtv261)) * Lexing.position))) * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv262)
    | MenhirState7 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv263)) * Lexing.position))) * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv264)

and _menhir_run8 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 29 "parser.mly"
       (string)
# 5081 "parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv125) = Obj.magic _menhir_stack in
    let (_endpos_i_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((i : (
# 29 "parser.mly"
       (string)
# 5092 "parser.ml"
    )) : (
# 29 "parser.mly"
       (string)
# 5096 "parser.ml"
    )) = _v in
    let (_startpos_i_ : Lexing.position) = _startpos in
    ((let _startpos = _startpos_i_ in
    let _endpos = _endpos_i_ in
    let _v : 'tv_identifier = let _endpos = _endpos_i_ in
    let _startpos = _startpos_i_ in
    
# 177 "parser.mly"
  ( (i, {fp = _startpos; lp = _endpos}) )
# 5106 "parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv123) = _menhir_stack in
    let (_endpos : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_identifier) = _v in
    let (_startpos : Lexing.position) = _startpos in
    ((let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    match _menhir_s with
    | MenhirState7 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv35)) * Lexing.position))) * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IS ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((((('freshtv31)) * Lexing.position))) * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | FUNCTION ->
                _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState10 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | PROCEDURE ->
                _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TYPE ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | BEGIN ->
                _menhir_reduce43 _menhir_env (Obj.magic _menhir_stack) MenhirState10
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState10) : 'freshtv32)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((((('freshtv33)) * Lexing.position))) * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)) : 'freshtv36)
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv51 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IS ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv43 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ACCESS ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv37 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) = Obj.magic _menhir_stack in
                let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
                ((let _menhir_stack = (_menhir_stack, _startpos) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | IDENT _v ->
                    _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState32 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState32) : 'freshtv38)
            | RECORD ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv39 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | IDENT _v ->
                    _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState15 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState15) : 'freshtv40)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv41 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)) : 'freshtv44)
        | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv47 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv45 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) = Obj.magic _menhir_stack in
            let (_endpos__3_ : Lexing.position) = _endpos in
            ((let ((_menhir_stack, _menhir_s, _startpos__1_), _endpos_i_, _, (i : 'tv_identifier), _startpos_i_) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_decl = let _endpos = _endpos__3_ in
            let _startpos = _startpos__1_ in
            
# 68 "parser.mly"
  ( Dtype i, {fp = _startpos; lp = _endpos} )
# 5210 "parser.ml"
             in
            _menhir_goto_decl _menhir_env _menhir_stack _menhir_s _v) : 'freshtv46)) : 'freshtv48)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv49 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)) : 'freshtv52)
    | MenhirState18 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv55 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv53 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _startpos__1_), _endpos_i_, _, (i : 'tv_identifier), _startpos_i_) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_stype = let _endpos = _endpos_i_ in
        let _startpos = _startpos__1_ in
        
# 190 "parser.mly"
  ( STaccess i, {fp = _startpos; lp = _endpos} )
# 5232 "parser.ml"
         in
        _menhir_goto_stype _menhir_env _menhir_stack _menhir_s _v) : 'freshtv54)) : 'freshtv56)
    | MenhirState56 | MenhirState60 | MenhirState44 | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv59 * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv57 * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _endpos_i_, _menhir_s, (i : 'tv_identifier), _startpos_i_) = _menhir_stack in
        let _v : 'tv_stype = let _endpos = _endpos_i_ in
        let _startpos = _startpos_i_ in
        
# 188 "parser.mly"
  ( STident i, {fp = _startpos; lp = _endpos} )
# 5246 "parser.ml"
         in
        _menhir_goto_stype _menhir_env _menhir_stack _menhir_s _v) : 'freshtv58)) : 'freshtv60)
    | MenhirState10 | MenhirState52 | MenhirState190 | MenhirState58 | MenhirState37 | MenhirState48 | MenhirState30 | MenhirState28 | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv67 * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COMMA ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv61 * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | IDENT _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState28 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState28) : 'freshtv62)
        | COLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv63 * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _endpos_x_, _menhir_s, (x : 'tv_identifier), _startpos_x_) = _menhir_stack in
            let _startpos = _startpos_x_ in
            let _v : 'tv_separated_nonempty_list_COMMA_identifier_ = 
# 216 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( [ x ] )
# 5275 "parser.ml"
             in
            _menhir_goto_separated_nonempty_list_COMMA_identifier_ _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv64)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv65 * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)) : 'freshtv68)
    | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv75 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv71 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv69 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) = Obj.magic _menhir_stack in
            let (_endpos__6_ : Lexing.position) = _endpos in
            ((let ((((_menhir_stack, _menhir_s, _startpos__1_), _endpos_i1_, _, (i1 : 'tv_identifier), _startpos_i1_), _startpos__4_), _endpos_i2_, _, (i2 : 'tv_identifier), _startpos_i2_) = _menhir_stack in
            let _6 = () in
            let _4 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_decl = let _endpos = _endpos__6_ in
            let _startpos = _startpos__1_ in
            
# 70 "parser.mly"
  ( Daccesstype (i1, i2), {fp = _startpos; lp = _endpos} )
# 5309 "parser.ml"
             in
            _menhir_goto_decl _menhir_env _menhir_stack _menhir_s _v) : 'freshtv70)) : 'freshtv72)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv73 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv74)) : 'freshtv76)
    | MenhirState35 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv77 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | LPAR ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState36 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | IS ->
            _menhir_reduce59 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState36) : 'freshtv78)
    | MenhirState53 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv79 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | LPAR ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState54 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | RETURN ->
            _menhir_reduce59 _menhir_env (Obj.magic _menhir_stack) MenhirState54
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState54) : 'freshtv80)
    | MenhirState68 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv83 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv81 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _startpos__1_), _endpos_i_, _, (i : 'tv_identifier), _startpos_i_) = _menhir_stack in
        let _1 = () in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_i_ in
        let _v : 'tv_expr = let _endpos = _endpos_i_ in
        let _startpos = _startpos__1_ in
        
# 142 "parser.mly"
  ( Enew i, {fp = _startpos; lp = _endpos} )
# 5361 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv82)) : 'freshtv84)
    | MenhirState170 | MenhirState156 | MenhirState150 | MenhirState142 | MenhirState140 | MenhirState133 | MenhirState129 | MenhirState126 | MenhirState63 | MenhirState65 | MenhirState67 | MenhirState70 | MenhirState114 | MenhirState92 | MenhirState109 | MenhirState110 | MenhirState107 | MenhirState105 | MenhirState103 | MenhirState101 | MenhirState99 | MenhirState97 | MenhirState95 | MenhirState93 | MenhirState90 | MenhirState88 | MenhirState83 | MenhirState81 | MenhirState77 | MenhirState74 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv89 * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | LPAR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv85 * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) = Obj.magic _menhir_stack in
            let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
            ((let _menhir_stack = (_menhir_stack, _startpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CHAR _v ->
                _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState77 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | CHARVAL ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState77 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FALSE ->
                _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState77 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState77 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INT _v ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState77 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LPAR ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState77 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NEW ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState77 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NOT ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState77 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NULL ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState77 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | SUB ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState77 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TRUE ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState77 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState77) : 'freshtv86)
        | ADD | AND | COMMA | DIV | DOT | DOUBLEDOT | EQ | GE | GT | LE | LOOP | LT | MUL | NEQ | OR | REM | RPAR | SEMICOLON | SUB | THEN ->
            _menhir_reduce1 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv87 * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv88)) : 'freshtv90)
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv93 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv91 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _endpos_e_, _menhir_s, (e : 'tv_expr), _startpos_e_), _endpos_i_, _, (i : 'tv_identifier), _startpos_i_) = _menhir_stack in
        let _2 = () in
        let _startpos = _startpos_e_ in
        let _endpos = _endpos_i_ in
        let _v : 'tv_access = let _endpos = _endpos_i_ in
        let _startpos = _startpos_e_ in
        
# 196 "parser.mly"
  ( Arecord (e, i), {fp = _startpos; lp = _endpos} )
# 5427 "parser.ml"
         in
        _menhir_goto_access _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv92)) : 'freshtv94)
    | MenhirState136 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv107 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv103 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | REVERSE ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv97) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv95) = Obj.magic _menhir_stack in
                ((let x = () in
                let _v : 'tv_option_REVERSE_ = 
# 103 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( Some x )
# 5452 "parser.ml"
                 in
                _menhir_goto_option_REVERSE_ _menhir_env _menhir_stack _v) : 'freshtv96)) : 'freshtv98)
            | CHAR _ | CHARVAL | FALSE | IDENT _ | INT _ | LPAR | NEW | NOT | NULL | SUB | TRUE ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv99) = Obj.magic _menhir_stack in
                ((let _v : 'tv_option_REVERSE_ = 
# 101 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( None )
# 5461 "parser.ml"
                 in
                _menhir_goto_option_REVERSE_ _menhir_env _menhir_stack _v) : 'freshtv100)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv101 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv102)) : 'freshtv104)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv105 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv106)) : 'freshtv108)
    | MenhirState199 | MenhirState193 | MenhirState125 | MenhirState128 | MenhirState135 | MenhirState172 | MenhirState174 | MenhirState144 | MenhirState145 | MenhirState146 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv117 * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | LPAR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv109 * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) = Obj.magic _menhir_stack in
            let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
            ((let _menhir_stack = (_menhir_stack, _startpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CHAR _v ->
                _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState150 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | CHARVAL ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState150 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FALSE ->
                _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState150 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState150 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INT _v ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState150 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LPAR ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState150 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NEW ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState150 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NOT ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState150 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NULL ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState150 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | SUB ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState150 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TRUE ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState150 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState150) : 'freshtv110)
        | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv113 * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv111 * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) = Obj.magic _menhir_stack in
            let (_endpos__2_ : Lexing.position) = _endpos in
            ((let (_menhir_stack, _endpos_i_, _menhir_s, (i : 'tv_identifier), _startpos_i_) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_stmt = let _endpos = _endpos__2_ in
            let _startpos = _startpos_i_ in
            
# 93 "parser.mly"
  ( Scall (i, []), {fp = _startpos; lp = _endpos} )
# 5533 "parser.ml"
             in
            _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv112)) : 'freshtv114)
        | ADD | AND | COLONEQ | DIV | DOT | EQ | GE | GT | LE | LT | MUL | NEQ | OR | REM | SUB ->
            _menhir_reduce1 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv115 * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv116)) : 'freshtv118)
    | MenhirState201 | MenhirState195 | MenhirState186 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv121 * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv119 * Lexing.position * _menhir_state * 'tv_identifier * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _endpos_x_, _menhir_s, (x : 'tv_identifier), _startpos_x_) = _menhir_stack in
        let _v : 'tv_option_identifier_ = 
# 103 "/home/md5/.opam/default/lib/menhir/standard.mly"
    ( Some x )
# 5554 "parser.ml"
         in
        _menhir_goto_option_identifier_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv120)) : 'freshtv122)
    | _ ->
        _menhir_fail ()) : 'freshtv124)) : 'freshtv126)

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
# 50 "parser.mly"
      (Ast.file)
# 5575 "parser.ml"
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
    let (_menhir_stack : 'freshtv29) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | WITH ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv25) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | STDLIB ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv21) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEMICOLON ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv17)) = Obj.magic _menhir_stack in
                let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
                ((let _menhir_stack = (_menhir_stack, _endpos) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | USE ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv13)) * Lexing.position) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | STDLIB ->
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : ((('freshtv9)) * Lexing.position)) = Obj.magic _menhir_stack in
                        ((let _menhir_env = _menhir_discard _menhir_env in
                        let _tok = _menhir_env._menhir_token in
                        match _tok with
                        | SEMICOLON ->
                            let (_menhir_env : _menhir_env) = _menhir_env in
                            let (_menhir_stack : (((('freshtv5)) * Lexing.position))) = Obj.magic _menhir_stack in
                            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
                            ((let _menhir_stack = (_menhir_stack, _endpos) in
                            let _menhir_env = _menhir_discard _menhir_env in
                            let _tok = _menhir_env._menhir_token in
                            match _tok with
                            | PROCEDURE ->
                                let (_menhir_env : _menhir_env) = _menhir_env in
                                let (_menhir_stack : ((((('freshtv1)) * Lexing.position))) * Lexing.position) = Obj.magic _menhir_stack in
                                let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
                                ((let _menhir_stack = (_menhir_stack, _startpos) in
                                let _menhir_env = _menhir_discard _menhir_env in
                                let _tok = _menhir_env._menhir_token in
                                match _tok with
                                | IDENT _v ->
                                    _menhir_run8 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState7 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                                | _ ->
                                    assert (not _menhir_env._menhir_error);
                                    _menhir_env._menhir_error <- true;
                                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState7) : 'freshtv2)
                            | _ ->
                                assert (not _menhir_env._menhir_error);
                                _menhir_env._menhir_error <- true;
                                let (_menhir_env : _menhir_env) = _menhir_env in
                                let (_menhir_stack : ((((('freshtv3)) * Lexing.position))) * Lexing.position) = Obj.magic _menhir_stack in
                                (raise _eRR : 'freshtv4)) : 'freshtv6)
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            let (_menhir_env : _menhir_env) = _menhir_env in
                            let (_menhir_stack : (((('freshtv7)) * Lexing.position))) = Obj.magic _menhir_stack in
                            (raise _eRR : 'freshtv8)) : 'freshtv10)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : ((('freshtv11)) * Lexing.position)) = Obj.magic _menhir_stack in
                        (raise _eRR : 'freshtv12)) : 'freshtv14)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv15)) * Lexing.position) = Obj.magic _menhir_stack in
                    (raise _eRR : 'freshtv16)) : 'freshtv18)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv19)) = Obj.magic _menhir_stack in
                (raise _eRR : 'freshtv20)) : 'freshtv22)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv23) = Obj.magic _menhir_stack in
            (raise _eRR : 'freshtv24)) : 'freshtv26)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv27) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv28)) : 'freshtv30))

# 220 "/home/md5/.opam/default/lib/menhir/standard.mly"
  


# 5695 "parser.ml"
