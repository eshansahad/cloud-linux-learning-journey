# Day 48 - Amazon ECS with AWS Fargate

> Learn how to deploy and run a containerized web application using Amazon ECS and AWS Fargate.

---

## Overview

Amazon Elastic Container Service (ECS) is a fully managed container orchestration service that allows applications to be deployed and managed using containers.

AWS Fargate provides serverless compute for ECS, allowing containers to run without managing the underlying EC2 infrastructure.

In this lab, I created an ECS cluster using Fargate, configured a task definition with an Nginx container, configured networking and security group access, launched the container task, and verified the running web application through its public IP address.

---

## Objectives

- Understand Amazon ECS
- Create an ECS cluster
- Configure AWS Fargate
- Create a task definition
- Deploy an Nginx container
- Configure VPC networking
- Configure security group access
- Run an ECS task
- Verify the containerized application

---

# What is Amazon ECS?

Amazon Elastic Container Service (ECS) is a fully managed container orchestration service that makes it easier to deploy, manage, and scale containerized applications on AWS.

ECS can run containers using either Amazon EC2 or AWS Fargate. In this lab, AWS Fargate was used to provide serverless container compute.

---

# What is AWS Fargate?

AWS Fargate is a serverless compute engine for containers.

With Fargate, there is no need to provision or manage EC2 instances for running container workloads. AWS manages the underlying compute infrastructure while the user focuses on the containerized application.

---

# Key Components

### ECS Cluster

A logical grouping of ECS tasks and services.

### Task Definition

Defines how an ECS container should run, including:

- Container image
- CPU
- Memory
- Port mappings
- Runtime configuration

### ECS Task

A running instance of a task definition.

### Fargate

Provides serverless compute capacity for running ECS containers.

---

# Hands-on Lab

## Task 1 – Create an ECS Cluster

Configured:

- Opened the Amazon ECS Console
- Created a new ECS cluster
- Cluster name: `ecs-fargate-lab-cluster`
- Selected AWS Fargate as the infrastructure
- Created the cluster successfully

---

## Task 2 – Create a Task Definition

Configured:

- Created a new task definition
- Task definition family: `nginx-web-task`
- Selected AWS Fargate
- Operating system: Linux
- Architecture: X86_64
- Configured CPU and memory resources
- Added an Nginx container
- Container name: `nginx-web-container`
- Image: `nginx:latest`
- Container port: `80`

The Nginx image was configured as the container workload for the ECS task. :contentReference[oaicite:1]{index=1}

---

## Task 3 – Configure Networking

Configured:

- Selected the default VPC
- Selected a public subnet
- Created a security group
- Allowed inbound HTTP traffic on port 80
- Enabled public IP assignment

This allowed the Fargate task to receive public network connectivity.

---

## Task 4 – Run the ECS Task

Performed:

- Opened the ECS cluster
- Selected the Tasks section
- Selected Run new task
- Chose Fargate as the launch type
- Selected the `nginx-web-task` task definition
- Configured the required networking settings
- Launched the task

---

## Task 5 – Verify the Running Container

Verified:

- ECS task reached the `RUNNING` state
- Opened the task details
- Located the assigned public IP address
- Accessed the public IP through a web browser
- Successfully loaded the Nginx web server

The lab confirmed that the containerized Nginx application was accessible through the dynamically assigned public IP. :contentReference[oaicite:2]{index=2}

---

# AWS Services & Tools Used

- Amazon ECS
- AWS Fargate
- Amazon EC2 Networking
- Amazon VPC
- Security Groups
- Docker / Container Image

---

# Skills Learned

- Container orchestration
- ECS cluster management
- AWS Fargate deployment
- Task definition configuration
- Container networking
- Security group configuration
- Public container application deployment

---

# Key Takeaways

- Amazon ECS simplifies container orchestration on AWS.
- AWS Fargate allows containers to run without managing EC2 servers.
- Task Definitions control how ECS containers are deployed.
- Security groups control network access to container workloads.
- ECS tasks can be exposed publicly using appropriate networking configuration.

---

# Conclusion

In this lab, I successfully deployed a containerized Nginx application using Amazon ECS and AWS Fargate. I created an ECS cluster, configured a Fargate task definition, deployed the Nginx container, configured networking and security group access, and verified the application through its public IP address.

This hands-on exercise strengthened my understanding of container orchestration, serverless container computing, networking, and application deployment using Amazon ECS and AWS Fargate.