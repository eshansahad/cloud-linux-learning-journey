# Day 55 - Amazon RDS MariaDB Administration

> Learn how to provision and manage a MariaDB database using Amazon Relational Database Service (RDS).

---

## Overview

Amazon Relational Database Service (RDS) is a managed database service that simplifies the deployment, operation, and administration of relational databases.

In this lab, I created a MariaDB database instance using Amazon RDS, configured VPC and security group connectivity, connected to the database using a local SQL client, created a database and table, inserted sample vehicle records, and verified the stored data.

---

## Objectives

- Understand Amazon RDS MariaDB
- Create a MariaDB DB instance
- Configure database credentials
- Configure VPC and security group access
- Connect using a database client
- Create a database and table
- Insert sample data
- Retrieve and verify data

---

# What is Amazon RDS MariaDB?

Amazon RDS for MariaDB is a managed relational database service that allows users to deploy MariaDB databases without manually managing the underlying database server infrastructure.

RDS handles many infrastructure and administrative tasks while providing standard database connectivity and SQL capabilities.

---

# Hands-on Lab

## Task 1 – Create a MariaDB DB Instance

Configured:

- Creation method: Standard create
- Database engine: MariaDB
- Template: Free Tier
- DB instance identifier: `rds-mariadb-carvilla-lab`
- Master username: `admin`
- Configured a secure master password
- Selected a burstable instance type

The MariaDB RDS instance was successfully provisioned. :contentReference[oaicite:2]{index=2}

---

## Task 2 – Configure Connectivity

Configured:

- Default VPC
- Public access enabled for the lab
- Created security group: `sg-rds-mariadb-public`
- Configured MySQL/Aurora port `3306`
- Restricted inbound access to the local machine IP address

This provided controlled access from the local SQL client while limiting unauthorized external connections. :contentReference[oaicite:3]{index=3}

---

## Task 3 – Connect Using a Database Client

Performed:

- Retrieved the MariaDB RDS endpoint
- Opened a local SQL client
- Configured the RDS endpoint as the host
- Used port `3306`
- Entered the configured username and password
- Tested and established the connection successfully

:contentReference[oaicite:4]{index=4}

---

## Task 4 – Create Database and Table

Created the database:

```text
CarVillaInventory
```

Created the table:

```text
FeaturedCars
```

The table included:

- Vehicle ID
- Make
- Model
- Model Year
- Price
- Horsepower

The `VehicleID` field was configured as an auto-incrementing primary key. :contentReference[oaicite:5]{index=5}

---

## Task 5 – Insert and Verify Data

Inserted four sample vehicle records:

- BMW 6-series Gran Coupe
- Chevrolet Camaro WMV20
- Lamborghini V520
- Audi A3 Sedan

Executed:

```sql
SELECT * FROM FeaturedCars;
```

Verified that all four records were successfully returned and that the `VehicleID` values were automatically generated sequentially.

:contentReference[oaicite:6]{index=6}

---

# AWS Services & Tools Used

- Amazon RDS
- MariaDB
- Amazon VPC
- EC2 Security Groups
- Local SQL Client

---

# Skills Learned

- Amazon RDS MariaDB administration
- Relational database management
- Database provisioning
- VPC connectivity
- Security group configuration
- SQL operations
- Table creation
- Data insertion and retrieval
- Remote database connectivity

---

# Key Takeaways

- Amazon RDS simplifies MariaDB database deployment.
- Security groups control network access to the database.
- Port `3306` is used for MariaDB connectivity.
- RDS databases can be accessed using standard SQL clients.
- Auto-incrementing primary keys simplify record management.
- Database operations can be performed remotely through the RDS endpoint.

---

# Conclusion

In this lab, I successfully provisioned a MariaDB database using Amazon RDS, configured VPC and security group connectivity, established a remote database connection, created the `CarVillaInventory` database and `FeaturedCars` table, inserted four sample vehicle records, and verified the stored data.

This hands-on exercise strengthened my understanding of managed relational databases, MariaDB administration, AWS networking, database security, and SQL operations using Amazon RDS.