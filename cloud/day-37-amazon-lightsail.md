# Day 37 - Amazon Lightsail WordPress Deployment

> Learn how to deploy and manage a WordPress website using Amazon Lightsail with a pre-configured application blueprint.

---

## Overview

Amazon Lightsail is a simplified cloud platform that enables developers and beginners to quickly deploy virtual private servers, databases, storage, and web applications with predictable monthly pricing. It combines compute, networking, storage, and DNS management into an easy-to-use service.

In this lab, I launched a WordPress instance using the Lightsail blueprint, connected to the instance through the browser-based SSH terminal, retrieved the administrator password, accessed the WordPress dashboard, and verified the successful deployment of the website.

---

## Objectives

- Understand Amazon Lightsail
- Launch a Lightsail instance
- Deploy a WordPress application
- Connect using the browser-based SSH terminal
- Retrieve the WordPress administrator password
- Access the WordPress Admin Dashboard
- Verify successful website deployment

---

# What is Amazon Lightsail?

Amazon Lightsail is a simplified cloud computing service designed for developers, students, and small businesses. It provides virtual servers, storage, databases, networking, and DNS management through a simple interface with fixed monthly pricing.

Lightsail is ideal for quickly deploying websites, blogs, CMS platforms such as WordPress, and small web applications without managing complex AWS infrastructure.

---

# Key Features

- Simple virtual private servers
- Fixed monthly pricing
- One-click application deployment
- Built-in networking and firewall
- Static IP support
- DNS management
- Automatic snapshots

---

# Hands-on Lab

## Task 1 – Create a Lightsail Instance

Configured the following:

- Created a Lightsail instance
- Selected the WordPress blueprint
- Selected the desired AWS Region
- Chose the default instance plan
- Launched the instance successfully

---

## Task 2 – Connect via Browser-based SSH

Performed:

- Opened the integrated SSH terminal
- Connected securely to the instance
- Verified successful server access

---

## Task 3 – Retrieve the WordPress Administrator Password

Executed the required command to retrieve the default administrator password.

Verified:

- Username available
- Password generated successfully
- Credentials ready for login

---

## Task 4 – Access the WordPress Dashboard

Performed:

- Opened the public IP address in a browser
- Navigated to `/wp-admin`
- Logged in using the retrieved credentials
- Verified successful access to the WordPress Admin Dashboard

---

## Task 5 – Verify Deployment

Verified:

- WordPress website is accessible
- Administrator dashboard is functional
- Instance is running successfully
- Public IP is reachable

---

# AWS Services Used

- Amazon Lightsail
- WordPress
- Browser-based SSH
- Linux Server

---

# Skills Learned

- Cloud server provisioning
- WordPress deployment
- Browser-based SSH access
- Linux server administration
- Website hosting
- Lightsail management
- Basic cloud networking

---

# Key Takeaways

- Amazon Lightsail simplifies cloud application deployment.
- WordPress can be deployed within minutes using application blueprints.
- Browser-based SSH provides secure server access without additional software.
- Lightsail combines compute, storage, and networking into a beginner-friendly platform.
- It is an excellent service for hosting small websites and learning cloud fundamentals.

---

# Conclusion

In this lab, I successfully deployed a WordPress website using Amazon Lightsail, connected to the server using the browser-based SSH terminal, retrieved the administrator credentials, and accessed the WordPress dashboard. This hands-on exercise strengthened my understanding of simplified cloud hosting, Linux server management, and web application deployment using AWS.