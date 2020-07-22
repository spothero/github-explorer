-include .env.$(or $(APP_ENV),development)
export

THIS_FILE := $(lastword $(MAKEFILE_LIST))

.DEFAULT_GOAL := help

python-version: ## Provides the Python version
	pipenv run python --version
.PHONY: python-version

run: ## Run the app
	poetry run my-script
.PHONY: run

test: ## Run the tests
	poetry run pytest -s
.PHONY: test

repl: ## Fire up the Repl
	poetry run python
.PHONY: repl

help: ## Prints this help message
	@grep -h -E '^[a-zA-Z0-9\._-]+:.*?## .*$$' $(MAKEFILE_LIST) |\
		sort | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.DEFAULT_GOAL := help
