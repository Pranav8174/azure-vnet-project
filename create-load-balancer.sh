rg="vnet-rg"
location="centralindia"
lb_name="my-loadbalancer"

public_ip_name="lb-public-ip"
frontend_ip_name="lb-frontend"
backend_pool_name="lb-backend-pool"
probe_name="http-probe"
rule_name="http-rule"

nic1="web-vmVMNic"
ipconfig_name="ipconfigweb-vm" 

echo "🔵 Step 1: Creating Public IP for Load Balancer..."
az network public-ip create \
  --resource-group $rg \
  --name $public_ip_name \
  --sku Standard \
  --location $location \
  --allocation-method static


echo "🔵 Step 2: Creating Load Balancer..."
az network lb create \
  --resource-group $rg \
  --name $lb_name \
  --location $location \
  --sku Standard \
  --public-ip-address $public_ip_name \
  --frontend-ip-name $frontend_ip_name \
  --backend-pool-name $backend_pool_name
echo "🔵 Step 3: Creating HTTP Health Probe on port 80..."
az network lb probe create \
  --resource-group $rg \
  --lb-name $lb_name \
  --name $probe_name \
  --protocol Tcp \
  --port 80

echo "🔵 Step 4: Creating Load Balancer Rule for port 80..."
az network lb rule create \
  --resource-group $rg \
  --lb-name $lb_name \
  --name $rule_name \
  --protocol Tcp \
  --frontend-port 80 \
  --backend-port 80 \
  --frontend-ip-name $frontend_ip_name \
  --backend-pool-name $backend_pool_name \
  --probe-name $probe_name \
  --idle-timeout 4 \
  --enable-tcp-reset true

echo "🔵 Step 5: Attaching NIC ($nic1) to Backend Pool..."
az network nic ip-config address-pool add \
  --address-pool $backend_pool_name \
  --ip-config-name $ipconfig_name \
  --nic-name $nic1 \
  --resource-group $rg \
  --lb-name $lb_name

echo "✅ Load Balancer setup complete!"
