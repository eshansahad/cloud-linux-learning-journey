# Day 11 — Azure Storage Services

**Date:** 16-06-2026  
**Topic:** Azure Storage Services, Storage Explorer, Storage Migration & Azure Databases  
**Lab Environment:** Microsoft Azure Portal, Azure Storage Explorer

---

# What I Learned Today

Today I learned how Azure Storage provides scalable, secure, and highly available services for storing files, objects, messages, and structured data. I explored Azure Storage Explorer for managing storage resources, learned different storage migration approaches, understood Azure Data Box and Azure Storage Mover, and studied Azure's managed database services.

The session focused on how organizations move data to Azure efficiently and how Azure provides both relational and non-relational database solutions for modern cloud applications.

---

# Azure Storage Services

Azure Storage is Microsoft's cloud storage platform that provides durable, highly available, and scalable storage services.

## Storage Services Overview

| Service | Purpose |
|----------|----------|
| Blob Storage | Store unstructured data such as images, videos, backups, and logs |
| Azure Files | Managed file shares accessible via SMB |
| Queue Storage | Message storage for asynchronous communication |
| Table Storage | NoSQL key-value data storage |

---

# Azure Storage Explorer

Azure Storage Explorer is a graphical tool used to manage Azure Storage resources.

## Features

- Connect to Azure subscriptions
- Manage Blob Containers
- Manage File Shares
- Upload and download files
- Manage Queues
- Manage Tables
- View storage account resources

## Connection Methods

| Method | Description |
|----------|----------|
| Azure Account | Sign in with Azure credentials |
| Connection String | Connect using storage account connection string |
| Shared Access Signature (SAS) | Limited delegated access |
| Storage Account Key | Full storage account access |

> Tip: Azure Storage Explorer is useful when managing storage resources without using the Azure Portal.

---

# Azure Blob Storage

Azure Blob Storage is Microsoft's object storage solution.

## Common Use Cases

- Website assets
- Images and videos
- Backup files
- Application logs
- Data archives

## Blob Types

| Blob Type | Purpose |
|------------|------------|
| Block Blob | Documents, media files, backups |
| Append Blob | Logging scenarios |
| Page Blob | Virtual machine disks |

---

# Azure File Shares

Azure File Shares provide fully managed file shares accessible through SMB.

## Benefits

- Shared storage across multiple systems
- Hybrid cloud file access
- Integration with Azure File Sync
- Centralized file management

## Common Use Cases

- Lift-and-shift file servers
- Shared application storage
- User home directories
- Backup repositories

---

# Azure Storage Migration

## What is Storage Migration?

Storage migration is the process of moving data from one storage location to another. :contentReference[oaicite:0]{index=0}

### Examples

- On-Premises File Server → Azure Files
- Local Storage → Azure Blob Storage
- AWS S3 → Azure Blob Storage
- Google Cloud Storage → Azure Storage
- One Azure Storage Account → Another Azure Storage Account

## Why Perform Storage Migration?

- Reduce infrastructure costs
- Improve scalability
- Increase availability
- Enhance disaster recovery
- Centralize data storage
- Modernize applications

## Storage Migration Process

### Step 1 – Assessment

Identify:

- Data size
- File types
- Storage requirements
- Network bandwidth

### Step 2 – Planning

Choose:

- Target storage service
- Migration method
- Migration tool

### Step 3 – Migration

Transfer data using:

- Azure Storage Mover
- AzCopy
- Azure File Sync
- Azure Data Box

### Step 4 – Validation

Verify:

- File count
- Permissions
- Accessibility
- Data integrity

### Step 5 – Cutover

Redirect users and applications to the new Azure storage location. :contentReference[oaicite:1]{index=1}

---

# Azure Data Box

## What is Azure Data Box?

Azure Data Box is a Microsoft-provided physical storage device used to transfer large amounts of data into Azure when network transfer is slow or impractical. :contentReference[oaicite:2]{index=2}

## Why Use Azure Data Box?

Organizations may need to migrate:

- Hundreds of terabytes (TB)
- Petabytes (PB) of data

Uploading such large datasets over the internet can take weeks or months.

## How Azure Data Box Works

```text
On-Premises Data
      |
      v
Azure Data Box
      |
      v
Microsoft Data Center
      |
      v
Azure Storage Account
```

### Process

1. Order Azure Data Box.
2. Microsoft ships the device.
3. Copy data onto the device.
4. Ship device back.
5. Microsoft uploads data to Azure Storage.

## Benefits

- Faster migration
- Secure transfer
- Encrypted storage
- Reduced migration time
- Suitable for low-bandwidth environments

## Types of Azure Data Box

| Type | Capacity |
|----------|----------|
| Azure Data Box Disk | Up to ~35 TB |
| Azure Data Box | Up to ~100 TB |
| Azure Data Box Heavy | Up to ~1 PB |

## Use Cases

- Data center migration
- Backup migration
- Media migration
- Cloud onboarding

> Warning: Azure Data Box is best suited for very large datasets where network-based transfer is not practical.

---

# Azure Storage Mover

## What is Azure Storage Mover?

Azure Storage Mover is a fully managed migration service used to move files and folders from on-premises environments to Azure Storage. :contentReference[oaicite:3]{index=3}

## Components

### Storage Mover Resource

Created in Azure Portal.

### Migration Project

Contains migration configuration.

### Migration Agent

Installed on source server.

### Target Storage

Typically:

- Azure Blob Storage
- Azure Files

## Workflow

```text
Source File Server
        |
Migration Agent
        |
        v
Azure Storage Mover
        |
        v
Azure Blob Storage
or
Azure Files
```

## Features

- Managed migration
- Centralized monitoring
- Multiple migration jobs
- Secure transfers
- Progress tracking
- Retry support

## Benefits

- Simplifies migration
- Reduces manual effort
- Supports large-scale transfers
- Centralized management

---

# Azure Data Box vs Azure Storage Mover

| Feature | Azure Data Box | Azure Storage Mover |
|----------|----------|----------|
| Migration Type | Offline | Online |
| Transfer Method | Physical Device | Network |
| Best For | Very Large Data | File Migration |
| Internet Required | No | Yes |
| Scale | TB-PB | Small-Large |
| Management | Device-Based | Fully Managed |

:contentReference[oaicite:4]{index=4}

---

# Azure Databases

Azure provides fully managed cloud database services for storing and managing application data. :contentReference[oaicite:5]{index=5}

---

# Relational Databases (SQL)

Relational databases store structured data in rows and columns.

## Azure SQL Database

A fully managed relational database service.

### Features

- Automatic backups
- Automatic patching
- High availability
- Built-in security

### Use Cases

- Web applications
- Business applications
- E-commerce platforms

---

## Azure SQL Managed Instance

Managed SQL Server with near-full compatibility with on-premises SQL Server.

### Use Cases

- SQL Server migrations
- Enterprise workloads

---

## SQL Server on Azure Virtual Machines

SQL Server installed inside an Azure VM.

### Benefits

- Full OS control
- Full SQL Server control
- Infrastructure as a Service (IaaS)

---

## Azure Database for MySQL

### Features

- Automatic patching
- High availability
- Scalability

### Use Cases

- WordPress
- PHP applications
- Web applications

---

## Azure Database for PostgreSQL

### Features

- Open-source compatibility
- Automatic backups
- High availability

### Use Cases

- Enterprise applications
- Analytics workloads
- GIS applications

---

# Non-Relational Databases (NoSQL)

NoSQL databases support flexible schemas and distributed applications.

## Azure Cosmos DB

Microsoft's globally distributed NoSQL database service.

### Features

- Global replication
- Low latency
- Automatic scaling
- Multiple API support

### Supported APIs

- SQL API
- MongoDB API
- Cassandra API
- Gremlin API
- Table API

### Use Cases

- IoT applications
- Gaming platforms
- Social media applications
- Global web applications

---

## Azure Cache for Redis

In-memory caching service.

### Benefits

- High performance
- Reduced application latency
- Fast data access

### Use Cases

- Session storage
- Application caching
- Real-time applications

---

## Azure Synapse Analytics

Analytics and data warehousing platform.

### Use Cases

- Reporting
- Data analytics
- Data engineering

---

# Azure Database Service Comparison

| Service | Type | Best For |
|-----------|----------|----------|
| Azure SQL Database | Relational | Cloud-native apps |
| Azure SQL Managed Instance | Relational | SQL migration |
| SQL Server on Azure VM | Relational | Full control |
| Azure Database for MySQL | Relational | Web apps |
| Azure Database for PostgreSQL | Relational | Enterprise apps |
| Azure Cosmos DB | NoSQL | Global-scale apps |
| Azure Cache for Redis | In-Memory | Caching |
| Azure Synapse Analytics | Analytics | Data warehousing |

:contentReference[oaicite:6]{index=6}

---

# Quick Revision

| Topic | Key Point |
|----------|----------|
| Blob Storage | Object storage |
| Azure Files | Managed file shares |
| Storage Explorer | Storage management tool |
| Data Box | Offline migration |
| Storage Mover | Online managed migration |
| Cosmos DB | NoSQL database |
| SQL Database | Managed relational database |
| Redis | In-memory cache |
| Synapse | Analytics platform |

---

# Interview Questions

## What is Azure Blob Storage?

Azure Blob Storage is an object storage service used for storing unstructured data such as images, videos, backups, and logs.

---

##  What is Azure Data Box?

Azure Data Box is a physical Microsoft-provided appliance used for offline migration of large datasets into Azure. :contentReference[oaicite:7]{index=7}

---

##  What is Azure Storage Mover?

Azure Storage Mover is a fully managed Azure service used to migrate files and folders from on-premises environments to Azure Storage. :contentReference[oaicite:8]{index=8}

---

##  When should Azure Data Box be used?

When very large datasets need to be migrated and available network bandwidth is insufficient. :contentReference[oaicite:9]{index=9}

---

##  Difference Between Azure Data Box and Storage Mover?

| Feature | Data Box | Storage Mover |
|----------|----------|----------|
| Migration | Offline | Online |
| Transfer | Physical Device | Network |
| Internet | Not Required | Required |
| Best Use Case | TB/PB Scale | File Share Migration |

---

##  What is Azure Cosmos DB?

Azure Cosmos DB is Microsoft's globally distributed NoSQL database service supporting multiple APIs and automatic scaling. :contentReference[oaicite:10]{index=10}

---

# Key Takeaway

Azure Storage provides scalable and secure services for storing files, objects, messages, and NoSQL data. Organizations can migrate data using online tools such as Azure Storage Mover or offline solutions such as Azure Data Box. Azure databases provide managed relational, NoSQL, caching, and analytics services that eliminate infrastructure management while delivering high availability and scalability.

---