rg="vnet-rg"
location="centralindia"
vnet="vnet-demo"
bastionPIP="bastion-ip"
bastionName="myBastion"

az network public-ip create \
  --resource-group $rg \
  --name $bastionPIP \
  --sku Standard \
  --location $location

az network bastion create \
  --resource-group $rg \
  --name $bastionName \
  --public-ip-address $bastionPIP \
  --vnet-name $vnet \
  --location $location

echo "✅ Bastion host deployed. You can now access app/db VMs via Azure portal (Bastion)."
