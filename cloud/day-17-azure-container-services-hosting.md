# Day 17 – Azure Container Services & Application Hosting Services

**Date:** June 24, 2026

---

## Objective

Learn the fundamentals of containers, Docker, Kubernetes, Azure Container Services, and Azure Application Hosting Services available in Microsoft Azure.

---

# Part 1 – Azure Container Services

## Topics Covered

- Containers
- Docker
- Containers vs Virtual Machines
- Kubernetes (K8s)
- Container Orchestration
- Azure Container Registry (ACR)
- Azure Container Instances (ACI)
- Azure Kubernetes Service (AKS)

---

## What is a Container?

A container is a lightweight package that contains:

- Application Code
- Runtime Environment
- Libraries
- Dependencies
- Configuration Files

Containers allow applications to run consistently across different environments.

### Benefits

- Portable
- Lightweight
- Fast Startup
- Efficient Resource Usage
- Consistent Deployments

---

## What is Docker?

Docker is a platform used to:

- Build Containers
- Run Containers
- Manage Container Lifecycle
- Share Container Images

### Docker Workflow

```text
Application
    ↓
Docker Image
    ↓
Docker Container
```

### Key Components

#### Docker Image

A template used to create containers.

Examples:

- Ubuntu
- NGINX
- Python

#### Docker Container

A running instance of a Docker Image.

```text
Docker Image + Run = Docker Container
```

---

## Containers vs Virtual Machines

### Virtual Machines

- Include Full Guest OS
- Higher Resource Usage
- Slower Startup
- Larger Size

### Containers

- Share Host OS
- Faster Startup
- Lightweight
- Better Resource Utilization

---

## What is Kubernetes?

Kubernetes (K8s) is an open-source container orchestration platform used to:

- Deploy Containers
- Scale Applications
- Manage Networking
- Automate Recovery
- Perform Load Balancing

---

## Container Orchestration

Container Orchestration is the automated management of containers.

### Functions

- Deployment
- Scaling
- Monitoring
- Networking
- Recovery
- Load Balancing

---

## Azure Container Registry (ACR)

### Purpose

Azure Container Registry is a private repository for storing Docker Images.

### Benefits

- Secure Storage
- Private Image Repository
- Version Management
- Integration with Azure Services

### Workflow

```text
Developer
    ↓
Docker Image
    ↓
Azure Container Registry
```

---

## Azure Container Instances (ACI)

### Purpose

Run containers without managing servers or Kubernetes clusters.

### Features

- Serverless
- Fast Deployment
- Pay-As-You-Go
- No Infrastructure Management

### Best For

- Testing
- Learning
- Small Applications
- Batch Jobs

---

## Azure Kubernetes Service (AKS)

### Purpose

Managed Kubernetes platform provided by Azure.

### Features

- Managed Kubernetes
- Auto Scaling
- Self-Healing
- Load Balancing
- Rolling Updates
- High Availability

### Best For

- Enterprise Applications
- Production Workloads
- Microservices
- Large Scale Deployments

---

## ACI vs AKS

| Feature | ACI | AKS |
|----------|----------|----------|
| Complexity | Simple | Advanced |
| Kubernetes Required | No | Yes |
| Scaling | Limited | Advanced |
| Cost | Lower | Higher |
| Best For | Small Apps | Enterprise Apps |

---

## Complete Container Workflow

```text
Application
     ↓
Docker
     ↓
Container Image
     ↓
Azure Container Registry (ACR)
     ↓
ACI / AKS
     ↓
Users
```

---

# Part 2 – Azure Application Hosting Services

## Topics Covered

- Azure App Service
- Azure Functions
- Azure Logic Apps
- Azure Spring Apps
- Azure Container Apps
- Azure Static Web Apps

---

## Azure App Service

A fully managed Platform as a Service (PaaS) for hosting web applications and APIs.

### Supported Technologies

- .NET
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

### Use Cases

- Business Websites
- REST APIs
- Enterprise Applications

---

## Azure Functions

Azure Functions is a serverless compute service that executes code based on events.

### Triggers

- HTTP Requests
- Blob Uploads
- Queue Messages
- Timer Events

### Features

- Serverless
- Pay Per Execution
- Auto Scaling
- Event Driven

### Use Cases

- Automation
- Scheduled Tasks
- Notifications
- File Processing

---

## Azure Logic Apps

A workflow automation service used to connect applications and services.

### Features

- Low-Code Development
- Workflow Designer
- Hundreds of Connectors
- Business Process Automation

### Example Workflow

```text
Email Received
      ↓
Approval Process
      ↓
Notification Sent
```

---

## Azure Spring Apps

Managed hosting platform for Java Spring Boot applications.

### Features

- Auto Scaling
- Monitoring
- Service Discovery
- Configuration Management

### Use Cases

- Banking Applications
- Enterprise Applications
- E-commerce Systems

---

## Azure Container Apps

Serverless platform for hosting containerized applications.

### Features

- Serverless Containers
- Scale to Zero
- HTTPS Support
- Event Driven Scaling

### Deployment Workflow

```text
Docker Image
      ↓
Container Registry
      ↓
Azure Container Apps
      ↓
Application URL
```

### Use Cases

- APIs
- Microservices
- Background Jobs
- AI Applications

---

## Azure Static Web Apps

Hosting service for frontend applications and static websites.

### Supported Technologies

- HTML
- CSS
- JavaScript
- React
- Angular
- Vue.js

### Features

- Global CDN
- Free SSL
- GitHub Integration
- Automatic Deployment

### Use Cases

- Portfolio Websites
- Landing Pages
- Documentation Sites
- Frontend Applications

---

## Azure Hosting Services Comparison

| Service | Best For |
|-----------|-----------|
| Azure App Service | Websites & APIs |
| Azure Functions | Event-Driven Workloads |
| Azure Logic Apps | Workflow Automation |
| Azure Spring Apps | Java Spring Applications |
| Azure Container Apps | Containerized Applications |
| Azure Static Web Apps | Frontend Websites |

---

## Key Learning Outcomes

- Understood Containers and Docker
- Learned Container Orchestration Concepts
- Explored Kubernetes Fundamentals
- Studied Azure Container Registry (ACR)
- Learned Azure Container Instances (ACI)
- Understood Azure Kubernetes Service (AKS)
- Explored Azure App Service
- Learned Azure Functions
- Studied Azure Logic Apps
- Explored Azure Spring Apps
- Learned Azure Container Apps
- Studied Azure Static Web Apps
- Compared Azure Hosting Services

---

## Summary

In this session, I learned the fundamentals of containerization, Docker, Kubernetes, Azure Container Services, and Azure Application Hosting Services. I explored how Azure provides different hosting options for traditional web applications, serverless workloads, workflow automation, containerized applications, and enterprise-scale deployments. This helped build a strong foundation for modern cloud-native application deployment in Azure.