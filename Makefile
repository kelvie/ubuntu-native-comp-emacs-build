##
# Project Title
#
# @file
# @version 0.1

default: run

IMAGENAME = $(shell basename ${PWD})

CONTAINERNAME = $(shell mktemp -u XXXXXX)
build:
	docker build -t  $(IMAGENAME) .

run: build
	docker run -it --name $(CONTAINERNAME) $(IMAGENAME)
	docker cp $(CONTAINERNAME):/src/archive ./
	docker rm $(CONTAINERNAME)

sh: build
	docker run --rm -it $(IMAGENAME) /bin/bash


# end
