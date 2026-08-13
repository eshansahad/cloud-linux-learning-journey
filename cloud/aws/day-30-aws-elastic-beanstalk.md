# Day 30 — AWS Elastic Beanstalk Application Deployment

**Date:** July 13, 2026

---

# Objective

Deploy a web application using AWS Elastic Beanstalk, configure a Web Server Environment, upload application code, monitor deployment, and verify successful access through a public Elastic Beanstalk URL.

---

# What is AWS Elastic Beanstalk?

AWS Elastic Beanstalk is a Platform as a Service (PaaS) that enables developers to deploy and manage web applications without manually configuring the underlying infrastructure.

Elastic Beanstalk automatically provisions and manages:

- Amazon EC2
- Elastic Load Balancer (when required)
- Auto Scaling
- Security Groups
- Monitoring
- Application Health

Developers simply upload their application, and AWS handles the deployment.

---

# Lab Overview

In this lab, I deployed a Node.js web application using AWS Elastic Beanstalk.

The deployment process included:

- Creating an Elastic Beanstalk application
- Creating a Web Server Environment
- Selecting the Node.js platform
- Uploading the application package
- Launching the environment
- Monitoring deployment events
- Accessing the application through the generated public URL

---

# Services Used

- AWS Elastic Beanstalk
- Amazon EC2
- IAM
- Security Groups
- Elastic IP
- Node.js Platform

---

# Task 1 — Create an Elastic Beanstalk Application

Created a new application from the Elastic Beanstalk console.

Configured:

- Application Name
- Web Server Environment
- Default settings

Environment Type:

```
Web Server Environment
```

---

# Task 2 — Select Platform

Selected:

```
Platform: Node.js
```

Used:

- Recommended Platform Version
- Default Platform Branch

The Node.js runtime environment was automatically configured.

---

# Task 3 — Upload Application Code

Uploaded a ZIP archive containing the application.

Configuration included:

- Version Label
- Local ZIP Upload
- Default Environment Configuration

If custom code is unavailable, Elastic Beanstalk also provides a sample application for deployment.

---

# Task 4 — Configure Environment

Used the default deployment settings.

AWS automatically configured:

- EC2 Instance
- IAM Roles
- Security Groups
- Elastic IP
- Networking
- Environment Health Monitoring

No manual infrastructure provisioning was required.

---

# Task 5 — Launch Environment

Created the environment.

Elastic Beanstalk automatically provisioned:

- EC2 Instance
- Security Groups
- Elastic IP
- Runtime Environment

Deployment required approximately 3–5 minutes.

---

# Task 6 — Monitor Deployment

Observed the Events tab.

Important deployment stages included:

- Environment Creation
- EC2 Launch
- Security Group Creation
- Elastic IP Allocation
- Application Deployment
- Environment Health Check

The deployment completed successfully when the Health status became:

```
Green (OK)
```

---

# Task 7 — Access the Application

Opened the generated Elastic Beanstalk domain.

Example:

```
https://application-name.region.elasticbeanstalk.com
```

Verified:

- Website loaded successfully
- Application responded correctly
- Public endpoint accessible
- Deployment completed successfully

---

# Behind the Scenes

Elastic Beanstalk automatically manages several AWS services:

- Amazon EC2
- IAM Roles
- Security Groups
- Elastic IP
- Auto Scaling
- CloudWatch Monitoring
- Load Balancer (when applicable)

This significantly simplifies application deployment.

---

# Advantages of Elastic Beanstalk

- Platform as a Service (PaaS)
- Easy application deployment
- Automatic infrastructure provisioning
- Health monitoring
- Automatic scaling support
- Environment management
- Version management
- AWS service integration

---

# Skills Learned

- AWS Elastic Beanstalk
- Platform as a Service (PaaS)
- Environment Creation
- Node.js Deployment
- Application Version Management
- Deployment Monitoring
- Environment Health Monitoring
- Public Application Hosting

---

# Outcome

Successfully deployed a Node.js web application using AWS Elastic Beanstalk.

AWS automatically provisioned the required infrastructure, deployed the application, monitored environment health, and exposed the application through a publicly accessible Elastic Beanstalk URL.

---

# Key Takeaways

- Elastic Beanstalk abstracts infrastructure management while retaining AWS flexibility.
- Applications can be deployed by simply uploading a ZIP package.
- Environment health can be monitored in real time through the Events dashboard.
- Elastic Beanstalk automatically provisions EC2 instances and networking resources.
- It provides a fast and scalable method for deploying web applications on AWS.