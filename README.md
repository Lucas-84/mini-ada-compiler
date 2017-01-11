# Mini Ada compiler

## Usage

To compile:

````
make
````

To execute:

````
./ada file.adb
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
 - `rapport/rapport.pdf` : PDF report.
