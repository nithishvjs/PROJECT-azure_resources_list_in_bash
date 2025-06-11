#!/bin/bash

###############################################################################
# Supported Azure Services:
# - Resource Groups (rg)
# - Virtual Machines (vm)
# - Azure Kubernetes Service (aks)
# - Azure Container Registry (acr)
# - Storage Accounts (storageaccount)
# - Virtual Networks (vnet)
# - Function Apps (function)
# - Network Security Groups (nsg)
#
# Usage: ./azure_resource_list.sh <azure_region> <azure_service>
# Example: ./azure_resource_list.sh eastus vm
###############################################################################

az_region=$1
az_service=$2

# Check if Azure CLI is installed
if ! command -v az &> /dev/null; then
    echo "Az CLI is not installed. Please install Az CLI and try again."
    exit 1
fi

# Check if Azure CLI is configured
if [ ! -d ~/.azure ]; then
    echo "Azure CLI is not configured. Please run 'az login' to configure."
    exit 1
fi

case $az_service in

    rg)
        echo "Listing Resource Groups in region: $az_region"
        az group list \
            --query "[?location=='$az_region'].{Name:name, Region:location}" \
            --output table
        ;;

    vm)
        echo "Listing Virtual Machines in region: $az_region"
        az vm list \
            --query "[?location=='$az_region'].{Name:name, ResourceGroup:resourceGroup, Region:location}" \
            --output table
        ;;

    aks)
        echo "Listing AKS Clusters in region: $az_region"
        az aks list \
            --query "[?location=='$az_region'].{Name:name, ResourceGroup:resourceGroup, Region:location}" \
            --output table
        ;;

    acr)
        echo "Listing Azure Container Registries in region: $az_region"
        az acr list \
            --query "[?location=='$az_region'].{Name:name, ResourceGroup:resourceGroup, Region:location}" \
            --output table
        ;;

    storageaccount)
        echo "Listing Storage Accounts in region: $az_region"
        az storage account list \
            --query "[?location=='$az_region'].{Name:name, ResourceGroup:resourceGroup, Region:location}" \
            --output table
        ;;

    vnet)
        echo "Listing Virtual Networks in region: $az_region"
        az network vnet list \
            --query "[?location=='$az_region'].{Name:name, ResourceGroup:resourceGroup, Region:location}" \
            --output table
        ;;

    function)
        echo "Listing Function Apps in region: $az_region"
        az functionapp list \
            --query "[?location=='$az_region'].{HostName:defaultHostName, State:state}" \
            --output table
        ;;

    nsg)
        echo "Listing Network Security Groups in region: $az_region"
        az network nsg list \
            --query "[?location=='$az_region'].{Name:name, ResourceGroup:resourceGroup, Region:location}" \
            --output table
        ;;

    *)
        echo "Invalid argument, please enter in this format"
        echo "./azure_resource_list.sh <azure_region> <azure_service>"
        echo "Supported services: rg, vm, aks, acr, storageaccount, vnet, function, nsg"
        exit 1
        ;;
esac
