# Day 31 – AWS Backup, Recycle Bin, Lambda & AWS Batch

**Date:** July 15, 2026

---

# Overview

Today's session focused on AWS backup strategies, disaster recovery, serverless computing, and managed batch processing. The labs demonstrated how AWS automates backup management, protects deleted resources, executes code without servers, and processes large workloads using managed compute resources.

---

# Topics Covered

## AWS Backup

### Objectives

- Create Backup Vault
- Configure Backup Plan
- Assign EC2 resources
- Create On-Demand Backup
- Restore EC2 Instance

### Key Concepts

- Backup Vault
- Backup Plan
- Backup Rules
- Recovery Points
- Restore Jobs
- Lifecycle Policies
- AWS Managed KMS Encryption

### Skills Practiced

- Creating Backup Vaults
- Configuring Daily Backup Plans
- Assigning EC2 resources
- Monitoring Backup Jobs
- Restoring EC2 instances

---

## Amazon Recycle Bin

### Objectives

- Configure Retention Rule
- Protect EBS Snapshots
- Delete Snapshot
- Restore Deleted Snapshot

### Key Concepts

- Retention Rules
- Resource Protection
- Snapshot Recovery
- Recovery Window

### Skills Practiced

- Creating Retention Rules
- Recovering Deleted Snapshots
- Validating Restore Operations

---

## AWS Lambda

### Objectives

- Create Lambda Function
- Deploy Python Code
- Execute Test Events
- View CloudWatch Logs
- Modify & Redeploy Code

### Key Concepts

- Serverless Computing
- Event-driven Architecture
- Function Handler
- Runtime
- CloudWatch Logs

### Skills Practiced

- Creating Python Lambda Functions
- Processing JSON Events
- Testing Functions
- Monitoring Executions
- Updating Serverless Applications

---

## AWS Batch

### Objectives

- Create Compute Environment
- Create Job Queue
- Create Job Definition
- Submit Batch Job
- Verify CloudWatch Logs

### Key Concepts

- Managed Compute Environment
- Job Queue
- Job Definition
- Batch Processing
- Amazon Fargate

### Skills Practiced

- Configuring AWS Batch
- Running Containerized Jobs
- Monitoring Job Status
- Viewing Execution Logs

---

# AWS Services Used

- AWS Backup
- Amazon Recycle Bin
- AWS Lambda
- AWS Batch
- Amazon EC2
- Amazon EBS
- Amazon CloudWatch
- Amazon Fargate
- IAM
- AWS KMS

---

# Key Learnings

- Centralized backup management using AWS Backup
- Recovery of accidentally deleted snapshots with Amazon Recycle Bin
- Building serverless applications with AWS Lambda
- Event-driven function execution
- Monitoring using Amazon CloudWatch
- Running batch workloads using AWS Batch
- Understanding managed compute environments and job orchestration

---

# Outcome

Successfully configured AWS Backup and recovery workflows, protected EBS snapshots using Amazon Recycle Bin, developed and tested serverless applications using AWS Lambda, and executed managed batch workloads using AWS Batch with Amazon Fargate.