# Day 33 - AWS Backup Administration

> Learn how to centrally manage, automate, and restore backups across AWS services using AWS Backup.

---

## Overview

AWS Backup is a fully managed backup service that enables centralized backup and recovery of AWS resources. Instead of configuring backups individually for each AWS service, AWS Backup provides a single interface to create backup plans, automate schedules, monitor backup jobs, and restore resources whenever required.

This lab demonstrates the complete backup lifecycle including creating a backup vault, configuring a backup plan, assigning AWS resources, verifying backup jobs, and restoring resources.

---

## Objectives

- Understand AWS Backup architecture
- Create a Backup Vault
- Configure a Backup Plan
- Configure backup schedules
- Assign AWS resources
- Perform an on-demand backup
- Monitor backup jobs
- Restore an EC2 instance from backup
- Verify successful recovery

---

# What is AWS Backup?

AWS Backup is a centralized backup management service that simplifies data protection across AWS services.

Instead of manually configuring snapshots and backups separately for EC2, EFS, RDS, DynamoDB, and other services, AWS Backup provides a single dashboard for scheduling, monitoring, and restoring backups.

---

# Services Supported

AWS Backup supports backup for:

- Amazon EC2
- Amazon EBS
- Amazon RDS
- Amazon EFS
- Amazon DynamoDB
- Amazon FSx
- Amazon S3
- AWS Storage Gateway
- Amazon Aurora

---

# Hands-on Lab

## Task 1 – Create a Backup Vault

Completed:

- Created a Backup Vault
- Used AWS-managed KMS encryption
- Configured secure backup storage

---

## Task 2 – Create a Backup Plan

Configured:

- Daily backup schedule
- Backup window
- Retention period
- Lifecycle policy

---

## Task 3 – Assign Resources

Assigned resources to the backup plan.

Example resource:

- Amazon EC2 Instance

Automatic backup scheduling was enabled successfully.

---

## Task 4 – Verify Backup Jobs

Performed:

- On-demand backup
- Monitored backup status
- Verified successful completion

Observed job states:

- Created
- Running
- Completed

---

## Task 5 – Restore Resources

Successfully restored the backed-up EC2 instance.

Verified:

- Restore Job Completed
- New EC2 instance created
- Data recovered successfully

---

# AWS Services Used

- AWS Backup
- Amazon EC2
- AWS IAM
- AWS KMS

---

# Skills Learned

- Backup planning
- Backup vault management
- Recovery point management
- Automated backup scheduling
- Disaster recovery fundamentals
- Backup monitoring
- Resource restoration

---

# Key Takeaways

- AWS Backup provides centralized backup management.
- Backup Vaults securely store recovery points.
- Backup Plans automate protection policies.
- Recovery Points simplify disaster recovery.
- AWS Backup integrates with multiple AWS services.

---

# Conclusion

In this lab, I successfully configured AWS Backup by creating a backup vault, defining a backup plan, assigning AWS resources, performing backups, monitoring backup jobs, and restoring resources. This hands-on exercise strengthened my understanding of cloud backup strategies, disaster recovery, and automated data protection in AWS.