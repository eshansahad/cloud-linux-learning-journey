# Day 24 — AWS Elastic File System (EFS) Administration

**Date:** July 06, 2026

---

# Overview

Today's session focused on Amazon Elastic File System (EFS), AWS's fully managed, scalable Network File System (NFS) service. The lab covered creating an EFS file system, configuring mount targets, securing network access using Security Groups, mounting the shared file system on multiple Linux EC2 instances, and verifying shared file access across servers.

Amazon EFS enables multiple EC2 instances to simultaneously access the same storage, making it ideal for shared application data, content management systems, analytics workloads, and highly available web applications.

---

# Topics Covered

- Amazon Elastic File System (EFS)
- Shared Network File Storage
- NFS (Network File System)
- Mount Targets
- Availability Zones
- Security Groups
- EC2 Linux Instances
- Amazon Linux 2023
- File Sharing
- Persistent Storage
- High Availability
- Shared File Access

---

# Practical Lab

## Lab 1 — Create an Amazon EFS File System

Created a new Elastic File System from the AWS Management Console.

### Configuration

- File System Name
- Regional Storage
- Standard Storage Class
- Default Performance Mode
- Automatic Backup Settings
- Encryption Configuration

---

# Lab 2 — Configure Mount Targets

Created mount targets for the VPC.

Configured

- Default VPC
- Multiple Availability Zones
- Mount Target IP Addresses

Mount Targets allow EC2 instances within the VPC to communicate with the EFS file system.

---

# Lab 3 — Configure Security Groups

Configured a dedicated Security Group for EFS.

Inbound Rule

- NFS
- Port 2049
- Source: EC2 Security Group

This ensures only authorized EC2 instances can access the shared file system.

---

# Lab 4 — Connect Linux EC2 Instance

Connected to the Linux server using SSH.

Updated system packages.

Installed the Amazon EFS utilities.

```bash
sudo yum update -y

sudo yum install amazon-efs-utils -y
```

---

# Lab 5 — Create Mount Directory

Created a local directory to mount the shared storage.

```bash
sudo mkdir /mnt/efs-share
```

---

# Lab 6 — Mount Amazon EFS

Mounted the EFS file system.

```bash
sudo mount -t efs fs-xxxxxxxx:/ /mnt/efs-share
```

Verified the mount.

```bash
df -h
```

---

# Lab 7 — Verify Shared Storage

Created a sample text file inside the mounted EFS directory.

```bash
cd /mnt/efs-share

echo "Hello AWS EFS" > sample.txt
```

Mounted the same EFS file system on another EC2 instance.

Verified the file appeared immediately without copying data between servers.

This confirmed that both EC2 instances were accessing the same shared storage.

---

# Commands Practiced

Update Packages

```bash
sudo yum update -y
```

Install EFS Utilities

```bash
sudo yum install amazon-efs-utils -y
```

Create Mount Directory

```bash
sudo mkdir /mnt/efs-share
```

Mount File System

```bash
sudo mount -t efs fs-xxxxxxxx:/ /mnt/efs-share
```

Verify Mounted Storage

```bash
df -h
```

List Files

```bash
ls
```

---

# AWS Services Used

- Amazon Elastic File System (EFS)
- Amazon EC2
- Security Groups
- Amazon VPC
- Mount Targets
- NFS

---

# Skills Learned

- Creating an Amazon EFS file system
- Configuring mount targets
- Managing EFS security
- Installing Amazon EFS utilities
- Mounting network file systems
- Sharing files across EC2 instances
- Verifying persistent shared storage
- Understanding NFS-based cloud storage

---

# Key Takeaways

- Amazon EFS provides scalable shared storage for Linux workloads.
- Multiple EC2 instances can simultaneously access the same file system.
- Mount Targets enable secure communication within a VPC.
- NFS protocol (Port 2049) is used for EFS connectivity.
- Data stored in EFS persists independently of EC2 instances.
- EFS automatically scales as storage usage increases.
- Shared storage simplifies highly available and distributed application architectures.

---

# Lab Environment

| Component | Details |
|------------|---------|
| Cloud Provider | AWS |
| Storage Service | Amazon Elastic File System (EFS) |
| Compute | Amazon EC2 |
| Operating System | Amazon Linux 2023 |
| File Sharing Protocol | NFS v4.1 |
| Network | Amazon VPC |
| Access Method | SSH |
| Mount Utility | amazon-efs-utils |

---

# Outcome

Successfully deployed an Amazon Elastic File System, configured mount targets and security groups, mounted the shared file system on Linux EC2 instances, and verified persistent shared storage by accessing the same files from multiple servers.