# Day 40 - Amazon Athena Serverless Query Service

> Learn how to query data stored in Amazon S3 using Amazon Athena without managing any database servers.

---

## Overview

Amazon Athena is a serverless interactive query service that enables users to analyze data stored in Amazon S3 using standard SQL. Athena eliminates the need to provision or manage database servers by automatically allocating the required compute resources whenever a query is executed.

In this lab, I configured Amazon Athena, created an S3 bucket to store query results, defined an external table for CSV data, executed SQL queries, and verified the returned results.

---

## Objectives

- Understand Amazon Athena
- Configure an S3 query results location
- Create an external table
- Query data stored in Amazon S3
- Execute SQL statements
- Verify query results

---

# What is Amazon Athena?

Amazon Athena is a fully managed, serverless query service that allows users to analyze structured, semi-structured, and unstructured data directly from Amazon S3 using SQL.

Since Athena is serverless, there is no infrastructure to provision or maintain. Users are charged only for the amount of data scanned by each query.

---

# Key Features

- Serverless architecture
- Standard SQL support
- Direct integration with Amazon S3
- No database servers to manage
- Pay-per-query pricing
- Fast interactive analytics

---

# Hands-on Lab

## Task 1 – Prepare Data Storage

Configured:

- Created an Amazon S3 bucket
- Uploaded the sample CSV dataset
- Verified successful upload

---

## Task 2 – Configure Query Results

Performed:

- Opened the Amazon Athena console
- Configured an S3 bucket for query results
- Saved the workgroup settings

---

## Task 3 – Create an External Table

Configured:

- Created a database
- Defined an external table
- Mapped CSV columns
- Linked the table to the S3 data location

---

## Task 4 – Execute SQL Queries

Performed:

- Executed SQL queries
- Retrieved records from the dataset
- Verified successful query execution

---

## Task 5 – Validate Results

Verified:

- Query results displayed successfully
- Output files generated in the configured S3 bucket
- Data retrieved without provisioning any database server

---

# AWS Services Used

- Amazon Athena
- Amazon S3
- AWS Glue Data Catalog

---

# Skills Learned

- Serverless data analytics
- SQL query execution
- External table creation
- Amazon S3 data analysis
- Athena query configuration
- Data catalog integration

---

# Key Takeaways

- Amazon Athena queries data directly from Amazon S3.
- No servers or database infrastructure are required.
- SQL can be used to analyze large datasets efficiently.
- Query results are automatically stored in Amazon S3.
- Athena integrates with the AWS Glue Data Catalog for metadata management.

---

# Conclusion

In this lab, I successfully configured Amazon Athena, created an external table, executed SQL queries against data stored in Amazon S3, and verified the query results. This exercise strengthened my understanding of serverless analytics, SQL-based querying, and cloud-native data processing on AWS.