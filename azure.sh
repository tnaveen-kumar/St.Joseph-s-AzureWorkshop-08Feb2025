# Create resource group
az group create --name Workshop-RG-Hub --location southindia
az group create --name Workshop-RG-spoke-1 --location southindia
az group create --name Workshop-RG-spoke-2 --location southindia

#Vnet Creation
az network vnet create --resource-group Workshop-RG-Hub \
    --name VNet-Hub \
    --location southindia \
    --address-prefix 10.50.0.0/16
az network vnet create --resource-group Workshop-RG-spoke-1 \
    --name VNet-spoke-1 \
    --location southindia \
    --address-prefix 172.16.0.0/16
az network vnet create --resource-group Workshop-RG-spoke-2 \
    --name VNet-spoke-2 \
    --location southindia \
    --address-prefix 192.168.0.0/16


# Subnet
az network vnet subnet create --resource-group Workshop-RG-Hub \
    --vnet-name VNet-Hub \
    --name Subnet-Hub \
    --address-prefix 10.50.1.0/24
az network vnet subnet create --resource-group Workshop-RG-spoke-1 \
    --vnet-name VNet-spoke-1 \
    --name Subnet-spoke-1 \
    --address-prefix 172.16.1.0/24
az network vnet subnet create --resource-group Workshop-RG-spoke-2 \
    --vnet-name VNet-spoke-2 \
    --name Subnet-spoke-2 \
    --address-prefix 192.168.1.0/24

# VM Creation
az vm create --resource-group Workshop-RG-Hub \
    --name VM-Hub-1 \
    --image MicrosoftWindowsServer:WindowsServer:2022-datacenter:latest \
    --admin-username naveen \
    --admin-password 'Powershell@1234' \
    --size Standard_D2s_v3 \
    --vnet-name VNet-Hub \
    --subnet Subnet-Hub \
    --public-ip-sku Standard

# Create a VM in West Europe with Public IP
az vm create --resource-group Workshop-RG-spoke-1 \
    --name VM-spoke-1 \
    --image MicrosoftWindowsServer:WindowsServer:2022-datacenter:latest \
    --admin-username naveen \
    --admin-password 'Powershell@1234' \
    --size Standard_D2s_v3 \
    --vnet-name VNet-spoke-1 \
    --subnet Subnet-spoke-1 \
    --public-ip-sku Standard

# Create a VM in Southeast Asia with Public IP
az vm create --resource-group Workshop-RG-spoke-2 \
    --name VM-spoke-2 \
    --image MicrosoftWindowsServer:WindowsServer:2022-datacenter:latest \
    --admin-username naveen \
    --admin-password 'Powershell@1234' \
    --size Standard_D2s_v3 \
    --vnet-name VNet-spoke-2 \
    --subnet Subnet-spoke-2 \
    --public-ip-sku Standard