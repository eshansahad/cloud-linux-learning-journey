# Day 27 — Amazon DocumentDB & Apache Web Server Administration

**Date:** July 09, 2026

---

# Overview

Today's session focused on two important areas of cloud administration:

1. **Amazon DocumentDB**, AWS's fully managed NoSQL document database service compatible with MongoDB.
2. **Apache HTTP Server Administration**, including installation, website deployment, shared storage integration using Amazon EFS, and Linux web server management.

These labs introduced both NoSQL database administration and Linux-based web hosting, providing hands-on experience with backend infrastructure commonly used in modern cloud-native applications.

---

# Topics Covered

## Amazon DocumentDB

- Amazon DocumentDB
- NoSQL Databases
- MongoDB Compatibility
- Collections
- JSON Documents
- CRUD Operations
- mongosh
- EC2 Jump Host
- TLS Encryption
- Security Groups

## Apache HTTP Server

- Apache HTTP Server
- Website Deployment
- Virtual Host Basics
- HTML Website Hosting
- Amazon Linux
- Shared Storage using Amazon EFS
- Linux Service Management
- Troubleshooting Web Servers

---

# Practical Lab 1 — Amazon DocumentDB

## Create DocumentDB Cluster

Provisioned a new Amazon DocumentDB cluster.

Configuration included

- Development Template
- Single Instance Deployment
- Default VPC
- Security Group
- Cluster Endpoint
- Administrator Credentials

---

## Configure Networking

Configured secure connectivity.

- Default VPC
- Private Networking
- Security Group
- MongoDB Port 27017

Since Amazon DocumentDB does not provide public endpoints, an EC2 instance inside the same VPC was used as a jump server.

---

## Install MongoDB Shell

Connected to the EC2 instance.

Installed the MongoDB Shell.

Downloaded the AWS TLS certificate bundle required for encrypted communication.

---

## Connect to DocumentDB

Established a secure connection.

```bash
mongosh \
--ssl \
--host <cluster-endpoint>:27017 \
--sslCAFile global-bundle.pem \
--username <username> \
--password
```

Verified successful authentication.

---

## Create Database

Created a new database.

```javascript
use SmartCampusDB
```

---

## Create Collection

```javascript
db.createCollection("OccupancyLogs")
```

---

## Insert Documents

Inserted multiple JSON documents.

```javascript
db.OccupancyLogs.insertMany([
{
Building:"Engineering Block",
Room:"CS-101"
}
])
```

---

## Query Documents

Retrieved all records.

```javascript
db.OccupancyLogs.find().pretty()
```

Executed filtered queries to retrieve specific documents.

---

## Update Documents

Updated existing records.

```javascript
db.OccupancyLogs.updateOne()
```

---

## Delete Documents

Deleted selected documents.

```javascript
db.OccupancyLogs.deleteOne()
```

---

# Practical Lab 2 — Apache HTTP Server Administration

## Install Apache

Installed Apache HTTP Server.

```bash
sudo yum install httpd -y
```

Enabled the service.

```bash
sudo systemctl enable httpd
```

Started Apache.

```bash
sudo systemctl start httpd
```

Verified service status.

```bash
sudo systemctl status httpd
```

---

## Deploy Website

Copied website files into

```
/var/www/html
```

Configured

- HTML
- CSS
- Images
- JavaScript

---

## Configure Shared Storage

Mounted Amazon EFS.

Hosted website content directly from shared storage.

Verified that multiple EC2 instances could access identical website files.

---

## Test Website

Accessed the website using

```
http://<Elastic-IP>
```

Verified

- Homepage
- Images
- CSS
- Navigation
- Responsive Layout

---

# Troubleshooting Performed

During deployment several issues were encountered and resolved.

### Apache Service

Verified Apache service status.

```bash
sudo systemctl status httpd
```

---

### Firewall Rules

Verified HTTP (Port 80) was allowed in the EC2 Security Group.

---

### Website Permissions

Checked permissions inside

```
/var/www/html
```

Ensured Apache could access all website files.

---

### EFS Mount Verification

Verified successful EFS mounting.

```bash
df -h
```

---

### Website Availability

Confirmed successful access from the browser using the EC2 Elastic IP.

---

# Commands Practiced

Apache Installation

```bash
sudo yum install httpd -y
```

Enable Apache

```bash
sudo systemctl enable httpd
```

Start Apache

```bash
sudo systemctl start httpd
```

Check Apache Status

```bash
sudo systemctl status httpd
```

Mount Verification

```bash
df -h
```

MongoDB Shell

```bash
mongosh
```

---

# AWS Services Used

- Amazon DocumentDB
- Amazon EC2
- Amazon EFS
- Security Groups
- Amazon VPC

---

# Linux Services Used

- Apache HTTP Server
- systemctl
- Bash
- SSH

---

# Skills Learned

- Deploying Amazon DocumentDB clusters
- Connecting securely using mongosh
- Managing NoSQL databases
- Performing CRUD operations
- Installing Apache HTTP Server
- Managing Linux services
- Hosting websites on Amazon Linux
- Integrating Apache with Amazon EFS
- Troubleshooting web server deployments

---

# Key Takeaways

- Amazon DocumentDB provides a managed MongoDB-compatible NoSQL database service.
- EC2 jump servers enable secure access to private DocumentDB clusters.
- CRUD operations in NoSQL databases revolve around JSON documents and collections.
- Apache remains one of the most widely used Linux web servers.
- Hosting website files on Amazon EFS enables multiple web servers to share identical content.
- Proper service management and security group configuration are essential for successful web hosting.

---

# Lab Environment

| Component | Details |
|------------|---------|
| Cloud Provider | AWS |
| Database | Amazon DocumentDB |
| Database Shell | mongosh |
| Web Server | Apache HTTP Server |
| Operating System | Amazon Linux 2023 |
| Shared Storage | Amazon EFS |
| Access Method | SSH |
| Database Port | 27017 |
| Web Port | 80 |

---

# Outcome

Successfully deployed an Amazon DocumentDB cluster, connected securely using the MongoDB Shell, performed CRUD operations on NoSQL collections, installed and configured Apache HTTP Server, hosted a website on Amazon Linux, integrated shared storage using Amazon EFS, and verified successful website accessibility through a web browser.