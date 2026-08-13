# Day 25 — IIS Web Server Hosting on Windows Server

**Date:** July 07, 2026

---

# Overview

Today's session focused on deploying and managing a website using Microsoft Internet Information Services (IIS) on Windows Server. The lab covered installing the IIS Web Server role, configuring a website, transferring website files from the local machine to the Windows Server virtual machine, configuring the document root, troubleshooting common deployment issues, and successfully hosting a static website.

This lab introduced Windows Server web hosting concepts and demonstrated how IIS serves as Microsoft's enterprise web server for hosting websites, web applications, and enterprise services.

---

# Topics Covered

- Microsoft IIS (Internet Information Services)
- Windows Server 2022
- Web Server Role Installation
- Static Website Hosting
- Website Deployment
- IIS Manager
- Document Root
- Default Website
- File Transfer
- Virtual Machine File Sharing
- Windows Firewall
- HTTP Protocol
- Website Troubleshooting

---

# Practical Lab

## Lab 1 — Create Windows Server VM

Created a Windows Server virtual machine.

Configuration included:

- Windows Server 2022
- GUI Installation
- Administrator Account
- Remote Desktop Access

Verified successful login using Remote Desktop.

---

# Lab 2 — Install IIS

Opened **Server Manager**.

Installed:

- Web Server (IIS)
- IIS Management Console
- Static Content
- Default Document
- HTTP Logging

Verified installation by browsing:

```
http://localhost
```

The default IIS welcome page loaded successfully.

---

# Lab 3 — Prepare Website Files

Prepared a static HTML website.

Website included:

- HTML
- CSS
- Images
- JavaScript

---

# Lab 4 — Transfer Website Files

Transferred website files from the host machine to the Windows Server virtual machine.

Methods explored:

- VirtualBox Shared Folder
- Copy & Paste
- Drag and Drop

Successfully copied the complete website into the server.

---

# Lab 5 — Configure IIS Website

Replaced the default IIS website contents.

Copied website files into:

```
C:\inetpub\wwwroot
```

Verified that:

- index.html existed
- Images loaded correctly
- CSS files loaded successfully
- JavaScript executed correctly

---

# Lab 6 — Test Website

Opened a browser on the Windows Server.

Visited

```
http://localhost
```

The custom website loaded successfully.

Verified:

- Homepage
- Navigation
- Images
- Styling
- Responsive Layout

---

# Lab 7 — Access from Client Machine

Retrieved the server IP address.

Executed

```cmd
ipconfig
```

Opened a browser on another machine.

Visited

```
http://<server-ip>
```

Verified successful remote access to the hosted website.

---

# Troubleshooting Performed

During deployment several issues were encountered and resolved.

### Shared Folder Issues

Resolved VirtualBox shared folder mounting and permissions.

### Missing Website Files

Verified website directory structure before copying into IIS.

### IIS Default Page Display

Resolved by replacing the default contents inside:

```
C:\inetpub\wwwroot
```

### Firewall Configuration

Verified HTTP traffic was allowed through Windows Defender Firewall.

### Browser Cache

Performed hard refresh after updating website files.

---

# Tools Used

- Windows Server 2022
- IIS Manager
- Server Manager
- Remote Desktop
- VirtualBox
- File Explorer
- Windows Command Prompt

---

# Skills Learned

- Installing IIS
- Managing Windows Server roles
- Hosting static websites
- Deploying website files
- Configuring IIS document root
- Managing Windows web services
- Troubleshooting IIS deployment issues
- Accessing hosted websites remotely

---

# Key Takeaways

- IIS is Microsoft's enterprise-grade web server.
- Static websites can be deployed simply by copying files into the IIS document root.
- Windows Server Manager simplifies role-based server administration.
- Proper firewall configuration is essential for external website access.
- Troubleshooting file paths and permissions is a common part of web server administration.

---

# Lab Environment

| Component | Details |
|------------|---------|
| Cloud / Virtualization | Windows Server Virtual Machine |
| Operating System | Windows Server 2022 |
| Web Server | Microsoft IIS |
| Website Type | Static HTML Website |
| Access Method | Remote Desktop (RDP) |
| Deployment Folder | C:\inetpub\wwwroot |
| Protocol | HTTP |
| Browser | Microsoft Edge |

---

# Outcome

Successfully installed and configured Microsoft IIS on Windows Server, deployed a complete static website, verified local and remote accessibility, and resolved common deployment and configuration issues encountered during the hosting process.