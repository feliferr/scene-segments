SHELL := /bin/bash

ifeq ($(VERSION),)
  VERSION := $(shell echo `git symbolic-ref -q --short HEAD || git describe --tags --exact-match`)
endif
VERSION := $(shell echo ${VERSION} | sed 's!/!_!g')


version:
	@echo $(VERSION)

# Local
setup:

	pip install -r requirements.txt

setup-env:

	conda create -n env-scene python=3.8 -y
	conda init zsh
	conda activate env-scene
	pip install -r requirements.txt
