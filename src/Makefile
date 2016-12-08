SOURCES = lexer.mll parser.mly typer.ml ast.mli main.ml
SOURCES_PARSE = $(SOURCES:.mly=.ml)
SOURCES_LEX = $(SOURCES_PARSE:.mll=.ml)
OBJECTS = $(SOURCES_LEX:.ml=.cmo)
EXEC_FILE = adac

all: depend $(EXEC_FILE)

clean:
	rm -f *.cm[iox] *~ .*~ #*#
	rm -f $(EXEC_FILE)
	rm -f parser.mli parser.ml lexer.ml

$(EXEC_FILE): $(OBJECTS)
	ocamlc $(OBJECTS) -o $(EXEC_FILE)

.SUFFIXES: .ml .mli .cmo .cmi .cmx .mll .mly

.ml.cmo:
	ocamlc -c $<

.mli.cmi:
	ocamlc -c $<

.mll.cmo:
	ocamllex $<
	ocamlc -c $*.ml

.mly.cmo:
	menhir $<
	ocamlc -c $*.mli
	ocamlc -c $*.ml

.mly.cmi:
	menhir $<
	ocamlc -c $*.mli

.mll.ml:
	ocamllex $<

.mly.ml:
	menhir $<

depend: $(SOURCES_LEX)
	ocamldep *.mli *.ml > .depend

include .depend
