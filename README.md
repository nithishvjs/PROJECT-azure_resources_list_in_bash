# Azure Resource Listing Script

This is a Bash script that automates the process of listing various Azure resources by region using the Azure CLI.

## Description

The script helps DevOps engineers and cloud administrators to quickly query and view Azure resources based on a specific region and service. It supports a wide range of services such as Virtual Machines, AKS, Storage Accounts, and more.

## Supported Azure Services

*)Resource Groups (rg)
*)Virtual Machines (vm)
*)Azure Kubernetes Service (aks)
*)Azure Container Registry (acr)
*)Storage Accounts (storageaccount)
*)Virtual Networks (vnet)
*)Function Apps (function)
*)Network Security Groups (nsg)

User-Friendly Output: Uses az CLI's query feature to format the results in a human-readable table

## Prerequisites

- **Azure CLI installed**  
  You can install it from: https://learn.microsoft.com/en-us/cli/azure/install-azure-cli

- **Azure CLI configured**  
  Make sure you are logged in with `az login`.

## Usage

```bash
./azure_resource_list.sh <azure_region> <azure_service>
