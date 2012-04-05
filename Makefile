all: help

help:
	@echo "Convenience Makefile for the lazy typists."
	@echo
	@echo "Development stuff:"
	@echo "  clean  Throw away Python bytecode files, caches, and other junk"
	@echo "  check  check Python syntax & coding style"
	@echo "  test   run unit tests (verbose)"
	@echo "  tt     run unit tests (compact)"
	@echo "  t      same as tt, but fails fast"
	@echo

####################
# Development stuff

clean:
	find . -name '*.pyc' -print0 | xargs -0 rm -r

check:
	@make check-syntax || true
	@make check-style || true

check-syntax:
	@find $(shell ls | egrep -v '(lib|bin|include)') -name '*.py' -print0 | xargs -0 pyflakes

check-style:
	@pep8 -r --exclude=lib,bin,include .

test:
	@python -m unittest discover -v -s tests

tt:
	@python -m unittest discover -s tests

t:
	@python -m unittest discover -s tests --failfast
