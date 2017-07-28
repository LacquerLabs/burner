.DEFAULT_GOAL := help

build: ## Build it
	docker build -t webapp .

run: ## run it
	docker run -p 80:8080 -v ${PWD}/code:/app --name webapp_test --rm -id webapp

connect: ## connect to it
	docker exec -it webapp_test /bin/sh

kill: ## kill it
	docker kill webapp_test

it: build run connect ## do it all

.PHONY: help

help: ## Helping devs since 2016
	@cat $(MAKEFILE_LIST) | grep -e "^[a-zA-Z_\-]*: *.*## *" | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo "For additional commands have a look at the README"