# AzureListPulbicIPs

The most easy way to get all public IPs from the Azure subscriptions.

## Prerequisites

* [Docker](https://docs.docker.com/install/)

* [Azure Service Principal](https://docs.microsoft.com/en-us/cli/azure/create-an-azure-service-principal-azure-cli?view=azure-cli-latest)

## Getting started

First of all, export your Azure Service Principal credentials to use this project.

```bash
export PASSWORD="XXXXXXX-XXXXXXX-XXXXXXXX-XXXXXXX"
export TENANT_ID="XXXXXXX-XXXXXXX-XXXXXXXX-XXXXXXX"
export APP_ID="XXXXXXX-XXXXXXX-XXXXXXXX-XXXXXXX"
```

## Create a environment
 
Run this command to build your strucutre

```bash
$ make setup
```

## Getting the IP list

To get the full information from subscriptions, use this command:

```bash
$ make
```

This command will read all the Subscriptons where the Service Principal has the access.

TIP: Create the Service Principal for this action only with READ permissions.

But if you want only the IP list, use this:

```bash
$ make | awk -F "," '{print $3}'
```

That's all :D