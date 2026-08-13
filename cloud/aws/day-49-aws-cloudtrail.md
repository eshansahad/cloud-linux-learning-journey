# Day 49 - AWS CloudTrail Monitoring and Governance

> Learn how to monitor and track AWS account activity using AWS CloudTrail.

---

## Overview

AWS CloudTrail is a monitoring and governance service that records API activity and actions performed within an AWS account. It provides visibility into who performed an action, what resource was affected, when the action occurred, and other details associated with the API request.

In this lab, I created a CloudTrail trail, configured an Amazon S3 bucket for log storage, enabled logging, performed AWS activities, and reviewed the recorded events through the CloudTrail Event History.

---

## Objectives

- Understand AWS CloudTrail
- Create a CloudTrail trail
- Configure Amazon S3 log storage
- Enable CloudTrail logging
- Perform AWS resource activities
- View recorded API events
- Identify user actions and AWS service activity

---

# What is AWS CloudTrail?

AWS CloudTrail is a service that records AWS API calls and account activity.

It provides an audit trail of actions performed through:

- AWS Management Console
- AWS CLI
- AWS SDKs
- AWS APIs
- Other AWS services

CloudTrail is commonly used for security auditing, governance, troubleshooting, and operational monitoring.

---

# Key Components

### Trail

A configuration that enables CloudTrail events to be continuously delivered to a selected destination such as Amazon S3.

### Event History

Provides a searchable record of recent management events within an AWS account.

### CloudTrail Logs

Detailed records containing information about API activity and the resources affected by those actions.

---

# Hands-on Lab

## Task 1 – Create a CloudTrail Trail

Configured:

- Opened the AWS CloudTrail Console
- Selected Create trail
- Trail name: `security-audit-lab-trail`
- Configured an S3 bucket as the log destination
- Enabled management event logging
- Created the trail

:contentReference[oaicite:1]{index=1}

---

## Task 2 – Configure S3 Log Storage

Performed:

- Created an S3 bucket for CloudTrail logs
- Allowed CloudTrail to deliver log files to the bucket
- Verified the trail was configured with the S3 destination

The S3 bucket provides persistent storage for CloudTrail log files.

---

## Task 3 – Enable Logging

Verified:

- CloudTrail trail was active
- Logging was enabled
- Management events were being recorded
- Log delivery was configured successfully

---

## Task 4 – Generate AWS Activity

Performed several AWS management operations to generate CloudTrail events.

Activities included:

- Creating an EC2 resource
- Creating an S3 bucket
- Deleting a resource

These actions were used to generate events that could be reviewed through CloudTrail.

---

## Task 5 – Review CloudTrail Events

Performed:

- Opened CloudTrail Event History
- Filtered and reviewed recent events
- Examined recorded API activity
- Identified the user or service responsible for the action
- Reviewed the affected AWS resource
- Checked event timestamps and API operation details

---

# AWS Services Used

- AWS CloudTrail
- Amazon S3
- Amazon EC2
- AWS Management Console

---

# Skills Learned

- AWS activity monitoring
- CloudTrail trail configuration
- Audit log management
- API event analysis
- S3 log storage
- Cloud governance
- Security auditing
- AWS troubleshooting

---

# Key Takeaways

- AWS CloudTrail provides visibility into AWS account activity.
- API calls can be reviewed through CloudTrail Event History.
- Trails can deliver logs to Amazon S3 for long-term storage.
- CloudTrail is useful for security auditing and governance.
- Recorded events help identify who performed an action, what happened, and when it occurred.

---

# Conclusion

In this lab, I successfully configured AWS CloudTrail by creating a trail, setting up an Amazon S3 bucket for log storage, enabling logging, generating AWS activity, and reviewing the resulting API events.

This hands-on exercise strengthened my understanding of AWS auditing, activity monitoring, governance, and security visibility.