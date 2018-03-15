FROM microsoft/azure-cli:2.0.29

COPY bin/AzurePublicIP.sh /listazurepublicips/AzurePublicIP.sh

WORKDIR /listazurepublicips

ENTRYPOINT ["bash", "AzurePublicIP.sh"]
