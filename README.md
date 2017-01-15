# Mini Ada compiler

## Usage

To compile:

````
make
````

To execute:

````
./adac file.adb [--parse-only] [--type-only]
````

To clean the repository:

````
make clean
````

## Files

 - `main.ml` : main source file.
 - `exceptions.ml` : exception definitions.
 - `ast.ml` : abstract syntax trees definitions.
 - `lexer.mll` : lexer (`ocamllex`).
 - `parser.mly` : parser (`menhir`).
 - `typer.ml` : typer.
 - `compiler.ml` : code production.
 - `rapport/rapport_typer.pdf` : PDF report for typer.
 - `rapport/rapport_final.pdf` : final PDF report.
