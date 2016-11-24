(* Syntaxic analyzer for Mini-Ada *)

%{
  open Ast
%}

(* Token declaration *)

%token ACCESS AND BEGIN ELSE ELSIF END FALSE FOR FUNCTION IF IN IS
%token LOOP NEW NOT NULL OR OUT PROCEDURE RECORD REM RETURN REVERSE THEN
%token TRUE TYPE USE WHILE WITH

%token EOF

(* Token precedence *)

(* Grammar entry point *)

(* Type returned by the syntaxic analyzer *)

(* Grammar rules *)

file:
;

decl:
;

field:
;

typei:
;

params:
;

param:
;

mode:
;

expr:
;

instr:
;

operator:
;

access:
;
