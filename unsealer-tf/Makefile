# region:=lhr

setup: ## install asdf plugins defined in the .tool-versions file. Run `asdf install`
	cut -d' ' -f1 .tool-versions|xargs -i asdf plugin add {} || true
	asdf install

fmt: ## run `terraform init`
	terraform fmt

validate: ## run `terraform init`
	terraform validate

init: ## run `terraform init`
	terraform init

plan: fmt validate ## runs terraform fmt, validate and plan. Depends on FLY_API_TOKEN environment variable
	terraform plan

plan-destroy: ## runs terraform plan -destroy. Depends on FLY_API_TOKEN environment variable
	terraform plan -destroy

destroy: apply ## alias for `make apply`. Make sure a plan -out file was created using -destroy option: `make plan-destroy`. Depends on FLY_API_TOKEN environment variable
apply: ## runs `terraform apply terraform.pla`. Make sure a plan -out file was created. Depends on FLY_API_TOKEN environment variable
	terraform apply -auto-approve

# init-unsealer:


# vault-config-transport
# fly.io operations
# fly-tunnel:

.DEFAULT_GOAL=help
.PHONY=help
help: ## show help message
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m\033[0m\n"} /^[$$()% a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
