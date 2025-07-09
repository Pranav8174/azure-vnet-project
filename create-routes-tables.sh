rg="vnet-rg"
routeTable="web-to-app-rt"

az network route-table create \
  --name $routeTable \
  --resource-group $rg \
  --location centralindia

az network route-table route create \
  --resource-group $rg \
  --route-table-name $routeTable \
  --name web-to-app \
  --address-prefix 10.0.2.0/24 \
  --next-hop-type VirtualAppliance \
  --next-hop-ip-address 10.0.2.4  

az network vnet subnet update \
  --vnet-name vnet-demo \
  --name web-subnet \
  --resource-group $rg \
  --route-table $routeTable

echo "✅ Route table created and attached to web-subnet."
