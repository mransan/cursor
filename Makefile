OCB_INC   = -I .
OCB_FLAGS = -use-ocamlfind
OCB       = ocamlbuild $(OCB_FLAGS) $(OCB_INC)

.PHONY: all

all:
	$(OCB) cursor_list.native
	$(OCB) cursor_tree.native

clean:
	$(OCB) -clean
