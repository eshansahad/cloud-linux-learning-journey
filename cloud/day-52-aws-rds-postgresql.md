# Day 52 - Amazon RDS PostgreSQL Administration

> Learn how to provision and manage a PostgreSQL database using Amazon Relational Database Service (RDS).

---

## Overview

Amazon Relational Database Service (RDS) is a managed database service that simplifies the deployment and administration of relational databases in AWS.

In this lab, I created a PostgreSQL DB instance using Amazon RDS, configured its networking and security settings, connected to the database using a local SQL client, created a database and table, inserted sample records, and verified the stored data.

---

## Objectives

- Understand Amazon RDS PostgreSQL
- Create a PostgreSQL DB instance
- Configure database credentials
- Configure VPC and security group access
- Connect using a PostgreSQL client
- Create a database and table
- Insert sample data
- Retrieve and verify data

---

# What is Amazon RDS PostgreSQL?

Amazon RDS for PostgreSQL is a managed PostgreSQL database service that handles infrastructure provisioning and many common database administration tasks.

It allows users to deploy PostgreSQL databases without manually managing the underlying database server.

---

# Hands-on Lab

## Task 1 – Create a PostgreSQL DB Instance

Configured:

- Creation method: Standard create
- Database engine: PostgreSQL
- Template: Free Tier
- DB instance identifier: `rds-postgres-lab-01`
- Configured the master username
- Created a secure master password
- Selected a burstable instance class

The PostgreSQL RDS instance was successfully provisioned. :contentReference[oaicite:3]{index=3}

---

## Task 2 – Configure Connectivity

Configured:

- Default VPC
- Public access enabled for the lab
- Created security group: `sg-rds-postgres-public`
- Configured PostgreSQL port `5432`
- Restricted inbound access to the local machine's IP address

This allowed the local database client to securely connect to the RDS PostgreSQL instance. :contentReference[oaicite:4]{index=4}

---

## Task 3 – Connect Using a Database Client

Performed:

- Retrieved the RDS database endpoint
- Opened a local SQL client such as pgAdmin, DBeaver, or DataGrip
- Configured the RDS endpoint as the host
- Used port `5432`
- Used the PostgreSQL maintenance database
- Entered the configured username and password
- Tested and established the connection successfully

:contentReference[oaicite:5]{index=5}

---

## Task 4 – Create Database and Table

Created the database:

```text
WebPortalDB
```

Created the table:

```text
UserSessions
```

The table used PostgreSQL's `SERIAL` data type for the session identifier and included fields for:

- Session ID
- Username
- Browser platform
- Login timestamp

:contentReference[oaicite:6]{index=6}

---

## Task 5 – Insert and Verify Data

Inserted sample user session records into the `UserSessions` table.

Performed a retrieval query:

```sql
SELECT * FROM UserSessions;
```

Verified that the three inserted rows were successfully returned.

The automatically generated session IDs and server-side timestamps confirmed that the PostgreSQL database was processing and persisting the data correctly. :contentReference[oaicite:7]{index=7}

---

# AWS Services & Tools Used

- Amazon RDS
- PostgreSQL
- Amazon VPC
- EC2 Security Groups
- pgAdmin / DBeaver / DataGrip

---

# Skills Learned

- Amazon RDS PostgreSQL administration
- PostgreSQL database management
- Database provisioning
- VPC connectivity
- Security group configuration
- SQL database operations
- Table creation
- Data insertion and retrieval
- Remote database connectivity

---

# Key Takeaways

- Amazon RDS simplifies PostgreSQL database deployment.
- PostgreSQL databases can be managed without maintaining the underlying server infrastructure.
- Security groups control access to RDS database endpoints.
- Port `5432` is used for PostgreSQL connectivity.
- SQL clients can remotely connect to RDS using its endpoint.
- PostgreSQL supports features such as `SERIAL` for automatically generated identifiers.

---

# Conclusion

In this lab, I successfully provisioned a PostgreSQL database using Amazon RDS, configured VPC and security group connectivity, established a connection using a local database client, created the `WebPortalDB` database and `UserSessions` table, inserted sample records, and verified the stored data.

This hands-on exercise strengthened my understanding of managed PostgreSQL databases, AWS networking, database security, and SQL operations using Amazon RDS.