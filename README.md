#  Cloud & Linux Learning Journey

> **Learning in public** — documenting my step-by-step journey through Linux, cloud concepts, and hands-on practice.

---

##  About This Repo

This repository is my personal learning log as I work through Linux fundamentals and cloud technologies from scratch — on a real AWS EC2 server running Red Hat Linux.

Every session is documented as a structured notes file under the relevant topic folder. No polish faking — just honest, consistent progress.

---

##  Progress Log

| Day    | Date         | Topic                                              | Notes                                                    |
|--------|--------------|----------------------------------------------------|----------------------------------------------------------|
| Day 01 | May 14, 2026 | Linux Basics                                       | [View →](./linux/day-01-basics.md)                       |
| Day 02 | May 15, 2026 | File Management, Links & I/O Redirection           | [View →](./linux/day-02-file-management.md)              |
| Day 03 | May 18, 2026 | User Management, Groups & SSH                      | [View →](./linux/day-03-users-groups-ssh.md)             |
| Day 04 | May 19, 2026 | SSH Deep Dive & File Permissions                   | [View →](./linux/day-04-ssh-permissions.md)              |
| Day 05 | May 20, 2026 | Special Permissions, umask & Apache Server         | [View →](./linux/day-05-permissions-apache.md)           |
| Day 06 | May 21, 2026 | WordPress on LAMP Stack (Full Deployment)          | [View →](./linux/day-06-wordpress-lamp.md)               |
| Day 07 | May 25, 2026 | Job Scheduling (at & cron) & Disk Management       | [View →](./linux/day-07-scheduling-disk.md)              |
| Day 08 | May 26, 2026 | Storage Partitioning & Process Management          | [View →](./linux/day-08-storage-processes.md)            |
| Day 09 | May 27, 2026 | Linux Administration Lab — File Ops, Users, Permissions, Services, Apache, Bash & Cron | [View →](./linux/day-09-linux-admin-lab.md) |
| Day 10 | Jun 08, 2026 | Azure VMSS, Snapshots & Load Balancer Lab          | [View →](./cloud/day-10-azure-vmss-load-balancer.md)     |
| Day 11 | Jun 10, 2026 | Azure VMSS Autoscaling Lab                         | [View →](./cloud/day-11-vmss-autoscaling-lab.md)         |
| Day 12 | Jun 16, 2026 | Azure Storage Services & File Share Lab            | [View →](./cloud/day-12-azure-storage-services.md)       |
| Day 13 | Jun 18, 2026 | Azure App Service, Function App & Logic Apps       | [View →](./cloud/day-13-app-service-function-logic-apps.md) |
| Day 14 | Jun 19, 2026 | Azure Application Hosting Services                 | [View →](./cloud/day-14-azure-application-hosting-services.md) |
| Day 15 | Jun 22, 2026 | Azure CLI Virtual Machine Administration Lab       | [View →](./cloud/day-15-azure-cli-vm-lab.md)             |

> More sessions will be added as I progress.

---

##  Repo Structure

```
cloud-linux-learning-journey/
├── README.md                            ← You are here
├── linux/
│   ├── day-01-basics.md                 ← Core commands, users, file ops
│   ├── day-02-file-management.md        ← cp, mv, rm, links, I/O, grep, pipes
│   ├── day-03-users-groups-ssh.md       ← useradd, groups, sudo, SSH keygen
│   ├── day-04-ssh-permissions.md        ← SSH deep dive, chmod, chown
│   ├── day-05-permissions-apache.md     ← SUID, SGID, sticky bit, umask, Apache
│   ├── day-06-wordpress-lamp.md         ← Full LAMP stack + WordPress deployment
│   ├── day-07-scheduling-disk.md        ← at, cron, df, du, lsblk, partitioning
│   ├── day-08-storage-processes.md      ← fdisk, fstab, ps, kill, top, nice, jobs
│   ├── day-09-linux-admin-lab.md        ← Consolidation lab: file ops, users, chmod, systemctl, Apache, bash scripts
│   └── assets/                          ← Screenshots from lab sessions
├── cloud/
│   ├── day-10-azure-vmss-load-balancer.md ← VMSS, snapshots, load balancer & HA web lab
|   ├── day-10-vmss-autoscaling-lab.md   ← VMSS creation, autoscaling, stress testing                            
|   ├── day-11-vmss-autoscaling-lab.md   ← VMSS creation, autoscaling, stress testing       
|   └── day-12-azure-storage-services.md ← Azure storage services and file share lab
│   ├── day-13-app-service-function-logic-apps.md ← Azure App Service, Function App & Logic Apps
│   ├── day-14-azure-application-hosting-services.md ← Azure Application Hosting Services
|   ├── day-15-azure-cli-vm-lab.md       ← Azure CLI VM creation, networking, NSG, SSH access
|   └── assets/                          ← Screenshots from lab sessions
└── projects/
    └── ssh-security-checker/            ← SSH security auditing project
    └── wordpress-lab-report/            ← Install and configure wordpress
```

---


---

## Projects

### SSH Security Checker
A hands-on Linux security project that audits SSH configurations and checks for common security weaknesses.

**Features**
- Verifies SSH service status
- Reviews SSH configuration settings
- Checks root login configuration
- Audits password authentication settings
- Helps identify security hardening opportunities

**Skills Practiced**
- Linux Administration
- SSH Security
- Bash Scripting
- System Auditing
- DevSecOps Fundamentals


##  Lab Environment

| Component      | Details              |
|----------------|----------------------|
| Cloud Provider | AWS EC2              |
| OS             | Red Hat Linux        |
| Access Method  | SSH from Windows CMD |
| Shell          | Bash                 |

---

##  Learning Roadmap

- [x] Linux Basics — commands, users, file operations
- [x] File Management — cp, mv, rm, hard/soft links, I/O redirection, grep, pipes
- [x] User & Group Management — useradd, passwd, sudo, SSH key authentication
- [x] SSH Deep Dive & File Permissions — sshd_config, root login, chmod, chown
- [x] Special Permissions & Apache — SUID, SGID, sticky bit, umask, httpd
- [x] WordPress LAMP Deployment — Apache, PHP 8.3, MariaDB, WordPress, SELinux, backups
- [x] Job Scheduling & Disk Management — at, cron, df, du, lsblk, fdisk, fstab
- [x] Storage Partitioning & Process Management — fdisk, fstab, ps, kill signals, top, nice
- [x] Linux Administration Lab — file ops, user/group mgmt, chmod, systemctl, Apache, bash scripting, cron
- [ ] LVM — Logical Volume Manager
- [ ] Networking — `ip`, `ss`, `ping`, `curl`, `nmcli`
- [ ] Shell Scripting — `.sh` files, variables, loops, conditionals
- [x] SSH Security Checker — Bash-based SSH security auditing project
- [ ] AWS Core Services — EC2, S3, IAM, VPC
- [x] Azure VMSS, Snapshots & Load Balancer Lab
- [x] Azure VM Scale Sets (VMSS) & Autoscaling
- [x] Azure Monitoring & CPU-Based Scaling Rules
- [x] Azure Load Testing with Stress Utility
- [x] Azure Fundamentals — ARM, RBAC, IAM, Scopes, Microsoft Entra ID
- [ ] Cloud Architecture — real-world project
### Azure Storage & Data Services
- [x] Storage Accounts, Blobs & File Shares
- [x] Storage Explorer
- [x] Storage Migration Tools
- [x] Azure Database Fundamentals
### Azure Application Services
- [x] Azure App Service
- [x] Azure Function App
- [x] Azure Logic Apps
- [x] Serverless Computing Basics
- [x] Workflow Automation with Azure Pipelines
##  Learning Roadmap

- [x] Linux Basics — commands, users, file operations
- [x] File Management — cp, mv, rm, hard/soft links, I/O redirection, grep, pipes
- [x] User & Group Management — useradd, passwd, sudo, SSH key authentication
- [x] SSH Deep Dive & File Permissions — sshd_config, root login, chmod, chown
- [x] Special Permissions & Apache — SUID, SGID, sticky bit, umask, httpd
- [x] WordPress LAMP Deployment — Apache, PHP 8.3, MariaDB, WordPress, SELinux, backups
- [x] Job Scheduling & Disk Management — at, cron, df, du, lsblk, fdisk, fstab
- [x] Storage Partitioning & Process Management — fdisk, fstab, ps, kill signals, top, nice
- [x] Linux Administration Lab — file ops, user/group mgmt, chmod, systemctl, Apache, bash scripting, cron
- [ ] LVM — Logical Volume Manager
- [x] Networking — `ip`, `ss`, `ping`, `curl`, `nmcli`
- [ ] Shell Scripting — `.sh` files, variables, loops, conditionals
- [x] SSH Security Checker — Bash-based SSH security auditing project
- [ ] AWS Core Services — EC2, S3, IAM, VPC
- [x] Azure VMSS, Snapshots & Load Balancer Lab
- [x] Azure VM Scale Sets (VMSS) & Autoscaling
- [x] Azure Monitoring & CPU-Based Scaling Rules
- [x] Azure Load Testing with Stress Utility
- [x] Azure Fundamentals — ARM, RBAC, IAM, Scopes, Microsoft Entra ID
- [ ] Cloud Architecture — real-world project
### Azure Storage & Data Services
- [x] Storage Accounts, Blobs & File Shares
- [x] Storage Explorer
- [x] Storage Migration Tools
- [x] Azure Database Fundamentals
### Azure Application Services
- [x] Azure App Service
- [x] Azure Function App
- [x] Azure Logic Apps
- [x] Serverless Computing Basics
- [x] Workflow Automation with Azure Pipelines
- [x] Azure CLI Fundamentals
- [x] Azure CLI Virtual Machine Deployment
- [x] Virtual Networks & Subnets using Azure CLI
- [x] Network Security Groups (NSG)
- [x] Linux VM Administration via SSH


---

##  Why I'm Doing This

Building things in public keeps me accountable. Every commit is a proof of effort — not just learning, but showing up consistently.

---

*Started: May 2026 — Updated regularly*
