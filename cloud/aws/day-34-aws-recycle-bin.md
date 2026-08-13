# Day 34 - Amazon Recycle Bin Administration

> Learn how to protect deleted AWS resources by configuring Amazon Recycle Bin retention rules for EBS snapshots and AMIs.

---

## Overview

Amazon Recycle Bin is an AWS data protection service that allows administrators to recover accidentally deleted EBS snapshots and EBS-backed Amazon Machine Images (AMIs) within a configurable retention period. Instead of permanently deleting supported resources immediately, Recycle Bin retains them based on defined retention rules, improving disaster recovery and operational safety.

This lab demonstrates how to create a retention rule, protect EBS snapshots, verify deleted resources inside the Recycle Bin, and restore them successfully.

---

## Objectives

- Understand Amazon Recycle Bin
- Configure a retention rule
- Protect EBS snapshots
- Create a test snapshot
- Delete the snapshot
- Verify resource retention
- Restore the deleted snapshot
- Validate successful recovery

---

# What is Amazon Recycle Bin?

Amazon Recycle Bin is a recovery service that temporarily stores deleted supported AWS resources before permanent deletion.

It provides an additional layer of protection against accidental deletion by allowing administrators to restore resources within a predefined retention period.

---

# Supported Resources

Amazon Recycle Bin currently supports:

- Amazon EBS Snapshots
- Amazon EBS-backed Amazon Machine Images (AMIs)

---

# Hands-on Lab

## Task 1 – Create a Retention Rule

Configured the following:

- Created a retention rule
- Selected EBS Snapshots
- Configured a 1-day retention period
- Applied the rule to all resources
- Verified the rule status as Active

---

## Task 2 – Create and Delete a Test Snapshot

Performed the following:

- Created an EBS snapshot
- Waited for snapshot completion
- Deleted the snapshot
- Confirmed removal from the Snapshots dashboard

---

## Task 3 – Verify Resource in Recycle Bin

Verified:

- Deleted snapshot appeared under Amazon Recycle Bin
- Resource was retained according to the configured retention rule
- Snapshot remained recoverable during the retention period

---

## Task 4 – Restore the Snapshot

Successfully restored the deleted snapshot.

Verified:

- Snapshot restored successfully
- Resource returned to the EC2 Snapshots console
- Snapshot available for future volume restoration or reuse

---

# AWS Services Used

- Amazon Recycle Bin
- Amazon EC2
- Amazon EBS
- AWS IAM

---

# Skills Learned

- Data protection strategies
- Snapshot lifecycle management
- Retention rule configuration
- Backup recovery
- Disaster recovery planning
- EBS snapshot management

---

# Key Takeaways

- Amazon Recycle Bin protects supported AWS resources from accidental deletion.
- Retention rules determine how long deleted resources remain recoverable.
- Restoring deleted snapshots is quick and straightforward.
- Recycle Bin strengthens disaster recovery and operational resilience.
- Retention policies help improve backup management across AWS environments.

---

# Conclusion

In this lab, I successfully configured Amazon Recycle Bin by creating a retention rule, protecting EBS snapshots, deleting a test snapshot, verifying its availability in the Recycle Bin, and restoring it successfully. This exercise improved my understanding of AWS data protection, resource recovery, and disaster recovery best practices.