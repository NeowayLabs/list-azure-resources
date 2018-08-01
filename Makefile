.DEFAULT_GOAL := help

az-docker-run = docker run \
	--rm \
	-v $(shell pwd)/bin:/data \
	-e AZURE_SERVICE_PRINCIPAL=$(AZURE_SERVICE_PRINCIPAL) \
	-e AZURE_CLIENT_SECRET=$(AZURE_CLIENT_SECRET) \
	-e AZURE_TENANT_ID=$(AZURE_TENANT_ID) \
	azure-tools

.PHONY: export-vm-images
export-vm-images: setup ## List information about the vm images
	@$(az-docker-run) \
		AzureVmImage.sh

.PHONY: export-public-ips
export-public-ips: setup ## List information about the public ips
	@$(az-docker-run) \
		AzurePublicIP.sh

.PHONY: help
help: ## Show help
	@IFS=$$'\n' ; \
	help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//'`); \
	printf "%-30s %s\n" Target "Help message" ; \
	printf "%-30s %s\n" ------ ------------ ; \
	for help_line in $${help_lines[@]}; do \
		IFS=$$'#' ; \
		help_split=($$help_line) ; \
		help_command=`echo $${help_split[0]} | echo $${help_split[0]} | cut -d: -f1` ; \
		help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		printf "%-30s %s\n" $$help_command $$help_info ; \
	done

.PHONY: setup
setup: ## Build docker image with Azure CLI
	@docker build . -t azure-tools 1>/dev/null

