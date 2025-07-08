rg="vnet-rg"
vnet="vnet-demo"

az network nsg create --resource-group $rg --name web-nsg
az network nsg create --resource-group $rg --name app-nsg
az network nsg create --resource-group $rg --name db-nsg

az network nsg rule create --resource-group $rg --nsg-name web-nsg \
  --name allow-http --protocol Tcp --direction Inbound --priority 100 \
  --source-address-prefix Internet --source-port-range '*' \
  --destination-port-range 80 --access Allow

az network nsg rule create --resource-group $rg --nsg-name web-nsg \
  --name allow-https --protocol Tcp --direction Inbound --priority 110 \
  --source-address-prefix Internet --source-port-range '*' \
  --destination-port-range 443 --access Allow

az network nsg rule create --resource-group $rg --nsg-name app-nsg \
  --name allow-from-web-subnet --protocol Tcp --direction Inbound --priority 100 \
  --source-address-prefix 10.0.1.0/24 --source-port-range '*' \
  --destination-port-range 8080 --access Allow

az network nsg rule create --resource-group $rg --nsg-name db-nsg \
  --name allow-from-app-subnet --protocol Tcp --direction Inbound --priority 100 \
  --source-address-prefix 10.0.2.0/24 --source-port-range '*' \
  --destination-port-range 1433 --access Allow

az network vnet subnet update --vnet-name $vnet --name web-subnet --resource-group $rg --network-security-group web-nsg
az network vnet subnet update --vnet-name $vnet --name app-subnet --resource-group $rg --network-security-group app-nsg
az network vnet subnet update --vnet-name $vnet --name db-subnet --resource-group $rg --network-security-group db-nsg

echo "✅ NSGs created, configured, and attached to subnets."
