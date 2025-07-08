rg="vnet-rg"
location="centralindia"
vnet="vnet-demo"
adminUser="azureuser"

az vm create \
  --resource-group $rg \
  --name web-vm \
  --image Ubuntu2204 \
  --vnet-name $vnet \
  --subnet web-subnet \
  --admin-username $adminUser \
  --generate-ssh-keys \
  --public-ip-sku Standard \
  --size Standard_B1s

az vm create \
  --resource-group $rg \
  --name app-vm \
  --image Ubuntu2204 \
  --vnet-name $vnet \
  --subnet app-subnet \
  --admin-username $adminUser \
  --generate-ssh-keys \
  --public-ip-address "" \
  --size Standard_B1s

az vm create \
  --resource-group $rg \
  --name db-vm \
  --image Ubuntu2204 \
  --vnet-name $vnet \
  --subnet db-subnet \
  --admin-username $adminUser \
  --generate-ssh-keys \
  --public-ip-address "" \
  --size Standard_B1s

echo "✅ Web, App, and DB VMs created."
