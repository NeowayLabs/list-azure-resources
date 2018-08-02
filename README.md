# AzureTools

The most easy way to get informations from the Azure subscriptions.

## Prerequisites

* [Docker](https://docs.docker.com/install/)

* [Azure Service Principal](https://docs.microsoft.com/en-us/cli/azure/create-an-azure-service-principal-azure-cli?view=azure-cli-latest)

## Getting started

First of all, export your Azure Service Principal credentials to use this project.

```bash
export AZURE_SERVICE_PRINCIPAL="http://awesome-service-principal"
export AZURE_CLIENT_SECRET="XXXXXXX-XXXXXXX-XXXXXXXX-XXXXXXX"
export AZURE_TENANT_ID="XXXXXXX-XXXXXXX-XXXXXXXX-XXXXXXX"
```

## Create a environment

Run this command to build your structure

```bash
$ make setup
```

## Getting the IP list

To get the full information from subscriptions, use this command:

```bash
$ make export-public-ips
```
If you want only the IP list, use this:

```bash
$ make export-public-ips | awk -F "," '{print $4}'
```

## Getting the VM Image list

To get the full information from subscriptions, use this command:

```bash
$ make export-vm-images
```
---
This commands will read all the Subscriptons where the Service Principal has the access.

TIP: Create the Service Principal for this action only with READ permissions.

That's all :D
