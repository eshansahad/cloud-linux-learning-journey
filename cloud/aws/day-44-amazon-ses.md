# Day 44 - Amazon Simple Email Service (SES)

> Learn how to configure Amazon SES for sending application-based email notifications.

---

## Overview

Amazon Simple Email Service (SES) is a cloud-based email service that enables applications and services to send transactional, notification, and other types of email messages.

In this lab, I configured Amazon SES by verifying an email identity, working with the SES sandbox environment, sending a test email through the AWS Management Console, and verifying successful email delivery.

---

## Objectives

- Understand Amazon SES
- Verify an email identity
- Configure SES sandbox access
- Send a test email
- Verify successful email delivery
- Understand email sending workflows

---

# What is Amazon SES?

Amazon Simple Email Service (SES) is a scalable email service provided by AWS for sending application-based emails.

It can be used for:

- Transactional emails
- Notifications
- Alerts
- Password reset emails
- Application-generated messages
- Marketing communications

---

# Key Components

### Email Identity

An email address or domain that is verified before it can be used for sending email.

### SES Sandbox

A restricted environment designed for testing email sending before production access is granted.

### Verified Sender

An email identity that has been successfully verified and can be used as the sender of test emails.

---

# Hands-on Lab

## Task 1 – Verify an Email Identity

Performed:

- Opened the Amazon SES Console
- Navigated to Verified identities
- Selected Create identity
- Selected Email address
- Entered the email address
- Created the identity
- Verified the email using the confirmation message

---

## Task 2 – Configure SES Sandbox

Verified the SES account environment and understood the restrictions applied while operating within the SES sandbox.

The sandbox requires recipient email identities to be verified before sending test messages.

---

## Task 3 – Send a Test Email

Configured:

- Selected the verified sender address
- Selected the Formatted email option
- Used a custom test scenario
- Entered the verified recipient address
- Added the subject:

`Amazon SES Lab Test Email`

- Added a test message body
- Sent the test email through the SES Console

---

## Task 4 – Verify Email Delivery

Performed:

- Opened the recipient email inbox
- Located the test message
- Verified successful delivery
- Confirmed that Amazon SES successfully processed the email

---

# AWS Services Used

- Amazon Simple Email Service (SES)
- AWS Management Console

---

# Skills Learned

- Email identity verification
- Amazon SES configuration
- SES sandbox management
- Transactional email concepts
- Application email notifications
- Email delivery verification

---

# Key Takeaways

- Amazon SES provides scalable email-sending capabilities for applications.
- Email identities must be verified before they can be used for sending.
- SES sandbox mode provides a controlled environment for testing.
- Verified recipients can be used to validate email delivery during testing.
- SES can be integrated with applications to provide automated notifications.

---

# Conclusion

In this lab, I successfully configured Amazon SES by verifying an email identity, working within the SES sandbox environment, sending a test email through the AWS Management Console, and confirming successful delivery.

This hands-on exercise strengthened my understanding of cloud-based email services, identity verification, and application notification workflows using Amazon SES.