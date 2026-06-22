# Day 15 – Azure CLI Virtual Machine Administration Lab

**Date:** June 22, 2026

## Objective

Learn how to create and manage Azure Virtual Machines using Azure CLI, configure networking components, verify VM status, and establish secure remote access.

---

## Azure CLI Virtual Machine Administration

Azure CLI provides a command-line interface for creating and managing Azure resources efficiently through scripts and automation.

### Topics Covered

* Azure CLI Fundamentals
* Resource Groups
* Virtual Networks (VNet)
* Subnets
* Linux Virtual Machines
* SSH Authentication
* Network Security Groups (NSG)
* Public IP Addresses
* VM Status Verification
* SSH Connectivity

---

## Task 1 – Create Resource Group and Virtual Network

### Create Resource Group

```bash
az group create \
  --name RG-CLILab \
  --location southindia
```

### Create Virtual Network and Subnet

```bash
az network vnet create \
  --resource-group RG-CLILab \
  --name VNet-CLI \
  --address-prefix 10.5.0.0/16 \
  --subnet-name Subnet-CLI \
  --subnet-prefix 10.5.0.0/24
```

### Purpose

* Resource Group organizes Azure resources.
* Virtual Network provides network isolation.
* Subnet divides the VNet into smaller network segments.

---

## Task 2 – Create Linux Virtual Machine

### Create Ubuntu VM

```bash
az vm create \
  --resource-group RG-CLILab \
  --name cli-linux-vm \
  --image Ubuntu2204 \
  --vnet-name VNet-CLI \
  --subnet Subnet-CLI \
  --admin-username azureuser \
  --generate-ssh-keys \
  --size Standard_B1s
```

### Key Parameters

| Parameter           | Description                        |
| ------------------- | ---------------------------------- |
| --image             | Ubuntu 22.04 LTS                   |
| --admin-username    | VM administrator account           |
| --generate-ssh-keys | Creates SSH key pair automatically |
| --size              | VM size specification              |

### Benefits

* Secure SSH-based authentication
* Fast VM deployment
* Integrated networking configuration

---

## Task 3 – Configure Network Security Group

### Allow SSH Access

```bash
az network nsg rule create \
  --resource-group RG-CLILab \
  --nsg-name cli-linux-vmNSG \
  --name Allow-SSH-Inbound \
  --protocol tcp \
  --priority 1000 \
  --destination-port-range 22 \
  --access allow
```

### Purpose

Network Security Groups act as virtual firewalls and control inbound and outbound traffic.

### Common Ports

| Port | Protocol | Purpose               |
| ---- | -------- | --------------------- |
| 22   | SSH      | Linux Remote Access   |
| 80   | HTTP     | Web Traffic           |
| 443  | HTTPS    | Secure Web Traffic    |
| 3389 | RDP      | Windows Remote Access |

---

## Task 4 – Manage VM User Credentials

### Set Password for Existing User

```bash
az vm user update \
  --resource-group RG-CLILab \
  --name cli-linux-vm \
  --username azureuser \
  --password 'MyStrongPassword@123'
```

### Note

Use strong passwords that include:

* Uppercase letters
* Lowercase letters
* Numbers
* Special characters

---

## Task 5 – Verify VM Status

### Check VM State and Public IP

```bash
az vm show \
  --resource-group RG-CLILab \
  --name cli-linux-vm \
  --show-details \
  --query "[powerState, publicIps]" \
  --output tsv
```

### Expected Output

```text
VM running
20.xxx.xxx.xxx
```

### Verification

Ensure:

* VM state shows **VM running**
* Public IP address is displayed

---

## Task 6 – Connect to the Virtual Machine

### SSH Connection

```bash
ssh azureuser@<public-ip-address>
```

Example:

```bash
ssh azureuser@20.235.xxx.xxx
```

### First-Time Connection

When prompted:

```text
Are you sure you want to continue connecting (yes/no)?
```

Type:

```text
yes
```

### Successful Login

```bash
azureuser@cli-linux-vm:~$
```

This confirms that the SSH session has been established successfully.

---

## Azure CLI Commands Learned

### Resource Groups

```bash
az group create
az group list
az group delete
```

### Virtual Machines

```bash
az vm create
az vm show
az vm list
az vm start
az vm stop
az vm restart
az vm delete
```

### Networking

```bash
az network vnet create
az network nsg rule create
```

---

## Architecture

```text
Resource Group
      │
      ▼
Virtual Network
      │
      ▼
Subnet
      │
      ▼
Linux Virtual Machine
      │
      ▼
Network Security Group
      │
      ▼
Public IP Address
      │
      ▼
SSH Connection
```

---

## Key Learning Outcomes

* Created Azure resources using Azure CLI
* Configured Virtual Network and Subnet
* Deployed Ubuntu Linux Virtual Machine
* Managed SSH authentication
* Configured Network Security Group rules
* Verified VM operational status
* Connected securely using SSH

---

## Summary

In this lab, I learned how to deploy and manage Azure Virtual Machines using Azure CLI. I created a Resource Group, Virtual Network, Subnet, and Ubuntu Linux VM, configured SSH access through Network Security Groups, verified the VM status, and successfully established a secure SSH connection. This hands-on exercise provided practical experience with Azure infrastructure provisioning and command-line administration.

---
