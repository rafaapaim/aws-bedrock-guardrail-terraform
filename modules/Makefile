RESOURCE ?= .

init:
	@echo "==> Starting in $(RESOURCE)..."
	cd $(RESOURCE) && terraform init

plan:
	@echo "==> Planning in $(RESOURCE)..."
	cd $(RESOURCE) && terraform plan

apply:
	@echo "==> Applying changes in $(RESOURCE)..."
	cd $(RESOURCE) && terraform apply --auto-approve

destroy:
	@echo "==> Destroying infrastructure in $(RESOURCE)..."
	cd $(RESOURCE) && terraform destroy --auto-approve

all: init plan apply

.PHONY: init plan apply destroy all
