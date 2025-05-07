.PHONY: run \
	lint \
	mypy \
	test \
	help


run: ## Run project
	poetry run python main.py

lint: ## Run linter
	poetry run ruff format --config ./pyproject.toml . && poetry run ruff check --fix --config ./pyproject.toml .

mypy: ## Run mypy
	poetry run mypy ./

test: ## Run test <filename>
	poetry run pytest -v $(filter-out $@,$(MAKECMDGOALS)) -s


# Just help
help: ## Display help screen
	@grep -h -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
