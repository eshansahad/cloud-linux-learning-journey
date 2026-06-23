# Day 16 – Azure Containerization Lab

**Date:** June 23, 2026

## Objective

Learn how to build, store, and deploy containerized applications using Azure Container Registry (ACR) and Azure Container Instances (ACI).

---

## Topics Covered

- Docker Fundamentals
- Container Images
- Dockerfile
- Azure Container Registry (ACR)
- Azure Container Instances (ACI)
- Public Docker Hub Images
- Private Container Registry
- Container Networking
- DNS Labels
- Container Deployment

---

# Part 1 – Deploy a Containerized Application using Azure

## Architecture

```text
Python Flask App
       │
       ▼
Docker Image
       │
       ▼
Azure Container Registry (ACR)
       │
       ▼
Azure Container Instances (ACI)
       │
       ▼
Public DNS URL
```

---

## Task 1 – Create Python Application

### app.py

```python
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_cloud():
    return "<h1>Deployment Successful!</h1><p>This Python application is running inside an Azure Container Instance.</p>"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
```

### requirements.txt

```text
Flask==3.0.0
```

---

## Task 2 – Create Dockerfile

```dockerfile
FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 80

CMD ["python", "app.py"]
```

---

## Task 3 – Create Azure Container Registry

### Create ACR

- Resource Group: RG-ContainerLab
- SKU: Basic
- Region: South India

### Enable Admin User

```text
Container Registry
 └── Access Keys
      └── Admin User → Enabled
```

---

## Task 4 – Build and Push Docker Image

### Login to ACR

```bash
az acr login --name <registry-name>
```

Example:

```bash
az acr login --name eshanacr01
```

### Build Image

```bash
docker build -t <registry-name>.azurecr.io/python-web-app:v1 .
```

Example:

```bash
docker build -t eshanacr01.azurecr.io/python-web-app:v1 .
```

### Push Image

```bash
docker push <registry-name>.azurecr.io/python-web-app:v1
```

Example:

```bash
docker push eshanacr01.azurecr.io/python-web-app:v1
```

---

## Task 5 – Deploy Container using ACI

### Configuration

- Resource Group: RG-ContainerLab
- Container Name: eshan-python-container
- Image Source: Azure Container Registry
- Image: python-web-app
- Tag: v1
- Port: 80/TCP

### Networking

- Public Access
- DNS Label Enabled

---

## Verification

Open the generated FQDN:

```text
eshan-python-lab01.southindia.azurecontainer.io
```

Expected Output:

```text
Deployment Successful!
This Python application is running inside an Azure Container Instance.
```

---

# Part 2 – Deploy Docker Hub Image using ACI

## Objective

Deploy an existing public Docker image directly from Docker Hub without creating a custom container.

---

## Architecture

```text
Docker Hub
     │
     ▼
NGINX Image
     │
     ▼
Azure Container Instances
     │
     ▼
Public DNS URL
```

---

## Task 1 – Create Container Instance

### Configuration

- Resource Group: RG-PublicContainerLab
- Container Name: aci-nginx-public
- Image Source: Public Registry
- Image: nginx:latest
- OS Type: Linux

---

## Task 2 – Configure Networking

### Public Access

- Networking Type: Public
- DNS Name Label: Unique Name
- Port: 80/TCP

---

## Task 3 – Deploy and Verify

After deployment:

```text
Overview
 └── FQDN
```

Example:

```text
eshan-nginx-app.southindia.azurecontainer.io
```

Open the URL in a browser.

Expected Result:

```text
Welcome to nginx!
```

---

## Azure Services Used

### Container Registry

- Stores Docker Images
- Private Container Repository
- Secure Image Distribution

### Azure Container Instances

- Serverless Containers
- Fast Deployment
- No VM Management Required
- Pay Only for Resources Used

---

## Commands Learned

### Azure CLI

```bash
az acr login
```

### Docker

```bash
docker build
docker push
docker images
docker ps
```

---

## Key Learning Outcomes

- Created a Dockerized Flask Application
- Built Docker Images using Dockerfile
- Created Azure Container Registry
- Pushed Images to ACR
- Deployed Containers using ACI
- Configured Public DNS Access
- Accessed Applications over Internet
- Deployed Containers from Docker Hub
- Understood Container-Based Application Hosting

---

## Summary

In this lab, I learned how to package applications using Docker, store images in Azure Container Registry, and deploy them using Azure Container Instances. I also deployed a public NGINX container directly from Docker Hub. This provided hands-on experience with modern containerized application deployment in Azure without managing virtual machines.