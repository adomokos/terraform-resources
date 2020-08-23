-include .env.production
export

.PHONY: plan
plan: ## Provides a plan for the actions
	cd chapter01 && terraform plan main.tf

.PHONY: apply
apply: ## Applies the changes
	terraform apply

.PHONY: destroy
destroy: ## Destroys the infrastructure
	terraform destroy

.PHONY: instances
instances: ## Describes the instances
	 env $(cat .env.production | grep -v "#" | xargs) aws ec2 describe-instances

.PHONY: help
help: ## Display this message
	@grep -h -E '^[a-zA-Z0-9\._-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.DEFAULT_GOAL := help
