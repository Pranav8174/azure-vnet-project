rg="vnet-rg"
location="centralindia"
vnet="vnet-demo"
address_prefix="10.0.0.0/16"

web_subnet="web-subnet"
app_subnet="app-subnet"
db_subnet="db-subnet"
bastion_subnet="AzureBastionSubnet"

web_prefix="10.0.1.0/24"
app_prefix="10.0.2.0/24"
db_prefix="10.0.3.0/24"
bastion_prefix="10.0.4.0/24"

az group create --name $rg --location $location

az network vnet create \
  --resource-group $rg \
  --name $vnet \
  --address-prefix $address_prefix \
  --subnet-name $web_subnet \
  --subnet-prefix $web_prefix

az network vnet subnet create --resource-group $rg --vnet-name $vnet --name $app_subnet --address-prefix $app_prefix
az network vnet subnet create --resource-group $rg --vnet-name $vnet --name $db_subnet --address-prefix $db_prefix
az network vnet subnet create --resource-group $rg --vnet-name $vnet --name $bastion_subnet --address-prefix $bastion_prefix

echo "✅ VNet and subnets created."
