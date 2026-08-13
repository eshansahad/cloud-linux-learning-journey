# Day 53 - Amazon Aurora MySQL-Compatible Database

> Learn how to deploy and manage an Amazon Aurora MySQL-compatible database cluster and perform basic database operations.

---

## Overview

Amazon Aurora is a relational database engine designed for high performance and availability while remaining compatible with popular database engines such as MySQL.

In this lab, I created an Amazon Aurora MySQL-compatible database cluster, configured its connectivity and security group, launched a DB instance, connected to the cluster using a database client, created a database and table, inserted sample records, and verified the stored data.

---

## Objectives

- Understand Amazon Aurora
- Create an Aurora database cluster
- Configure cluster settings
- Configure VPC and security group connectivity
- Launch an Aurora DB instance
- Connect using a database client
- Create a database and table
- Insert sample data
- Retrieve and verify data

---

# What is Amazon Aurora?

Amazon Aurora is a fully managed relational database engine provided by AWS.

Aurora is compatible with MySQL and PostgreSQL and is designed to provide high performance, availability, and durability while integrating with the AWS ecosystem.

---

# Key Components

### Aurora Cluster

The cluster provides the shared database storage layer and database endpoints.

### DB Instance

Provides the compute capacity used to run the database workload.

### Writer Endpoint

Provides connection access to the primary database instance for read and write operations.

### Security Group

Controls network access to the Aurora database.

---

# Hands-on Lab

## Task 1 – Create an Aurora Database Cluster

Configured:

- Creation method: Standard create
- Engine: Amazon Aurora
- Edition: Amazon Aurora MySQL-Compatible Edition
- Template: Dev/Test
- Cluster identifier: `aurora-cluster-lab-01`
- Configured master credentials
- Selected a burstable DB instance class

The Aurora cluster was successfully provisioned with its associated database instance. :contentReference[oaicite:1]{index=1}

---

## Task 2 – Configure Connectivity

Configured:

- Default VPC
- Default subnet configuration
- Public access enabled for the lab
- Created security group: `sg-aurora-public`
- Configured MySQL/Aurora port `3306`
- Restricted inbound access to the local machine IP address

This allowed the local database client to connect to the Aurora Writer endpoint while limiting external access. :contentReference[oaicite:2]{index=2}

---

## Task 3 – Connect to the Aurora Database

Performed:

- Retrieved the Aurora cluster Writer endpoint
- Opened a local SQL client
- Configured the Aurora endpoint
- Configured the database port
- Entered the database credentials
- Tested and established the connection successfully

The lab used the cluster's Writer endpoint for database administration. :contentReference[oaicite:3]{index=3}

---

## Task 4 – Create Database and Table

Created the database:

```text
InnovationLabDB
```

Created the table:

```text
WebProjects
```

The table included:

- Project ID
- Project Name
- Architecture Type
- Deployment Status

The schema used an auto-incrementing primary key for project records. :contentReference[oaicite:4]{index=4}

---

## Task 5 – Insert and Verify Data

Inserted sample project records representing different application and deployment scenarios.

Example records included:

- Urban Flood Monitoring Dashboard
- Smart Classroom Energy Manager
- CalibreSouth Wellness Portal

Executed:

```sql
SELECT * FROM WebProjects;
```

Verified that all three records were successfully returned and that the ProjectID values were automatically generated. :contentReference[oaicite:5]{index=5}

---

# AWS Services & Tools Used

- Amazon Aurora
- Amazon RDS
- Amazon VPC
- EC2 Security Groups
- MySQL-compatible SQL client

---

# Skills Learned

- Amazon Aurora administration
- Relational database management
- Aurora cluster configuration
- Database connectivity
- Security group configuration
- SQL database operations
- Table creation
- Data insertion and retrieval
- Managed database architecture

---

# Key Takeaways

- Amazon Aurora provides a managed relational database engine.
- Aurora MySQL-Compatible Edition supports standard MySQL syntax and tools.
- Aurora uses a cluster architecture with shared storage.
- Writer endpoints provide access to the primary database instance.
- Security groups control network access to Aurora databases.
- Aurora integrates with Amazon RDS management and AWS networking services.

---

# Conclusion

In this lab, I successfully deployed an Amazon Aurora MySQL-compatible database cluster, configured VPC and security group connectivity, connected to the Writer endpoint using a database client, created the `InnovationLabDB` database and `WebProjects` table, inserted sample records, and verified the stored data.

This hands-on exercise strengthened my understanding of managed relational databases, Aurora cluster architecture, database connectivity, network security, and SQL operations on AWS.