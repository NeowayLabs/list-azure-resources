#!/usr/bin/env bash

# This script using a Service Principal account to generate that list

# Debug bash tags

set -o errexit
set -o nounset


# Making the Azure login

az login --service-principal --username $AZURE_SERVICE_PRINCIPAL \
    --password $AZURE_CLIENT_SECRET \
    --tenant $AZURE_TENANT_ID > /dev/null 2>&1


# Using JQ to make a magic with the return JSON

JQ_FILTER=".[] |
    {
        name: .name,
        resource: .resourceGroup,
        ip: .ipAddress
    } | [ .name, .resource, .ip ] | @csv"


# Getting JSON with Subscriptions IDs

function GetAzureSubscriptions(){

    az account list | jq --raw-output ".[] | .id"
}


# Getting and cleaning a return JSON with Subscriptions IDs

function GetAzurePublicIPs(){

    subscription=$1

    az account set --subscription $subscription

    subscription_name=$(az account show | jq --raw-output ".name")

    az network public-ip list | jq  --raw-output "$JQ_FILTER" | sed "s@^@\"$subscription_name\",@g"

}

# Looping with all the Subscriptions has the Service Principal can access

for subscription in `GetAzureSubscriptions` ; do
    GetAzurePublicIPs $subscription
done
