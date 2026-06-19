# Day 14 – Azure Application Hosting Services

**Date:** June 19, 2026

## Objective

Learn about Azure services used to host applications, APIs, containers, workflows, and static websites.

---

## Azure Application Hosting Services

Azure provides multiple services for hosting applications depending on the application type, architecture, and business requirements.

### Services Covered

1. Azure App Service
2. Azure Functions
3. Azure Logic Apps
4. Azure Spring Apps
5. Azure Container Apps
6. Azure Static Web Apps

---

## 1. Azure App Service

### Overview

Azure App Service is a fully managed Platform as a Service (PaaS) used to build, deploy, and scale web applications without managing servers.

### Supported Technologies

- .NET
- ASP.NET
- Java
- Python
- PHP
- Node.js
- Ruby

### Features

- Auto Scaling
- Load Balancing
- Custom Domains
- SSL Certificates
- Continuous Deployment
- Backup and Restore
- Authentication & Authorization

### Architecture

```
User
  ↓
Azure App Service
  ↓
Application
  ↓
Database
```

### Use Cases

- Business Websites
- E-commerce Applications
- REST APIs
- Enterprise Applications

### Advantages

- No server management
- Quick deployment
- High availability
- Built-in security

---

## 2. Azure Functions

### Overview

Azure Functions is a serverless compute service that runs code in response to events.

### Common Triggers

- HTTP Requests
- Blob Uploads
- Queue Messages
- Timer Events
- Database Events

### Features

- Serverless
- Pay-per-execution
- Automatic Scaling
- Event-driven Architecture

### Architecture

```
Event
  ↓
Azure Function
  ↓
Processing
  ↓
Output
```

### Use Cases

- File Processing
- Automation
- Notifications
- Scheduled Tasks

### Advantages

- Cost-effective
- No infrastructure management
- Automatic scaling

---

## 3. Azure Logic Apps

### Overview

Azure Logic Apps is a cloud service used to automate workflows and integrate applications with minimal coding.

### Features

- Drag-and-Drop Workflow Designer
- Hundreds of Connectors
- Workflow Automation
- Integration Services

### Popular Connectors

- Outlook
- Gmail
- SharePoint
- Microsoft Teams
- SQL Database
- Salesforce

### Example Workflow

```
Email Received
      ↓
Approval Process
      ↓
Notification Sent
```

### Use Cases

- Business Process Automation
- Approval Workflows
- Data Synchronization
- Notifications

### Advantages

- Low-code platform
- Easy integration
- Faster development

---

## 4. Azure Spring Apps

### Overview

Azure Spring Apps is a fully managed service for deploying Java Spring Boot and Spring Cloud applications.

### Features

- Managed Infrastructure
- Auto Scaling
- Service Discovery
- Configuration Management
- Monitoring & Logging
- CI/CD Integration

### Architecture

```
Users
  ↓
Spring Boot Application
  ↓
Azure Spring Apps
  ↓
Database / Storage / APIs
```

### Use Cases

- Banking Applications
- Enterprise Applications
- E-commerce Platforms
- Microservices

### Advantages

- Optimized for Spring Boot
- No infrastructure management
- Built-in monitoring
- High availability

### Limitations

- Mainly for Java applications
- Less flexible than AKS

---

## 5. Azure Container Apps

### Overview

Azure Container Apps is a serverless platform for running containerized applications without managing Kubernetes clusters.

### Features

- Serverless Containers
- Auto Scaling
- Scale to Zero
- HTTPS Support
- Dapr Integration
- Event-driven Scaling

### Architecture

```
Users
  ↓
Azure Container Apps
  ↓
Container Image
(Docker Hub / Azure Container Registry)
```

### Deployment Process

1. Create Docker Image
2. Push Image to Registry
3. Create Container App
4. Deploy Image
5. Access Application URL

### Use Cases

- APIs
- Microservices
- Background Jobs
- AI Applications
- Containerized Applications

### Advantages

- No Kubernetes management
- Cost-effective
- Supports any programming language

### Limitations

- Less control than AKS
- Not suitable for highly customized Kubernetes environments

---

## 6. Azure Static Web Apps

### Overview

Azure Static Web Apps is a service for hosting static websites and frontend applications.

### Supported Technologies

- HTML
- CSS
- JavaScript
- React
- Angular
- Vue.js
- Blazor

### Features

- Global CDN
- Free SSL
- GitHub Integration
- Azure DevOps Integration
- Automatic Deployment
- Authentication Support

### Architecture

```
Developer
    ↓
GitHub / Azure DevOps
    ↓
Azure Static Web Apps
    ↓
Users
```

### Deployment Process

1. Create Website Files
2. Push Code to GitHub
3. Connect Repository
4. Automatic Deployment
5. Access Website URL

### Use Cases

- Portfolio Websites
- Company Websites
- Landing Pages
- Documentation Sites
- Frontend Applications

### Advantages

- Fast Performance
- Low Cost
- Easy Deployment
- Global Availability

### Limitations

- Backend services cannot run directly
- Databases must be hosted separately

---

## Service Comparison

| Service | Purpose | Best For |
|----------|----------|----------|
| Azure App Service | Host web apps and APIs | Websites, APIs |
| Azure Functions | Event-driven serverless computing | Automation, Scheduled Tasks |
| Azure Logic Apps | Workflow automation | Business Processes |
| Azure Spring Apps | Java Spring Boot hosting | Enterprise Java Apps |
| Azure Container Apps | Container hosting | Docker Applications |
| Azure Static Web Apps | Frontend website hosting | React, Angular, HTML Sites |

---

## Key Interview Questions

### What is the difference between App Service and Container Apps?

App Service hosts application code directly, while Container Apps hosts containerized applications using Docker images.

### When should Azure Functions be used?

For event-driven execution and serverless computing scenarios.

### What is Scale-to-Zero?

Container instances automatically stop when there is no traffic, reducing costs.

### What is Azure Spring Apps used for?

Deploying and managing Java Spring Boot applications.

### Can Azure Static Web Apps host a Python application?

No. Static Web Apps are designed for frontend applications. Python applications should be hosted on App Service, Container Apps, or Functions.

### Which Azure service is best for workflow automation?

Azure Logic Apps.

### Which service is best for hosting a React application?

Azure Static Web Apps.

### Which service is best for hosting a Docker container?

Azure Container Apps.

---

## Summary

In this session, I learned about Azure's application hosting services and how different services are used for web applications, serverless computing, workflow automation, Java applications, containerized workloads, and static websites.

The service selection depends on application architecture, scalability requirements, development model, and operational needs.