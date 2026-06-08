# Day 10 — Azure VM Scale Sets, Snapshots & Load Balancer Lab

**Date:** June 08, 2026
**Topic:** Azure VM Scale Sets (VMSS), Snapshots, Load Balancers & Web Server High Availability
**Lab Environment:** Microsoft Azure Virtual Machines (Ubuntu Linux), Azure Load Balancer, Public IP, SSH Access

---

# What I Learned Today

Today I learned how Azure provides scalability and high availability for applications using Virtual Machine Scale Sets (VMSS) and Azure Load Balancers.

I explored the difference between horizontal scaling and vertical scaling, generated artificial CPU load using the Linux stress utility, learned how Azure Snapshots protect VM disks, and deployed a simple web application across multiple virtual machines behind a load balancer.

The lab demonstrated how production systems remain available even when individual virtual machines are not directly exposed to the internet.

---

# VM Scale Sets (VMSS)

A Virtual Machine Scale Set (VMSS) is an Azure service that allows multiple identical virtual machines to be deployed and managed as a single resource.

VMSS can automatically increase or decrease the number of VM instances based on demand, helping applications handle traffic spikes while maintaining availability.

## Scaling Comparison

| Feature       | Horizontal Scaling        | Vertical Scaling                  |
| ------------- | ------------------------- | --------------------------------- |
| What changes  | Number of VMs             | Size of a VM                      |
| VMSS support  | Yes, native and automatic | No, manual only                   |
| Downtime      | None                      | Usually requires reboot           |
| Limit         | Thousands of VM instances | Maximum VM size available         |
| Cost model    | Pay per VM instance       | Pay for larger VM                 |
| Best use case | High traffic applications | Memory or CPU intensive workloads |

> Horizontal scaling is generally preferred for cloud-native applications because it improves availability and fault tolerance.

---

# SSH Login Using Key Authentication

SSH key authentication is more secure than password-based authentication because private keys are significantly harder to brute force.

```bash
ssh -i <private-key.pem> username@ip-address
```

Example:

```bash
ssh -i mykey.pem azureuser@20.244.xx.xx
```

Why this command is used:

* `-i` specifies the private key file.
* Eliminates the need for password authentication.
* Recommended security practice for cloud environments.

---

# Generating CPU Load

To demonstrate scaling and monitoring, CPU load was artificially generated.

```bash
sudo stress --cpu 10 --timeout 420 &
```

Explanation:

| Parameter     | Purpose                          |
| ------------- | -------------------------------- |
| stress        | Generates artificial system load |
| --cpu 10      | Creates 10 CPU workers           |
| --timeout 420 | Runs for 420 seconds             |
| &             | Runs process in background       |

Real command used:

```bash
sudo stress --cpu 10 --timeout 420 &
```

Why it was used:

* Simulates high CPU utilization.
* Helps test monitoring and scaling behavior.
* Useful for VMSS auto-scale demonstrations.

---

# Azure Snapshots

Snapshots create point-in-time copies of Azure managed disks.

They are commonly used for:

* Backup
* Disaster recovery
* Migration
* Testing

## Snapshot Types

| Type                 | Description                |
| -------------------- | -------------------------- |
| Full Snapshot        | Complete copy of disk      |
| Incremental Snapshot | Stores only changed blocks |

## Comparison

| Feature       | Full Snapshot | Incremental Snapshot |
| ------------- | ------------- | -------------------- |
| Storage Usage | High          | Lower                |
| Backup Speed  | Slower        | Faster               |
| Cost          | Higher        | Lower                |
| Recovery      | Independent   | Depends on chain     |

## Snapshot Creation Process

1. Open Azure Portal.
2. Navigate to Virtual Machine.
3. Open Disks.
4. Select OS or Data Disk.
5. Click Create Snapshot.
6. Choose Full or Incremental.
7. Review and Create.

> Snapshots are disk-level backups, not complete VM backups.

---

# Azure Load Balancer

Azure Load Balancer distributes incoming network traffic across multiple backend virtual machines.

Its primary purpose is:

* High Availability
* Fault Tolerance
* Better Performance
* Traffic Distribution

---

# Types of Azure Load Balancers

| Type                  | Purpose                      |
| --------------------- | ---------------------------- |
| Public Load Balancer  | Internet-facing applications |
| Private Load Balancer | Internal applications        |
| Gateway Load Balancer | Network Virtual Appliances   |

---

# Important Components

## Frontend IP

Receives client traffic.

Can be:

* Public IP
* Private IP

## Backend Pool

Contains the virtual machines that receive traffic.

Example:

* VM1
* VM2

## Health Probe

Checks whether backend servers are healthy.

Common probes:

* HTTP
* HTTPS
* TCP

If a VM fails health checks, traffic is automatically redirected to healthy VMs.

## Inbound Rules

Control incoming traffic.

Example:

| Port | Service |
| ---- | ------- |
| 80   | HTTP    |
| 443  | HTTPS   |
| 22   | SSH     |

## Outbound Rules

Control outbound internet access for backend VMs.

---

# High Availability Web Server Lab

## Step 1 – Create Two Virtual Machines

Created:

* VM1
* VM2

Both running Ubuntu Linux.

---

## Step 2 – Install Apache Web Server

```bash
sudo apt update && sudo apt upgrade -y
```

Updates package metadata and installs available updates.

```bash
sudo apt install apache2 -y
```

Installs Apache Web Server.

```bash
sudo systemctl status apache2
```

Verifies Apache service status.

---

## Step 3 – Host a Website

Default website file:

```bash
/var/www/html/index.html
```

Modified the content on each VM.

Example:

VM1:

```html
<h1>Welcome from VM1</h1>
```

VM2:

```html
<h1>Welcome from VM2</h1>
```

---

## Step 4 – Verify Website Access

Opened both public IP addresses and confirmed:

* VM1 website accessible.
* VM2 website accessible.

---

## Step 5 – Remove Public IPs

After validation:

1. Open VM.
2. Navigate to Networking.
3. Select Public IP.
4. Click Dissociate.

This prevents direct internet access to individual servers.

---

## Step 6 – Create Public IP for Load Balancer

Created:

* New Public IP resource

Used as frontend endpoint for the load balancer.

---

## Step 7 – Create Standard Load Balancer

Selected:

* Standard Load Balancer

Configured:

### Frontend IP

Added newly created Public IP.

### Backend Pool

Added:

* VM1
* VM2

### Health Probe

Configured HTTP probe.

### Load Balancing Rule

Enabled:

* Port 80 (HTTP)

Traffic is now distributed between both backend servers.

---

# Architecture

```text
                Internet
                    |
                    |
          Public Load Balancer
                    |
          ---------------------
          |                   |
          |                   |
        VM1                 VM2
   Apache Web          Apache Web
```

---

# Command Reference

| Command                              | Purpose               |
| ------------------------------------ | --------------------- |
| ssh -i key.pem user@ip               | Connect using SSH key |
| sudo stress --cpu 10 --timeout 420 & | Generate CPU load     |
| sudo apt update                      | Update package index  |
| sudo apt upgrade -y                  | Upgrade packages      |
| sudo apt install apache2 -y          | Install Apache        |
| sudo systemctl status apache2        | Verify Apache status  |

---

# Quick Revision

| Topic              | Key Point                    |
| ------------------ | ---------------------------- |
| VMSS               | Automatic horizontal scaling |
| Horizontal Scaling | Add more VMs                 |
| Vertical Scaling   | Increase VM size             |
| Snapshot           | Point-in-time disk copy      |
| Backend Pool       | Group of VMs                 |
| Health Probe       | Checks VM health             |
| Load Balancer      | Distributes traffic          |
| Frontend IP        | Entry point for clients      |

---

# Interview / Viva Questions

## ⭐ What is VMSS?

A VMSS is an Azure service that manages a group of identical virtual machines and supports automatic horizontal scaling.

---

## ⭐ Difference between horizontal and vertical scaling?

Horizontal scaling increases the number of VMs.

Vertical scaling increases the size or power of a VM.

---

## ⭐ What is a Health Probe?

A monitoring mechanism used by a load balancer to determine whether backend servers are healthy.

---

## ⭐ Why remove public IPs from backend VMs?

To improve security and force all traffic through the load balancer.

---

## ⭐ What is the difference between Full and Incremental Snapshots?

Full snapshots store the complete disk.

Incremental snapshots store only changed blocks.

---

# Key Takeaway

Modern cloud applications achieve scalability and high availability by combining VM Scale Sets, Load Balancers, and snapshots. Instead of making a single server larger, cloud platforms typically add more servers and distribute traffic intelligently, improving both performance and resilience.

---

# What's Next

* Azure Availability Sets
* Azure Virtual Networks (VNet)
* Network Security Groups (NSG)
* Azure Application Gateway
* Azure Monitoring and Autoscaling
