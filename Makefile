EXEC = adac
FLAGS = -use-menhir

all:
	ocamlbuild $(FLAGS) main.byte
	mv main.byte adac

clean:
	ocamlbuild -clean
