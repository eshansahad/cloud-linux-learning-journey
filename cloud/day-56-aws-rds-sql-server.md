# Day 56 - Amazon RDS Microsoft SQL Server Administration

> Learn how to provision and manage a Microsoft SQL Server database using Amazon Relational Database Service (RDS).

---

## Overview

Amazon Relational Database Service (RDS) provides a managed environment for running relational databases without manually managing the underlying database infrastructure.

In this lab, I created a Microsoft SQL Server Express database instance using Amazon RDS, configured VPC and security group connectivity, connected to the database using a SQL client, created a database and table, inserted sample employee records, and verified the stored data.

---

## Objectives

- Understand Amazon RDS for Microsoft SQL Server
- Create a SQL Server DB instance
- Configure database credentials
- Configure VPC and security group access
- Connect using a SQL client
- Create a database and table
- Insert sample data
- Retrieve and verify data

---

# What is Amazon RDS for Microsoft SQL Server?

Amazon RDS for Microsoft SQL Server is a managed relational database service that allows users to deploy Microsoft SQL Server databases on AWS.

RDS handles the underlying database infrastructure while providing standard SQL Server connectivity and administration capabilities.

---

# Hands-on Lab

## Task 1 – Create a Microsoft SQL Server DB Instance

Configured:

- Creation method: Standard create
- Database engine: Microsoft SQL Server
- Database management: Amazon RDS
- Edition: SQL Server Express Edition
- DB instance identifier: `rds-sqlserver-lab-01`
- Configured the master username
- Created a secure master password
- Selected a burstable instance class

The SQL Server RDS instance was successfully provisioned. :contentReference[oaicite:1]{index=1}

---

## Task 2 – Configure Connectivity

Configured:

- Default VPC
- Public access enabled for the lab
- Created security group: `sg-rds-sqlserver-public`
- Configured Microsoft SQL Server port `1433`
- Restricted inbound access to the local machine IP address

This provided controlled connectivity from the local SQL client while limiting unauthorized external access. :contentReference[oaicite:2]{index=2}

---

## Task 3 – Connect Using a SQL Client

Performed:

- Retrieved the RDS SQL Server endpoint
- Opened a local SQL client such as SQL Server Management Studio (SSMS) or DBeaver
- Configured the RDS endpoint as the server host
- Used SQL Server Authentication
- Configured port `1433`
- Entered the configured username and password
- Established the database connection successfully

:contentReference[oaicite:3]{index=3}

---

## Task 4 – Create Database and Table

Created the database schema and an employee table.

The `Employees` table included:

- Employee ID
- First Name
- Last Name
- Department
- Hire Date

The EmployeeID was configured to auto-increment, while HireDate used a server-side timestamp.

---

## Task 5 – Insert and Verify Data

Inserted three sample employee records:

- John Doe — Information Technology
- Jane Smith — Human Resources
- Michael Johnson — Finance

Executed:

```sql
SELECT * FROM Employees;
GO
```

Verified that all three records were successfully returned. The EmployeeID values auto-incremented correctly and the HireDate values reflected the server-side insertion timestamp. :contentReference[oaicite:4]{index=4}

---

# AWS Services & Tools Used

- Amazon RDS
- Microsoft SQL Server
- Amazon VPC
- EC2 Security Groups
- SQL Server Management Studio (SSMS) / DBeaver

---

# Skills Learned

- Amazon RDS SQL Server administration
- Microsoft SQL Server management
- Database provisioning
- VPC connectivity
- Security group configuration
- SQL Server Authentication
- T-SQL database operations
- Table creation
- Data insertion and retrieval

---

# Key Takeaways

- Amazon RDS simplifies Microsoft SQL Server deployment on AWS.
- SQL Server databases can be accessed using standard SQL client tools.
- Port `1433` is used for SQL Server connectivity.
- Security groups control network access to the RDS instance.
- RDS supports standard SQL Server operations such as database and table creation, data insertion, and retrieval.
- Server-side timestamps can be used to record database activity.

---

# Conclusion

In this lab, I successfully provisioned a Microsoft SQL Server Express database using Amazon RDS, configured VPC and security group connectivity, connected through a SQL client, created an employee database table, inserted sample records, and verified the stored data.

This hands-on exercise strengthened my understanding of managed SQL Server databases, AWS networking, database security, SQL Server administration, and T-SQL operations using Amazon RDS.