# spinup                                 -*- makefile-gmake -*-
# GNUmakefile

DISPLAY = short
DUNE = opam exec -- dune $1 --display $(DISPLAY)

build all::
	$(call DUNE, build @@default)
.PHONY: build all

test tests runtest check::
	$(call DUNE, runtest)
.PHONY: test tests runtest check

install: build
	$(call DUNE, install)
.PHONY: install

doc::
	$(call DUNE, build @doc)
.PHONY: doc

clean::
	$(call DUNE, clean)
.PHONY: clean
