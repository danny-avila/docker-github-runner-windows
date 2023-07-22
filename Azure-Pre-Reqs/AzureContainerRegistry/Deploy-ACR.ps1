#Log into Azure
#az login

# Setup Variables.
$randomInt = Get-Random -Maximum 9999
$resourceGroupName = "LibreChat-Registry"
$region = "eastus"
$acrName = "librechatRegistry$randomInt"

# Create a resource resourceGroupName
az group create --name "$resourceGroupName" --location "$region"

# Create an ACR (Basic)
az acr create --resource-group "$resourceGroupName" `
    --name "$acrName" `
    --sku "Basic" `
    --admin-enabled "false"
