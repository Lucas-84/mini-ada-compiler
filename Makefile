EXEC = adac
FLAGS = -use-menhir
BYTE = main.byte

all:
	ocamlbuild $(FLAGS) $(BYTE)
	mv $(BYTE) $(EXEC)

clean:
	ocamlbuild -clean
