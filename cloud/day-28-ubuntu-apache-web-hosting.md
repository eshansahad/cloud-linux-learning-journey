# Day 28 — Hosting a Website on Ubuntu Server using Apache

**Date:** July 09, 2026

---

# Overview

Today's session focused on deploying a static website on an Ubuntu Server using the Apache HTTP Server. The lab covered preparing the Ubuntu environment, installing Apache2, securely transferring website files, configuring file permissions, creating an Apache Virtual Host, mapping a custom local domain, troubleshooting SSH connectivity, and verifying successful website hosting.

This exercise demonstrated the complete workflow of hosting a production-style static website on Linux using Apache and command-line administration.

---

# Topics Covered

- Ubuntu Server 24.04 LTS
- Apache HTTP Server (Apache2)
- OpenSSH Server
- SCP (Secure Copy Protocol)
- Static Website Deployment
- Virtual Hosts
- Apache Document Root
- File Permissions
- Linux Ownership
- Local DNS Mapping
- Hosts File Configuration
- Cross-Browser Testing
- Apache Service Management

---

# Practical Lab

## Lab 1 — Ubuntu Server Preparation

Updated the operating system.

```bash
sudo apt update
sudo apt upgrade -y
```

Prepared the Ubuntu Server for web hosting.

---

# Lab 2 — Install Apache Web Server

Installed Apache.

```bash
sudo apt install apache2 -y
```

Started and enabled Apache.

```bash
sudo systemctl start apache2

sudo systemctl enable apache2
```

Verified service status.

```bash
sudo systemctl status apache2
```

Successfully confirmed that Apache was running.

---

# Lab 3 — Transfer Website Source Code

Transferred the website from the Windows host to Ubuntu Server.

Methods practiced

- Secure Copy Protocol (SCP)
- VirtualBox Shared Folder

Example

```bash
scp -r CarVilla ubuntu@<Server-IP>:/home/vboxuser/
```

Verified successful file transfer.

---

# Lab 4 — Deploy Website

Installed unzip utility.

```bash
sudo apt install unzip -y
```

Extracted website files.

```bash
unzip WinWebsite.zip -d extracted_site
```

Removed the default Apache page.

```bash
sudo rm /var/www/html/index.html
```

Copied the website into Apache's document root.

```bash
sudo cp -r extracted_site/* /var/www/html/
```

Successfully replaced the default Apache landing page with the custom website.

---

# Lab 5 — Configure File Permissions

Assigned ownership to the Apache user.

```bash
sudo chown -R www-data:www-data /var/www/html/
```

Configured secure permissions.

```bash
sudo chmod -R 755 /var/www/html/
```

Verified that Apache could access all website files.

---

# Lab 6 — Create Apache Virtual Host

Created a new Virtual Host configuration.

```bash
sudo nano /etc/apache2/sites-available/linux-website.conf
```

Configured

- ServerName
- DocumentRoot
- Error Log
- Access Log

Enabled the website.

```bash
sudo a2ensite linux-website.conf
```

Reloaded Apache.

```bash
sudo systemctl reload apache2
```

---

# Lab 7 — Configure Local DNS Mapping

Modified the hosts file.

Windows

```
C:\Windows\System32\drivers\etc\hosts
```

Added

```
172.20.10.2 www.linux-internship.local
```

Verified successful name resolution using:

```cmd
ping www.linux-internship.local
```

Successfully accessed the website using the custom domain.

```
http://www.linux-internship.local
```

---

# Lab 8 — Website Testing

Verified

- Homepage loading
- CSS rendering
- Images
- Bootstrap layout
- Navigation links
- Browser compatibility
- Website accessibility

Confirmed successful deployment using both:

- Ubuntu Server IP
- Custom Local Domain

---

# Troubleshooting

## SSH Connection Refused

Problem

```
ssh: connect to host 172.xx.xx.xx port 22: Connection refused
```

Cause

OpenSSH Server was not installed.

Solution

```bash
sudo apt install openssh-server -y

sudo systemctl enable ssh

sudo systemctl start ssh
```

SSH connectivity was successfully restored. :contentReference[oaicite:1]{index=1}

---

## Apache Default Page

Removed

```bash
sudo rm /var/www/html/index.html
```

Copied the custom website.

---

## File Permission Issues

Resolved by assigning ownership to:

```
www-data
```

and applying

```
755
```

permissions.

---

## Virtual Host Verification

Verified Apache configuration.

```bash
sudo apache2ctl configtest
```

Reloaded Apache after successful validation.

---

# Commands Practiced

Update Ubuntu

```bash
sudo apt update
sudo apt upgrade -y
```

Install Apache

```bash
sudo apt install apache2 -y
```

Apache Service

```bash
sudo systemctl start apache2

sudo systemctl enable apache2

sudo systemctl status apache2
```

Transfer Files

```bash
scp
```

Permissions

```bash
sudo chown -R www-data:www-data /var/www/html/

sudo chmod -R 755 /var/www/html/
```

Enable Site

```bash
sudo a2ensite linux-website.conf
```

Reload Apache

```bash
sudo systemctl reload apache2
```

---

# Technologies Used

- Ubuntu Server 24.04 LTS
- Apache2
- OpenSSH Server
- SCP
- VirtualBox
- HTML
- CSS
- Bootstrap
- JavaScript

---

# Skills Learned

- Linux server administration
- Apache installation
- Website deployment
- Secure file transfer using SCP
- Apache Virtual Host configuration
- Linux file ownership
- File permission management
- Local DNS mapping
- Apache troubleshooting
- Static website hosting

---

# Key Takeaways

- Apache is one of the most widely used web servers for Linux environments.
- Correct file ownership (`www-data`) and permissions (`755`) are essential for successful deployments.
- Virtual Hosts allow multiple websites to be hosted on a single Apache server.
- Local DNS mapping using the hosts file is useful for development and testing.
- Linux web hosting relies heavily on command-line administration, making automation and scripting easier than GUI-based management.
- Troubleshooting services with `systemctl` and validating Apache configurations are core Linux administration skills.

---

# Lab Environment

| Component | Details |
|------------|---------|
| Operating System | Ubuntu Server 24.04 LTS |
| Web Server | Apache2 |
| Access Method | SSH |
| File Transfer | SCP / VirtualBox Shared Folder |
| Website Type | Static Bootstrap Website |
| Document Root | /var/www/html |
| Web User | www-data |
| Protocol | HTTP |
| Domain | www.linux-internship.local |

---

# Outcome

Successfully deployed a complete static website on Ubuntu Server using Apache HTTP Server, transferred source code securely, configured Linux file permissions, created an Apache Virtual Host, mapped a custom local domain, resolved SSH connectivity issues, and verified the website through both the server IP address and a custom local domain.