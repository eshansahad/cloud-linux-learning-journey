# Day 18 – Azure Security Services

**Date:** June 25, 2026

---

## Objective

Learn the core Azure security services used to protect identities, applications, networks, virtual machines, data, and cloud resources while ensuring security, governance, monitoring, and compliance.

---

# Azure Security Fundamentals

## Security Goals

Azure Security focuses on the CIA Triad:

- **Confidentiality** – Protect data from unauthorized access.
- **Integrity** – Ensure data is not altered improperly.
- **Availability** – Keep applications and services accessible.

---

# Microsoft Entra ID

## Purpose

Microsoft Entra ID (formerly Azure Active Directory) is Azure's Identity and Access Management (IAM) service.

### Features

- User Authentication
- Single Sign-On (SSO)
- Multi-Factor Authentication (MFA)
- Conditional Access
- Role-Based Access Control (RBAC)

### Use Cases

- User login
- Identity management
- Secure access to Azure resources

---

# Microsoft Defender for Cloud

## Purpose

Continuously monitors Azure resources and recommends security improvements.

### Features

- Secure Score
- Threat Detection
- Vulnerability Assessment
- Security Recommendations
- Compliance Monitoring

### Benefits

- Detects security weaknesses
- Improves cloud security posture

---

# Microsoft Sentinel

## Purpose

Cloud-native SIEM and SOAR solution for monitoring and responding to security threats.

### Features

- Log Collection
- Threat Detection
- Incident Investigation
- Automated Response

### Benefits

- Centralized security monitoring
- Faster incident response

---

# Azure Key Vault

## Purpose

Securely stores secrets and sensitive information.

### Stores

- Passwords
- API Keys
- Certificates
- Encryption Keys

### Benefits

- Protects application secrets
- Prevents hardcoded credentials

---

# Azure Firewall

## Purpose

Managed network firewall that filters inbound and outbound traffic.

### Features

- Inbound Filtering
- Outbound Filtering
- Threat Intelligence Filtering

### Benefits

- Centralized network protection
- Controls network traffic

---

# Network Security Group (NSG)

## Purpose

Controls inbound and outbound network traffic to Azure resources.

### Features

- Allow Rules
- Deny Rules
- Inbound Security Rules
- Outbound Security Rules

### Common Example

- Allow HTTP (80)
- Allow HTTPS (443)
- Block unnecessary ports

---

# Azure DDoS Protection

## Purpose

Protects applications from Distributed Denial-of-Service (DDoS) attacks.

### Features

- Attack Detection
- Automatic Mitigation
- Traffic Monitoring

### Benefits

- Maintains application availability
- Filters malicious traffic

---

# Azure Web Application Firewall (WAF)

## Purpose

Protects web applications against common web attacks.

### Protects Against

- SQL Injection
- Cross-Site Scripting (XSS)
- OWASP Top 10 Threats

### Benefits

- Improves web application security
- Blocks malicious requests

---

# Azure Bastion

## Purpose

Securely connect to Azure Virtual Machines using the Azure Portal.

### Features

- Browser-based RDP
- Browser-based SSH
- No Public IP Required

### Benefits

- Secure remote administration
- Reduces attack surface

---

# Azure Policy

## Purpose

Enforces governance and compliance rules across Azure resources.

### Examples

- Require resource tags
- Enforce encryption
- Restrict VM sizes

### Benefits

- Standardized deployments
- Improved compliance

---

# Azure Monitor

## Purpose

Monitors Azure resources and applications.

### Features

- Metrics
- Logs
- Alerts
- Dashboards

### Benefits

- Performance monitoring
- Proactive alerting

---

# Microsoft Purview

## Purpose

Provides data governance, classification, and compliance management.

### Features

- Data Discovery
- Data Classification
- Compliance Management

### Benefits

- Protects sensitive information
- Supports regulatory compliance

---

# Azure Security Services Summary

| Service | Purpose |
|----------|---------|
| Microsoft Entra ID | Identity and Access Management |
| Microsoft Defender for Cloud | Security Posture Management |
| Microsoft Sentinel | SIEM and Threat Detection |
| Azure Key Vault | Secure Storage of Secrets |
| Azure Firewall | Network Traffic Filtering |
| Network Security Group | Resource-Level Traffic Control |
| Azure DDoS Protection | DDoS Attack Mitigation |
| Azure Web Application Firewall | Web Application Protection |
| Azure Bastion | Secure VM Access |
| Azure Policy | Governance and Compliance |
| Azure Monitor | Monitoring and Alerts |
| Microsoft Purview | Data Governance |

---

# Security Architecture

```text
                    Users
                      │
        Microsoft Entra ID (Authentication)
                      │
        +-------------------------------+
        |                               |
 Azure Firewall                    Azure Policy
        │                               │
 Network Security Group          Governance Rules
        │
 Azure Resources (VMs, Apps, Databases)
        │
+-------------------------------+
| Defender | Sentinel | Monitor |
+-------------------------------+
        │
 Azure Key Vault (Secrets)
        │
 Microsoft Purview (Data Governance)
```

---

# Key Learning Outcomes

- Understood Azure security fundamentals
- Learned Identity and Access Management using Microsoft Entra ID
- Explored Microsoft Defender for Cloud
- Studied Microsoft Sentinel for threat detection
- Learned secure secret management with Azure Key Vault
- Configured Azure Firewall and Network Security Groups
- Understood Azure DDoS Protection and Web Application Firewall
- Learned secure VM access using Azure Bastion
- Explored governance using Azure Policy
- Learned monitoring with Azure Monitor
- Understood data governance using Microsoft Purview

---

# Summary

In this session, I learned about Azure Security Services that protect identities, applications, networks, virtual machines, and data. I explored identity management, threat detection, firewall services, secret management, governance, monitoring, and compliance solutions. These services work together to build a secure, reliable, and well-governed Azure cloud environment.