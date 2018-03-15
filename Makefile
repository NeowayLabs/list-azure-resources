.DEFAULT_GOAL := export-public-ips

az-docker-run = docker run \
	--rm \
	-e APP_ID=$(APP_ID) \
	-e PASSWORD=$(PASSWORD) \
	-e TENANT_ID=$(TENANT_ID) \
	listazurepublicips


.PHONY: export-public-ips
export-public-ips: setup
	@$(az-docker-run)


.PHONY: setup
setup:         
	@docker build . -t listazurepublicips
