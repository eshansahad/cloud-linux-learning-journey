# Day 13 — Azure App Service, Function App & Logic Apps

**Date:** June 18, 2026

## Objective

Learn Azure services used for hosting applications, running serverless code, and automating workflows.

---

## Azure App Service

Azure App Service is a fully managed Platform as a Service (PaaS) used to host web applications and APIs without managing servers.

### Features

- Fully managed hosting
- Automatic scaling
- Load balancing
- High availability
- Custom domains and SSL support
- Continuous deployment

### Supported Languages

- .NET
- Java
- Python
- PHP
- Node.js
- Ruby

### Use Cases

- Company websites
- E-commerce applications
- Employee portals
- REST APIs
- Mobile backends

### Memory Tip

> App Service = Website / API Hosting

---

## Azure Function App

Azure Function App is a serverless compute service that executes code when triggered by events.

### Common Triggers

- HTTP Trigger
- Blob Storage Trigger
- Timer Trigger
- Queue Trigger
- Event Grid Trigger

### Example Workflow

```
File Upload
    ↓
Function Triggered
    ↓
Process File
    ↓
Save Output
```

### Use Cases

- Automation
- Scheduled jobs
- File processing
- Notifications
- API endpoints

### Advantages

- Pay only when used
- Automatic scaling
- No server management

### Memory Tip

> Function App = Code on Trigger

---

## Azure Logic Apps

Azure Logic Apps is a low-code/no-code service used to automate workflows and integrate applications.

### Common Connectors

- Microsoft 365
- Outlook
- Teams
- SharePoint
- SQL Server
- Salesforce
- Azure Storage

### Example Workflow

```
Receive Email
      ↓
Save Attachment
      ↓
Send Teams Notification
      ↓
Create Ticket
```

### Use Cases

- Approval workflows
- Business automation
- Email notifications
- Data synchronization
- Application integration

### Advantages

- Low-code development
- Fast workflow creation
- Hundreds of connectors

### Memory Tip

> Logic Apps = Workflow Automation

---

## Comparison

| Feature | App Service | Function App | Logic Apps |
|----------|------------|-------------|------------|
| Purpose | Host Web Apps & APIs | Run Event-Driven Code | Automate Workflows |
| Coding Required | Yes | Yes | Minimal |
| Server Management | No | No | No |
| Trigger Based | No | Yes | Yes |
| Best For | Websites & APIs | Serverless Processing | Business Automation |

---

## When to Use

### Use App Service

- Host websites
- Host web applications
- Host REST APIs

### Use Function App

- Run code on events
- Process files automatically
- Schedule background tasks

### Use Logic Apps

- Automate workflows
- Integrate services
- Create approval processes

---

## Quick Revision

- Azure App Service → Hosts websites and APIs.
- Azure Function App → Runs serverless code when triggered.
- Azure Logic Apps → Automates workflows using visual design.

---

## Key Interview Question

**What is the difference between Azure App Service, Function App, and Logic Apps?**

- App Service hosts web applications and APIs.
- Function App executes event-driven serverless code.
- Logic Apps automate workflows using a low-code approach.

---

## Outcome

Successfully learned:

- Azure App Service
- Azure Function App
- Azure Logic Apps
- Serverless Computing Concepts
- Workflow Automation Basics
.