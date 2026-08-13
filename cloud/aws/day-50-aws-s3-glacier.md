# Day 50 - Amazon S3 Glacier & Lifecycle Management

> Learn how to configure Amazon S3 Glacier for long-term archival storage and manage object lifecycle transitions.

---

## Overview

Amazon S3 Glacier storage classes provide low-cost storage for data that does not require frequent access. They are designed for long-term archival and backup workloads.

In this lab, I created an Amazon S3 bucket, uploaded objects using different storage classes, configured a lifecycle rule to transition objects to Glacier Flexible Retrieval, verified the storage classes, and tested the restoration process for archived data.

---

## Objectives

- Understand Amazon S3 Glacier
- Create an Amazon S3 bucket
- Upload objects to S3
- Store objects using Glacier storage
- Configure an S3 lifecycle rule
- Transition objects to Glacier Flexible Retrieval
- Verify object storage classes
- Test the restore process

---

# What is Amazon S3 Glacier?

Amazon S3 Glacier is a set of Amazon S3 storage classes designed for long-term archival data.

It provides cost-effective storage for data that is rarely accessed but still needs to be retained for future recovery or compliance requirements.

---

# Key Features

- Low-cost archival storage
- Long-term data retention
- Lifecycle-based archival
- Multiple retrieval options
- Integration with Amazon S3
- Suitable for backup and compliance data

---

# Hands-on Lab

## Task 1 – Create an Amazon S3 Bucket

Configured:

- Created a new S3 bucket
- Used a unique bucket name
- Selected the required AWS Region
- Kept Block Public Access enabled
- Verified successful bucket creation

---

## Task 2 – Upload Objects

Performed:

- Uploaded a sample file using the default S3 Standard storage class
- Uploaded another archive file
- Selected **Glacier Flexible Retrieval** as the storage class for the archive
- Verified successful uploads

The lab used sample objects to demonstrate the difference between standard and archival storage. :contentReference[oaicite:1]{index=1}

---

## Task 3 – Configure a Lifecycle Policy

Created a lifecycle rule with:

- Rule name: `TransitionToGlacier`
- Scope: All objects in the bucket
- Action: Transition current object versions
- Target storage class: Glacier Flexible Retrieval
- Transition period: 1 day after object creation

This allows objects initially stored in S3 Standard to be automatically transitioned to Glacier Flexible Retrieval after the configured period. :contentReference[oaicite:2]{index=2}

---

## Task 4 – Verify Storage Classes

Verified the objects through the S3 Objects interface.

The storage classes were checked to confirm:

- Active project data → S3 Standard
- Historical archive → Glacier Flexible Retrieval

---

## Task 5 – Test Object Restoration

Performed:

- Selected the archived object
- Opened the Actions menu
- Selected Initiate restore
- Configured the restored copy availability period
- Selected the appropriate retrieval tier
- Initiated the restore process

The restore status was then monitored until the archived object became available for access. :contentReference[oaicite:3]{index=3}

---

# AWS Services Used

- Amazon S3
- Amazon S3 Glacier Flexible Retrieval

---

# Skills Learned

- S3 storage class management
- Glacier archival storage
- Lifecycle policy configuration
- Automated object transitions
- Data archival
- Object restoration
- Cloud storage cost optimization

---

# Key Takeaways

- S3 Glacier is designed for long-term archival storage.
- S3 Lifecycle rules can automatically transition objects between storage classes.
- Glacier Flexible Retrieval provides an archival storage option for infrequently accessed data.
- Archived objects must be restored before they can be accessed normally.
- Lifecycle policies help automate storage management and optimize costs.

---

# Conclusion

In this lab, I successfully configured Amazon S3 Glacier storage by creating an S3 bucket, uploading objects using different storage classes, creating a lifecycle rule for automatic transition to Glacier Flexible Retrieval, verifying the storage classes, and initiating the restoration of an archived object.

This hands-on exercise strengthened my understanding of cloud archival storage, lifecycle management, data recovery, and storage cost optimization using Amazon S3.