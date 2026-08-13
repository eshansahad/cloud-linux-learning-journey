# Day 26 — AWS RDS Administration (MariaDB & Microsoft SQL Server)

**Date:** July 08, 2026

---

# Overview

Today's session focused on Amazon Relational Database Service (Amazon RDS), AWS's fully managed relational database platform. The practical labs covered deploying MariaDB and Microsoft SQL Server database instances, configuring secure network connectivity, connecting using database client tools, creating databases and tables, performing SQL operations, and validating data persistence.

These exercises demonstrated how AWS simplifies database administration while maintaining high availability, automated backups, and secure connectivity.

---

# Topics Covered

- Amazon Relational Database Service (RDS)
- MariaDB
- Microsoft SQL Server
- Database Instances
- Security Groups
- Public Connectivity
- Database Endpoints
- SQL Client Tools
- DDL (Data Definition Language)
- DML (Data Manipulation Language)
- CRUD Operations
- SQL Queries
- Database Administration

---

# Practical Lab 1 — Amazon RDS MariaDB

## Create MariaDB Instance

Provisioned a new Amazon RDS MariaDB database.

Configuration included

- Standard Create
- MariaDB Engine
- Free Tier Template
- db.t3.micro Instance
- Default VPC
- Public Access Enabled

Configured administrator credentials and created the database instance.

---

## Configure Networking

Configured networking settings.

- Default VPC
- Security Group
- Port 3306
- Public Endpoint
- Source restricted to My IP

This ensured secure database access from the local machine.

---

## Connect Using Database Client

Connected using DBeaver.

Connection parameters

- Hostname
- Port 3306
- Username
- Password

Verified successful connection to the database instance.

---

## Database Administration

Created a new database.

```sql
CREATE DATABASE CarVillaInventory;
```

Selected the database.

```sql
USE CarVillaInventory;
```

Created a table.

```sql
CREATE TABLE FeaturedCars (
    VehicleID INT AUTO_INCREMENT PRIMARY KEY,
    Make VARCHAR(50),
    Model VARCHAR(50),
    Price DECIMAL(10,2)
);
```

Inserted sample records.

Executed queries to retrieve stored data.

---

# Practical Lab 2 — Amazon RDS Microsoft SQL Server

## Create SQL Server Instance

Provisioned a Microsoft SQL Server Express Edition instance.

Configuration

- SQL Server Express
- Amazon RDS
- db.t3.micro
- Default VPC
- Public Access Enabled

---

## Configure Security

Configured inbound rules.

- TCP Port 1433
- Source restricted to My IP

Verified secure database connectivity.

---

## Connect Using DBeaver

Established connection using:

- Endpoint
- Username
- Password
- SQL Server Authentication

Verified successful login.

---

## Database Administration

Created a database.

```sql
CREATE DATABASE CorporateDirectoryDB;
```

Selected the database.

```sql
USE CorporateDirectoryDB;
```

Created a table.

```sql
CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Department NVARCHAR(50)
);
```

Inserted employee records.

Executed SELECT statements to verify successful insertion.

---

# SQL Operations Practiced

## DDL

- CREATE DATABASE
- CREATE TABLE

## DML

- INSERT
- SELECT

## CRUD Concepts

- Create
- Read
- Update
- Delete

---

# Database Client

Used

- DBeaver

Practiced

- Creating connections
- Running SQL queries
- Viewing tables
- Managing schemas
- Browsing records

---

# AWS Services Used

- Amazon RDS
- MariaDB
- Microsoft SQL Server
- Security Groups
- Amazon VPC

---

# Skills Learned

- Deploying managed relational databases
- Configuring RDS networking
- Restricting database access
- Connecting using database clients
- Creating relational databases
- Designing SQL tables
- Executing SQL queries
- Managing cloud-hosted databases
- Understanding managed database services

---

# Key Takeaways

- Amazon RDS removes the operational burden of database administration.
- Security Groups protect database instances from unauthorized access.
- Public endpoints simplify lab connectivity while production workloads typically use private networking.
- DBeaver provides a unified interface for managing multiple database engines.
- MariaDB and Microsoft SQL Server follow similar administration workflows despite differences in SQL syntax.

---

# Lab Environment

| Component | Details |
|------------|---------|
| Cloud Provider | AWS |
| Database Service | Amazon RDS |
| Database Engines | MariaDB, Microsoft SQL Server Express |
| Client Tool | DBeaver |
| Operating System | Windows 11 |
| Network | Default VPC |
| Security | Security Groups (My IP) |
| Database Ports | 3306 (MariaDB), 1433 (SQL Server) |

---

# Outcome

Successfully deployed Amazon RDS instances for MariaDB and Microsoft SQL Server, configured secure network access, connected using DBeaver, created relational databases and tables, executed SQL commands, and verified persistent cloud-based data storage through successful CRUD operations.