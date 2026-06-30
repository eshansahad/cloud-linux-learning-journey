# Day 21 — AWS Billing, Budgets & IAM Fundamentals

**Date:** June 30, 2026

---

# Overview

Today's session introduced the fundamentals of AWS account governance and identity management.

The labs focused on:

- AWS Billing and Cost Management
- AWS Budgets
- Budget Alerts
- AWS Identity and Access Management (IAM)
- IAM Users
- IAM Roles
- IAM Policies
- AWS STS (Security Token Service)
- Principle of Least Privilege

These services form the foundation of secure AWS administration.

---

# Part 1 — AWS Cost Management & Budgets

## Why Budgets?

Cloud resources are billed based on usage.

Without monitoring costs, unexpected charges may occur.

AWS Budgets helps administrators:

- Monitor monthly spending
- Receive email alerts
- Forecast future spending
- Stay within planned budgets

---

## Budget Types

AWS provides multiple budget types:

- Cost Budget
- Usage Budget
- Reservation Budget
- Savings Plans Budget

Today's lab used:

**Cost Budget**

---

## Budget Configuration

Configured:

- Budget Type: Cost Budget
- Period: Monthly
- Renewal: Recurring
- Budget Amount: Fixed
- Scope: Entire AWS Account

---

## Alert Thresholds

Configured alerts:

| Alert | Trigger |
|--------|----------|
| 50% | Actual Spend |
| 80% | Actual Spend |
| 100% | Actual Spend |
| 110% | Forecasted Spend |

Email notifications were configured for each threshold.

---

# AWS Billing Dashboard

Used services:

- Billing Dashboard
- Cost Explorer
- AWS Budgets

Purpose:

Monitor overall account spending.

---

# Part 2 — AWS Identity & Access Management (IAM)

IAM allows administrators to securely manage access to AWS resources.

Core components include:

- Users
- Groups
- Roles
- Policies

---

# IAM User

Created an IAM user with:

- Console login
- Custom password
- No direct permissions

This demonstrates the Principle of Least Privilege.

---

# IAM Role

Created a role:

# S3-ReadOnly-Operational-Role

Attached managed policy:

# AmazonS3ReadOnlyAccess

Purpose:

Allow temporary read-only access to Amazon S3.

---

# IAM Policies

Instead of assigning permissions directly to the user,

an inline policy allowed the user to perform:

# sts:AssumeRole

This follows AWS security best practices.

---

# Security Token Service (STS)

AWS STS provides temporary security credentials.

Workflow:

IAM User

↓

Assume Role

↓

Temporary Credentials

↓

Access AWS Resources

---

# Principle of Least Privilege

Instead of giving permanent administrator permissions,

users receive only the permissions required for their task.

Benefits:

- Reduced attack surface
- Better auditing
- Temporary access
- Easier permission management

---

# Role Switching

Verified:

- Logged in as IAM User
- Switched Role
- Assumed S3 ReadOnly Role
- Successfully accessed S3 resources

---

# Services Learned

- AWS Billing
- AWS Cost Management
- AWS Budgets
- IAM
- IAM Users
- IAM Roles
- IAM Policies
- AWS STS
- Amazon S3 Permissions

---

# Key Takeaways

✅ Created monthly AWS budget

✅ Configured spending alerts

✅ Learned AWS billing management

✅ Created IAM User

✅ Created IAM Role

✅ Attached managed policies

✅ Used STS AssumeRole

✅ Verified role switching

✅ Understood least privilege model

---

# Commands Used

No AWS CLI commands were used.

Today's exercises were completed entirely through the AWS Management Console.

---

# Skills Practiced

- AWS Administration
- Cloud Governance
- Cost Optimization
- Identity Management
- Access Control
- IAM
- Cloud Security
- AWS Billing