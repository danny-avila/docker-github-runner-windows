#Log into Azure
#az login

# Setup Variables.
$aciResourceGroupName = "Demo-ACI-GitHub-Runners-RG"
$appName = "LibreChat" #Previously created Service Principal (See part 3 of blog series)
$region = "eastus"

# Create a resource group to deploy ACIs to
az group create --name "$aciResourceGroupName" --location "$region"
$aciRGId = az group show --name "$aciResourceGroupName" --query id --output tsv

# Grant AAD App and Service Principal Contributor to ACI deployment RG
az ad sp list --display-name $appName --query [].appId -o tsv | ForEach-Object {
    az role assignment create --assignee "$_" `
        --role "Contributor" `
        --scope "$aciRGId"
}
