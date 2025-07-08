Azure Virtual Network (VNet) Architecture Project

A complete hands-on project demonstrating the creation of a secure, scalable, and production-ready Azure Virtual Network (VNet) setup using Azure CLI and Azure Portal.
Project Overview

This project showcases how to build a three-tier cloud infrastructure using Azure networking services. It includes setting up a resource group, virtual network, subnets, security rules, load balancer, and secure access via Azure Bastion.

Architecture Diagram

azure-vnet (10.0.0.0/16)
│
├── Web Subnet (10.0.1.0/24)
│ ├── NSG: nsg-web
│ ├── VM: web-vm-1 (via Load Balancer)
│ └── Load Balancer: lb-web (HTTP/HTTPS entry point)
│
├── App Subnet (10.0.2.0/24)
│ ├── NSG: nsg-app
│ └── VM: app-vm-1 (internal only)
│
├── DB Subnet (10.0.3.0/24)
│ ├── NSG: nsg-db
│ └── VM: db-vm-1 (internal only)
│
└── AzureBastionSubnet (10.0.255.0/27)
└── Azure Bastion Host (secure RDP/SSH access)

Resource Group  
|  
+-- Virtual Network (10.0.0.0/16)  
|   +-- Web Subnet (10.0.1.0/24)  
|   +-- App Subnet (10.0.2.0/24)  
|   +-- DB Subnet (10.0.3.0/24)  
|  
+-- NSGs applied to each subnet  
+-- Load Balancer (Frontend IP)  
+-- VMs in Web Subnet (public)  
+-- VMs in App/DB Subnets (private)  
+-- Bastion Host for secure access  

 Key Features

- Create and manage Azure resources using CLI
- Design a 3-tier subnet structure: Web, App, DB
- Network Security Groups for access control
- Load Balancer for distributing web traffic
- Azure Bastion for secure VM access (no public IPs)
- Scripts for automated setup

 Technologies & Services Used

- Microsoft Azure
- Azure CLI
- Azure Virtual Network
- Azure Bastion
- Load Balancer
- Network Security Groups
- Linux/Windows VMs
- Git & GitHub

Project Structure
azure-vnet-project/
│
├── scripts/
│ ├── 1-create-resource-group.sh
│ ├── 2-create-vnet-subnets.sh
│ ├── 3-deploy-nsgs.sh
│ ├── 4-deploy-vms.sh
│ ├── 5-configure-bastion.sh
│ └── 6-setup-load-balancer.sh
│
├── architecture-diagram.png
└── README.md

Screenshots





Author
Pranav Tripathi
GitHub: @Pranav8174
Aspiring Cloud Engineer | Azure Enthusiast




