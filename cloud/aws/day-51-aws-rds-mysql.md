# Day 51 - Amazon RDS MySQL Administration

> Learn how to provision and manage a MySQL database using Amazon Relational Database Service (RDS).

---

## Overview

Amazon Relational Database Service (RDS) is a managed database service that makes it easier to set up, operate, and scale relational databases in AWS.

In this lab, I created a MySQL database instance using Amazon RDS, configured its networking and security settings, established a connection using a local database client, created a database and table, inserted sample attendance records, and verified the stored data.

---

## Objectives

- Understand Amazon RDS
- Create a MySQL DB instance
- Configure database credentials
- Configure VPC and security group access
- Connect to RDS using a database client
- Create a database and table
- Insert sample records
- Retrieve and verify data

---

# What is Amazon RDS?

Amazon Relational Database Service (RDS) is a managed service for running relational databases in AWS.

RDS handles many administrative tasks such as infrastructure provisioning, database setup, backups, and maintenance, allowing users to focus on database operations and applications.

---

# MySQL on Amazon RDS

MySQL is one of the database engines supported by Amazon RDS.

In this lab, a MySQL DB instance was provisioned using the Free Tier template and configured for direct connectivity from the local database client. :contentReference[oaicite:1]{index=1}

---

# Hands-on Lab

## Task 1 – Create a MySQL DB Instance

Configured:

- Creation method: Standard create
- Database engine: MySQL
- Template: Free Tier
- DB instance identifier: `rds-attendance-db-lab`
- Master username: `admin`
- Configured a secure master password
- Selected a burstable instance class

The RDS MySQL instance was successfully provisioned. :contentReference[oaicite:2]{index=2}

---

## Task 2 – Configure Connectivity

Configured:

- Default VPC
- Public access enabled for the lab
- Created security group: `sg-rds-public-lab`
- Configured MySQL/Aurora port `3306`
- Restricted inbound access to the local client IP address

This allowed the database to be accessed securely from the local SQL client used for the exercise. :contentReference[oaicite:3]{index=3}

---

## Task 3 – Connect Using a Database Client

Performed:

- Retrieved the RDS endpoint
- Opened a local SQL client
- Configured the RDS endpoint as the database host
- Used port `3306`
- Provided the master username and password
- Tested and established the connection successfully

:contentReference[oaicite:4]{index=4}

---

## Task 4 – Create Database and Table

Created the following database:

```text
WebAttendanceSystem
```

Created a table:

```text
StudentRecords
```

The table contained fields for:

- Log ID
- Student ID
- Full Name
- Check-in time
- Attendance status

---

## Task 5 – Insert and Verify Data

Inserted sample attendance records into the database.

Example records included:

- `CS2026-01` — Arjun Patel — Present
- `CS2026-02` — Priya Sharma — Present
- `CS2026-03` — Rahul Menon — Absent

Executed:

```sql
SELECT * FROM StudentRecords;
```

Verified that the three inserted records were successfully returned and that the database was correctly persisting the data. :contentReference[oaicite:5]{index=5}

---

# AWS Services & Tools Used

- Amazon RDS
- Amazon VPC
- Amazon EC2 Security Groups
- MySQL
- MySQL Workbench / DBeaver / MySQL CLI

---

# Skills Learned

- Amazon RDS administration
- MySQL database management
- Database provisioning
- VPC connectivity
- Security group configuration
- SQL database operations
- Table creation
- Data insertion and retrieval
- Remote database connectivity

---

# Key Takeaways

- Amazon RDS simplifies relational database deployment on AWS.
- MySQL databases can be provisioned without manually managing database servers.
- Security groups control network access to RDS instances.
- SQL clients can connect to RDS using the database endpoint.
- Standard SQL operations can be performed directly against the managed database.

---

# Conclusion

In this lab, I successfully provisioned a MySQL database using Amazon RDS, configured VPC and security group connectivity, established a remote database connection, created the `WebAttendanceSystem` database and `StudentRecords` table, inserted sample attendance records, and verified the stored data.

This hands-on exercise strengthened my understanding of managed relational databases, MySQL administration, AWS networking, database security, and SQL operations using Amazon RDS.