# Day 45 - Automated S3-to-SNS Event Notification

> Learn how to configure an event-driven notification workflow that automatically sends an email when a file is uploaded to an Amazon S3 bucket.

---

## Overview

Amazon S3 can generate event notifications when objects are created or modified. These events can be sent to Amazon SNS, which can then distribute the notification to subscribed endpoints.

In this lab, I created an Amazon S3 bucket, configured an SNS topic with an email subscription, authorized Amazon S3 to publish to the topic, configured an S3 ObjectCreated event notification, and verified the complete workflow by uploading a test file and receiving an automated email notification.

---

## Objectives

- Create an Amazon S3 bucket
- Create an Amazon SNS topic
- Configure an email subscription
- Confirm the email subscription
- Configure an SNS access policy
- Configure S3 event notifications
- Trigger an event when an object is uploaded
- Verify the automated email notification

---

# What is S3 Event Notification?

Amazon S3 Event Notifications allow S3 to automatically send notifications when specific events occur in a bucket.

For example, an `ObjectCreated:Put` event can trigger a notification whenever a new object is uploaded.

In this lab, the event was routed through Amazon SNS to an email subscriber.

---

# Architecture

```text
File Upload
     ↓
Amazon S3 Bucket
     ↓
S3 ObjectCreated Event
     ↓
Amazon SNS Topic
     ↓
Email Subscription
     ↓
Email Notification
```

---

# Hands-on Lab

## Task 1 – Create an Amazon S3 Bucket

Configured:

- Created an S3 bucket
- Used a globally unique bucket name
- Kept the default security settings
- Verified successful bucket creation

---

## Task 2 – Create an SNS Topic and Email Subscription

Performed:

- Created a Standard SNS topic
- Created an email subscription
- Confirmed the subscription through the receiving email inbox
- Verified the subscription became active

The SNS topic used for the workflow was:

```text
s3-upload-alerts-topic
```

---

## Task 3 – Configure the SNS Access Policy

Configured an SNS access policy allowing Amazon S3 to publish messages to the SNS topic.

The policy used:

- Amazon S3 as the publishing service
- `SNS:Publish` permission
- The S3 bucket ARN as the source condition
- The SNS topic ARN as the destination

This allowed the S3 service to communicate with the SNS topic successfully. :contentReference[oaicite:1]{index=1} :contentReference[oaicite:2]{index=2}

---

## Task 4 – Configure S3 Event Notifications

Configured:

- Opened the S3 bucket Properties
- Navigated to Event notifications
- Created an event notification
- Event notification name: `S3ObjectCreatedAlert`
- Selected the Object creation event
- Selected the PUT event type
- Configured SNS as the destination
- Selected the previously created SNS topic

:contentReference[oaicite:3]{index=3} :contentReference[oaicite:4]{index=4}

---

## Task 5 – Test and Verify the Notification

Performed:

- Uploaded a test file to the S3 bucket
- Triggered the S3 ObjectCreated event
- S3 published the event to the SNS topic
- SNS delivered the notification to the subscribed email address

Verified the email notification contained event information including:

- Event name
- Timestamp
- S3 bucket name
- Uploaded object key

:contentReference[oaicite:5]{index=5}

---

# AWS Services Used

- Amazon S3
- Amazon SNS
- AWS Management Console

---

# Skills Learned

- S3 event notifications
- SNS topic configuration
- SNS subscription management
- IAM-style access policy configuration
- Event-driven architecture
- Service-to-service communication
- Automated email notifications

---

# Key Takeaways

- Amazon S3 can automatically generate events when objects are created.
- SNS can distribute S3 events to subscribed endpoints.
- Service permissions must allow S3 to publish to the SNS topic.
- Event-driven architectures can automate operational notifications.
- S3 and SNS can be combined to create simple, serverless notification workflows.

---

# Conclusion

In this lab, I successfully created an event-driven notification workflow using Amazon S3 and Amazon SNS. A file upload to the S3 bucket triggered an ObjectCreated event, which was published to an SNS topic and delivered as an automated email notification.

This hands-on exercise strengthened my understanding of event-driven cloud architectures, S3 event notifications, SNS messaging, access policies, and automated AWS service integration.