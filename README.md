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

## Getting the Public IP list

To get the full information from subscriptions, use this command:

```bash
$ make export-public-ips
```

Output:

```bash
"Subscription name","public-ip-1","resource-group","xxx.xxx.163.121"
"Subscription name","public-ip-2","resource-group","xxx.xxx.168.55"
"Subscription name","public-ip-3","resource-group","xxx.xxx.67.68"
```

The output contains:

```csv
"Subscription name","public ip name","resource group","ip address"
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

Output:

```bash
"Subscription Name","vm-0","CoreOS","CoreOS","Stable","latest"
"Subscription Name","vm-1","Canonical","UbuntuServer","16.04-LTS","latest"
"Subscription Name","vm-2","Canonical","UbuntuServer","18.04-LTS","latest"
```

The output contains:

```csv
"Subscription name","vm name","publisher", "offer", "sku", "version"
```

## Getting the VM Public IP list

To get the full information from subscriptions, use this command:

```bash
$ make export-vm-public-ips
```

Output:

```bash
"Subscription Name","vm-0","XXX.XXX.163.121"
"Subscription Name","vm-1","XXX.XXX.67.68"
"Subscription Name","vm-2","XXX.XXX.30.230"
```

The output contains:

```csv
"Subscription name","vm name","ip address"
```

If you want only the IP list, use this:

```bash
$ make export-vm-public-ips | awk -F "," '{print $3}'
```

## Getting the VM Size list

To get the full information from subscriptions, use this command:

```bash
$ make export-vm-sizes
```

Output:

```bash
"Subscription Name","vm-0","Standard_ds2_v2"
"Subscription Name","vm-1","Standard_ds2_v2"
"Subscription Name","vm-2","Standard_ds2_v2"
```

The output contains:

```csv
"Subscription name","vm name","vm size"
```

## Getting the Role Assignment list

To get the full information from subscriptions, use this command:

```bash
$ make export-role-assignment
```

Output:

```bash
"Subscription Name","c1111111-cf11-111b-b111-1d111f111c11","name.surname@domain.com.br","1ad1b1f1-111a-1111-b1cf-11ab111a1e0f","Owner"
"Subscription Name","1ab1111d-b11b-1e11-b111-11111ef11111","name.surname@domain.com.br","d11ab11c-111f-111f-1111-1c11111f111c","Owner"
"Subscription Name","111c1111-1111-1111-1f1a-111bab1a11f1","http://azure-cli-2019-01-08-15-38-34","a7111111-111e-11d1-b11a-11b11a1b1e11","Contributor"
```

The output contains:

```csv
"Subscription name","role name","service principal name", "service principal id", "role definition"
```

---
This commands will read all the Subscriptons where the Service Principal has the access.

TIP: Create the Service Principal for this action only with READ permissions.

That's all :D
