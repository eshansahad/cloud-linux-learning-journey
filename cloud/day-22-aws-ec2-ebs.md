# Day 22 — AWS EC2 Administration & EBS Snapshots

**Date:** July 02, 2026

---

# Overview

Today's session focused on Amazon Elastic Compute Cloud (EC2) administration and Amazon Elastic Block Store (EBS). The lab covered provisioning Linux and Windows virtual machines, securely connecting using multiple AWS-supported methods, configuring security groups, creating EBS snapshots, restoring storage volumes, and attaching additional disks to running instances.

These exercises introduced fundamental AWS compute and storage administration skills required for deploying and maintaining cloud infrastructure.

---

# Topics Covered

- Amazon EC2 Fundamentals
- Launching Linux EC2 Instances
- Launching Windows Server EC2 Instances
- SSH Connectivity
- Remote Desktop Protocol (RDP)
- EC2 Instance Connect
- AWS Systems Manager (SSM) Session Manager
- EC2 Serial Console
- Security Groups
- User Data Scripts
- Amazon Elastic Block Store (EBS)
- EBS Snapshots
- Creating Volumes from Snapshots
- Attaching Secondary Storage Volumes
- Linux Block Device Verification

---

# Practical Labs

## Lab 1 — EC2 Administration

### Linux Instance

- Created Amazon Linux 2023 EC2 instance
- Selected Free Tier instance
- Generated RSA key pair
- Configured Security Group
- Allowed SSH only from personal IP
- Connected successfully using SSH

### Windows Instance

- Created Windows Server 2022 instance
- Generated Windows key pair
- Allowed RDP traffic
- Retrieved Administrator password
- Connected using Remote Desktop

### Additional Connection Methods

Explored multiple AWS administrative access methods:

- EC2 Instance Connect
- AWS Systems Manager Session Manager
- EC2 Serial Console

These methods provide secure alternatives to traditional SSH and RDP connectivity.

---

## Security Groups

Configured inbound firewall rules.

Linux Server

- SSH (22)
- Allowed only personal public IP

Windows Server

- RDP (3389)
- Allowed only personal public IP

This demonstrates the Principle of Least Privilege.

---

# Lab 2 — Amazon EBS Snapshots

## Snapshot Creation

Created a snapshot of the EC2 root volume.

Steps performed

- Located root EBS volume
- Created snapshot
- Waited until status changed to Completed

---

## Restoring Storage

Created a new EBS volume using the snapshot.

Configured

- GP3 Storage
- Same Availability Zone
- Same Volume Size

---

## Attaching Additional Volume

Attached the restored volume to the existing EC2 instance.

Verified

- Volume state changed to In-use

---

## Linux Verification

Connected to the instance.

Executed

```bash
lsblk
```

Verified

- Root disk
- Newly attached secondary volume

The operating system successfully detected the restored storage device.

---

# Commands Practiced

SSH

```bash
ssh -i "key.pem" ec2-user@public-ip
```

Linux Disk Verification

```bash
lsblk
```

---

# AWS Services Used

- Amazon EC2
- Amazon EBS
- Security Groups
- EC2 Instance Connect
- Systems Manager Session Manager
- EC2 Serial Console
- SSH
- Remote Desktop

---

# Skills Learned

- Provisioning Linux EC2 instances
- Provisioning Windows EC2 instances
- Secure remote administration
- SSH authentication
- Windows RDP access
- Managing Security Groups
- Creating EBS snapshots
- Restoring storage volumes
- Attaching additional disks
- Verifying Linux storage devices

---

# Key Takeaways

- EC2 provides flexible virtual machine deployment for Linux and Windows workloads.
- Security Groups act as instance-level virtual firewalls.
- SSH and RDP remain the primary administration methods, while Session Manager and EC2 Instance Connect improve operational security.
- EBS Snapshots provide reliable point-in-time backups.
- Volumes restored from snapshots can quickly recover data or expand storage.

---

# Lab Environment

| Component | Details |
|------------|---------|
| Cloud Provider | AWS |
| Compute | Amazon EC2 |
| Storage | Amazon EBS |
| Operating Systems | Amazon Linux 2023, Windows Server 2022 |
| Access Methods | SSH, RDP, EC2 Instance Connect, Session Manager |
| Storage Type | GP3 SSD |
| Region | AWS Region (Lab) |

---

# Outcome

Successfully deployed and administered Linux and Windows EC2 instances, secured remote access using AWS best practices, created EBS snapshots, restored storage volumes, attached additional disks, and verified storage recognition within the operating system.