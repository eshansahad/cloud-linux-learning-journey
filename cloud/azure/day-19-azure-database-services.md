# Day 19 – Azure Database Services

**Date:** June 26, 2026

---

# Objective

Learn how to deploy, configure, secure, and manage Azure cloud databases using:

- Azure SQL Database
- Azure Database for MySQL
- Azure Database for PostgreSQL

The lab also covers creating databases, configuring firewall rules, connecting securely, creating tables, inserting data, and querying records.

---

# Azure Database Services Overview

Azure provides fully managed relational database services that reduce infrastructure management while providing scalability, security, backups, and high availability.

The three major services covered are:

- Azure SQL Database
- Azure Database for MySQL
- Azure Database for PostgreSQL

---

# Azure SQL Database

## Overview

Azure SQL Database is Microsoft's fully managed relational database service based on Microsoft SQL Server.

### Features

- Fully Managed Service
- Automatic Backups
- High Availability
- Built-in Security
- Auto Scaling
- Query Editor

### Lab Activities

- Create SQL Server
- Create SQL Database
- Configure Firewall
- Connect using Azure Query Editor
- Create Table
- Insert Records
- Retrieve Data

### Sample SQL

```sql
CREATE TABLE CloudStudents (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    Course VARCHAR(50),
    EnrollmentYear INT
);

INSERT INTO CloudStudents
VALUES
(1,'Eshan','Cloud Administration',2026),
(2,'Aisha','Data Engineering',2026),
(3,'Rahul','DevOps Fundamentals',2025);

SELECT * FROM CloudStudents;
```

---

# Azure Database for MySQL

## Overview

Azure Database for MySQL is a managed MySQL database service built for web applications and open-source workloads.

### Features

- Flexible Server
- Automatic Backups
- High Availability
- Secure Networking
- Easy Scaling

### Lab Activities

- Deploy MySQL Flexible Server
- Configure Public Access
- Add Firewall Rule
- Connect through Azure Cloud Shell
- Create Database
- Create Table
- Insert Data
- Query Records

### Connection Command

```bash
mysql -h <server-name>.mysql.database.azure.com -u <admin-user> -p
```

### Sample Commands

```sql
CREATE DATABASE CloudLabDB;

USE CloudLabDB;

CREATE TABLE CloudStudents(
StudentID INT PRIMARY KEY,
FirstName VARCHAR(50),
Course VARCHAR(50),
EnrollmentYear INT
);

SELECT * FROM CloudStudents;
```

---

# Azure Database for PostgreSQL

## Overview

Azure Database for PostgreSQL is Microsoft's managed PostgreSQL service designed for enterprise and open-source applications.

### Features

- Flexible Server
- PostgreSQL Engine
- Automatic Backups
- Secure Firewall
- High Availability
- Cloud Shell Integration

### Lab Activities

- Deploy PostgreSQL Flexible Server
- Configure Networking
- Add Firewall Rule
- Connect using psql
- Create Database
- Create Table
- Insert Records
- Query Data

### Connection Command

```bash
psql -h <server>.postgres.database.azure.com -U <admin-user> -d postgres
```

### Sample Commands

```sql
CREATE DATABASE cloudlabdb;

\c cloudlabdb

CREATE TABLE CloudStudents(
StudentID INT PRIMARY KEY,
FirstName VARCHAR(50),
Course VARCHAR(50),
EnrollmentYear INT
);

SELECT * FROM CloudStudents;
```

---

# Firewall Configuration

For all three services:

- Configure Public Access
- Add Current Client IP
- Allow Azure Services
- Save Firewall Rules

This ensures secure access while preventing unauthorized connections.

---

# Azure Cloud Shell

Azure Cloud Shell was used to connect to:

- MySQL Server
- PostgreSQL Server

Advantages:

- No local installation required
- Secure browser-based terminal
- Built-in Azure authentication

---

# Database Administration Workflow

```
Azure Portal
      │
      ▼
Create Database Server
      │
      ▼
Configure Authentication
      │
      ▼
Configure Firewall
      │
      ▼
Deploy Database
      │
      ▼
Connect to Database
      │
      ▼
Create Database
      │
      ▼
Create Tables
      │
      ▼
Insert Records
      │
      ▼
Run SELECT Queries
```

---

# Comparison

| Feature | Azure SQL | Azure MySQL | Azure PostgreSQL |
|----------|-----------|-------------|------------------|
| Database Engine | Microsoft SQL Server | MySQL | PostgreSQL |
| Connection Tool | Query Editor / SSMS | Cloud Shell / MySQL CLI | Cloud Shell / psql |
| Flexible Server | No | Yes | Yes |
| Query Language | T-SQL | SQL | SQL |
| Best For | Enterprise Apps | Web Applications | Open-source & Enterprise |

---

# Key Learning Outcomes

- Understood Azure managed database services
- Created Azure SQL Database
- Created Azure Database for MySQL
- Created Azure Database for PostgreSQL
- Configured firewall rules
- Connected securely using Query Editor and Cloud Shell
- Created databases and tables
- Inserted sample records
- Queried data using SQL
- Learned basic cloud database administration

---

# Summary

During this lab, I successfully deployed and administered three Azure managed relational database services: Azure SQL Database, Azure Database for MySQL, and Azure Database for PostgreSQL. I learned how to configure secure networking, connect using Azure Query Editor and Azure Cloud Shell, create databases and tables, insert records, and retrieve data using SQL queries. These exercises provided practical experience with Azure database administration and cloud-based relational database management.