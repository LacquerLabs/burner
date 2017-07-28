.DEFAULT_GOAL := help

build: ## Build it
	docker build -t burney .

run: ## run it
	docker run -p 80:8080 -v ${PWD}/code:/app --name burney_run --rm -id burney

connect: ## connect to it
	docker exec -it bunrey_run /bin/sh

kill: ## kill it
	docker kill burney_run

it: build run connect ## do it all

.PHONY: help

help: ## Helping devs since 2016
	@cat $(MAKEFILE_LIST) | grep -e "^[a-zA-Z_\-]*: *.*## *" | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo "For additional commands have a look at the README"
