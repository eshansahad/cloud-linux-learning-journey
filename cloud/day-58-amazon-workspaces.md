# Day 58 - Amazon WorkSpaces Virtual Desktop

> Learn how to create and access a cloud-based virtual desktop using Amazon WorkSpaces.

---

## Overview

Amazon WorkSpaces is a managed Desktop-as-a-Service (DaaS) solution that provides cloud-based virtual desktops to end users.

In this lab, I created and registered an AWS Directory Service Simple AD directory, created a WorkSpaces user, selected a Linux-based WorkSpace bundle, configured Auto Stop, launched the WorkSpace, connected through the Amazon WorkSpaces client, and verified the remote Ubuntu desktop environment.

---

## Objectives

- Understand Amazon WorkSpaces
- Create an AWS Directory Service directory
- Register the directory with WorkSpaces
- Create a WorkSpaces user
- Select a WorkSpace bundle
- Configure WorkSpace running mode
- Launch a virtual desktop
- Connect using the WorkSpaces client
- Verify remote desktop and internet access

---

# What is Amazon WorkSpaces?

Amazon WorkSpaces is a managed cloud desktop service that provides virtual desktops to users without requiring organizations to maintain physical desktop infrastructure.

Users can access their cloud desktops through supported WorkSpaces client applications.

---

# Key Components

### Directory

Provides identity and authentication services for WorkSpaces users.

### WorkSpace

A cloud-based virtual desktop assigned to an individual user.

### Bundle

Defines the operating system and hardware resources provided to a WorkSpace.

### WorkSpaces Client

The client application used by end users to connect to their assigned cloud desktop.

---

# Hands-on Lab

## Task 1 – Create a Simple AD Directory

Configured:

- Opened Amazon WorkSpaces
- Selected Personal WorkSpace deployment
- Selected AWS Directory Service for device management
- Created a new directory through AWS Directory Service
- Selected Simple AD
- Selected the Small directory size
- Organization name: `corp-internship`
- Directory DNS name: `corp.internship.local`
- Configured the administrator password
- Selected the target VPC and two subnets

The Simple AD directory was successfully created. :contentReference[oaicite:1]{index=1}

---

## Task 2 – Register the Directory

Performed:

- Returned to the WorkSpaces directory configuration
- Refreshed the available directories
- Selected `corp.internship.local`
- Selected two public subnets
- Enabled default internet access
- Registered the directory with Amazon WorkSpaces

:contentReference[oaicite:2]{index=2}

---

## Task 3 – Create a WorkSpaces User

Configured a user account for WorkSpaces access.

The user was created within the directory and assigned credentials for authentication.

---

## Task 4 – Select the WorkSpace Bundle

Configured:

- Selected a Linux-based WorkSpaces bundle
- Operating system: Ubuntu 22.04
- Bundle: Standard with Ubuntu
- Configured the available compute and storage resources

The lab used a persistent Personal WorkSpace. :contentReference[oaicite:3]{index=3}

---

## Task 5 – Configure Running Mode

Configured:

- Selected **Auto stop**
- Auto stop period: 1 hour of inactivity

This configuration was used to help control resource usage and running costs. :contentReference[oaicite:4]{index=4}

---

## Task 6 – Launch the WorkSpace

Performed:

- Reviewed the WorkSpace configuration
- Selected Create WorkSpaces
- Waited for provisioning to complete
- Verified the WorkSpace transitioned from Pending to Available

:contentReference[oaicite:5]{index=5}

---

## Task 7 – Connect Using the WorkSpaces Client

Performed:

- Downloaded and installed the Amazon WorkSpaces Client
- Entered the WorkSpace registration code
- Registered the client
- Entered the assigned user credentials
- Signed in successfully

:contentReference[oaicite:6]{index=6}

---

## Task 8 – Verify the Remote Desktop

Verified:

- Ubuntu desktop loaded successfully
- Persistent storage mounts were available
- Remote desktop access was functional
- Outbound internet connectivity was available
- The WorkSpace was successfully usable as a cloud desktop

The completed environment provided a persistent Ubuntu virtual desktop with the configured Auto Stop mode. :contentReference[oaicite:7]{index=7}

---

# AWS Services & Tools Used

- Amazon WorkSpaces
- AWS Directory Service
- Simple AD
- Amazon VPC
- Amazon WorkSpaces Client

---

# Skills Learned

- Virtual desktop infrastructure
- Amazon WorkSpaces administration
- Directory Service configuration
- Simple AD management
- User provisioning
- WorkSpace bundle selection
- Cloud desktop deployment
- Remote desktop access

---

# Key Takeaways

- Amazon WorkSpaces provides managed cloud-based virtual desktops.
- AWS Directory Service can provide the directory infrastructure required for WorkSpaces.
- Personal WorkSpaces provide dedicated persistent desktops.
- WorkSpace bundles determine operating system and resource configuration.
- Auto Stop can help control running costs.
- The WorkSpaces Client provides secure access to the assigned cloud desktop.

---

# Conclusion

In this lab, I successfully deployed a cloud-based Ubuntu virtual desktop using Amazon WorkSpaces. I created a Simple AD directory, registered it with WorkSpaces, configured a user, selected a Linux WorkSpace bundle, enabled Auto Stop, launched the WorkSpace, and connected successfully using the Amazon WorkSpaces Client.

This hands-on exercise strengthened my understanding of cloud desktop infrastructure, directory services, user management, remote access, and managed virtual desktop deployment on AWS.