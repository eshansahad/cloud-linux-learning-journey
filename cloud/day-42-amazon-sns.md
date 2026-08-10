# Day 42 - Amazon Simple Notification Service (SNS)

> Learn how to create an Amazon SNS topic and configure email notifications for cloud events.

---

## Overview

Amazon Simple Notification Service (SNS) is a fully managed messaging service that enables applications and AWS services to send notifications to multiple subscribers through different communication protocols.

In this lab, I created a Standard SNS topic, configured an email subscription, confirmed the subscription through the receiving email inbox, and verified that the subscription became active.

---

## Objectives

- Understand Amazon SNS
- Create an SNS topic
- Configure an email subscription
- Confirm the subscription
- Verify the active subscription
- Understand event notification workflows

---

# What is Amazon SNS?

Amazon Simple Notification Service (SNS) is a managed publish/subscribe messaging service used to distribute messages and notifications to multiple subscribers.

An SNS topic acts as a central communication point where publishers send messages and subscribers receive them through configured delivery protocols.

---

# Key Components

### SNS Topic

A logical access point used to publish and distribute messages.

### Publisher

An application or AWS service that sends messages to an SNS topic.

### Subscriber

An endpoint that receives messages published to an SNS topic.

### Subscription

Defines how a subscriber receives messages from an SNS topic.

---

# Hands-on Lab

## Task 1 – Create an SNS Topic

Configured:

- Opened the Amazon SNS Console
- Created a Standard topic
- Named the topic `Cloud-Event-Notifications`
- Configured the topic using the default settings
- Verified successful topic creation

---

## Task 2 – Create an Email Subscription

Performed:

- Opened the topic details
- Selected Create subscription
- Selected the Email protocol
- Entered the email endpoint
- Created the subscription

The subscription initially appeared with a **Pending confirmation** status.

---

## Task 3 – Confirm the Subscription

Performed:

- Opened the receiving email inbox
- Located the AWS subscription confirmation email
- Opened the confirmation message
- Selected the confirmation link

---

## Task 4 – Verify the Subscription

Verified:

- Subscription confirmation completed successfully
- Subscription status changed from **Pending confirmation** to **Confirmed**
- Email endpoint became active
- Topic was ready to deliver published messages

---

# AWS Services Used

- Amazon SNS
- Amazon SNS Topics
- Amazon SNS Email Subscription

---

# Skills Learned

- SNS topic management
- Publish/subscribe architecture
- Email notification configuration
- Subscription management
- Event-driven communication
- AWS messaging services

---

# Key Takeaways

- Amazon SNS provides a centralized publish/subscribe messaging architecture.
- Topics act as communication hubs between publishers and subscribers.
- SNS supports multiple delivery protocols.
- Email subscriptions require endpoint confirmation before becoming active.
- SNS can be integrated with other AWS services to create event-driven notification systems.

---

# Conclusion

In this lab, I successfully created an Amazon SNS Standard topic, configured an email subscription, confirmed the subscription through the receiving email inbox, and verified that the subscription became active. This hands-on exercise strengthened my understanding of publish/subscribe messaging and event-driven notification architectures on AWS.