# Django and Docker commands

PROJECT_NAME = djangoapi
DJANGO_PROJECT_NAME = project

PROJECT_SRV = ${PROJECT_NAME}_SRV

.PHONY: all

.DEFAULT:
	@echo "Usage: "
	@make help

help: ## Show this help.
	# From https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
build: ## Build / rebuild the project.
	@docker-compose build
dbshell: ## Access Django DB shell inside project container.
	@docker-compose run ${PROJECT_NAME} python3 ${DJANGO_PROJECT_NAME}/manage.py dbshell
create_dev_admin: ## Create a Admin user for dev environment.
	@scripts/create_dev_admin.sh
djangoshell: ## Access Django shell_plus inside project container.
	@docker-compose run ${PROJECT_NAME} python3 ${DJANGO_PROJECT_NAME}/manage.py shell_plus --ipython
lint:  ## Run linting on Project.
	@scripts/code-linter.sh
logs: ## Show project container logs in "follow" mode.
	docker logs -f ${PROJECT_SRV}
migrations: ##  Runs 'manage.py makemigrations'. Note: it will generate standard migration names. If we want to customize 'name', we will have ro run the command directly to supply the option.
	@docker-compose run ${PROJECT_NAME} python3 ${DJANGO_PROJECT_NAME}/manage.py makemigrations
osshell:  ## Run a OS shell inside project container.
	@docker-compose run ${PROJECT_NAME} sh
pdb: ## Attach to ${PROJECT_SRV} so can interact with pdb
	@docker attach ${PROJECT_SRV}
restart:  stop startbg ## Restart Project.
start: ## Start project running in a non-detached mode.
	@docker-compose up
startbg: ## Start project running in detached mode - background.
	@docker-compose up -d
stop: ## Stop the running project.
	@docker-compose stop
tests: ## Run unit tests in project. Alternatively tests can be run in interactive mode using 'make osshell'.
	@docker-compose run ${PROJECT_NAME} pytest
