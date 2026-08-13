# Day 23 — AWS Elastic IP, Auto Scaling Groups & Application Load Balancer

**Date:** July 03, 2026

---

# Overview

Today's session focused on AWS networking, high availability, and scalability services. The labs covered assigning a static public IP using Elastic IP, automatically scaling EC2 instances based on demand with Auto Scaling Groups (ASG), and distributing application traffic across multiple backend servers using an Application Load Balancer (ALB).

These services form the foundation of building highly available, fault-tolerant, and scalable cloud applications.

---

# Topics Covered

- Elastic IP (EIP)
- Public IP vs Elastic IP
- Auto Scaling Groups (ASG)
- Launch Templates
- Desired, Minimum & Maximum Capacity
- Scaling Policies
- CloudWatch Monitoring
- Application Load Balancer (ALB)
- Target Groups
- Health Checks
- Backend Web Servers
- Availability Zones
- High Availability
- Load Balancing

---

# Practical Labs

## Lab 1 — Elastic IP

Configured a static public IP address for an EC2 instance.

### Tasks Performed

- Allocated a new Elastic IP address
- Associated the Elastic IP with an existing EC2 instance
- Verified successful association
- Confirmed persistent public connectivity

### Learning Outcome

Unlike standard public IP addresses, an Elastic IP remains associated with your AWS account and can be remapped to another EC2 instance if required.

---

# Lab 2 — Auto Scaling Groups

Configured automatic scaling of EC2 instances.

## Launch Template

Created a Launch Template containing:

- Amazon Linux 2023 AMI
- Instance Type
- Security Group
- Key Pair
- User Data Script

---

## Auto Scaling Group

Configured an Auto Scaling Group with:

- Minimum Capacity
- Desired Capacity
- Maximum Capacity

Distributed instances across multiple Availability Zones for high availability.

---

## Scaling Policy

Configured dynamic scaling based on:

- CPU Utilization
- CloudWatch Metrics

The Auto Scaling Group automatically launches additional EC2 instances when workload increases and terminates excess instances when demand decreases.

---

# Lab 3 — Application Load Balancer

Created an Internet-facing Application Load Balancer.

---

## Backend Infrastructure

Provisioned two Amazon Linux EC2 instances.

Each server automatically installed Apache using User Data.

Server A displayed

```
Hello from Server A
```

Server B displayed

```
Hello from Server B
```

---

## Target Group

Configured a Target Group.

Settings included

- Target Type: Instances
- Protocol: HTTP
- Port: 80

Registered both backend EC2 instances.

---

## Health Checks

Configured ALB Health Checks.

- Protocol: HTTP
- Path: /

Verified that both backend servers reached a Healthy state before receiving client traffic.

---

## Load Balancer Configuration

Created an Internet-facing Application Load Balancer.

Configured

- HTTP Listener
- Forward Requests
- Target Group Association
- Multiple Availability Zones

---

## Traffic Distribution

Accessed the Load Balancer DNS name.

Observed traffic distribution between both backend servers.

Refreshing the webpage alternated responses between:

```
Hello from Server A
```

and

```
Hello from Server B
```

confirming successful load balancing.

---

# User Data Script

Automatically installed Apache during EC2 launch.

```bash
#!/bin/bash
yum update -y
yum install httpd -y
systemctl enable httpd
systemctl start httpd

echo "<h1>Hello from Server A</h1>" > /var/www/html/index.html
```

---

# AWS Services Used

- Amazon EC2
- Elastic IP
- Launch Templates
- Auto Scaling Groups
- CloudWatch
- Application Load Balancer
- Target Groups
- Security Groups
- Apache HTTP Server

---

# Skills Learned

- Assigning static public IP addresses
- Managing Elastic IP addresses
- Creating Launch Templates
- Configuring Auto Scaling Groups
- Dynamic scaling using CloudWatch metrics
- Creating Target Groups
- Configuring Application Load Balancers
- Performing Health Checks
- Building highly available applications
- Distributing traffic across multiple servers

---

# Key Takeaways

- Elastic IP provides a permanent public IP for cloud resources.
- Auto Scaling automatically adjusts infrastructure based on workload.
- Launch Templates simplify consistent EC2 deployments.
- Application Load Balancer distributes incoming traffic across healthy backend servers.
- Health Checks prevent unhealthy instances from receiving client requests.
- Multi-AZ deployment improves application availability and fault tolerance.

---

# Lab Environment

| Component | Details |
|------------|---------|
| Cloud Provider | AWS |
| Compute | Amazon EC2 |
| Networking | Elastic IP, Application Load Balancer |
| Scaling | Auto Scaling Groups |
| Monitoring | Amazon CloudWatch |
| Web Server | Apache HTTP Server |
| Operating System | Amazon Linux 2023 |
| Load Balancing | HTTP |
| High Availability | Multi-AZ Deployment |

---

# Outcome

Successfully configured Elastic IP for persistent public connectivity, implemented Auto Scaling Groups for automatic infrastructure scaling, and deployed an Application Load Balancer to distribute traffic across multiple healthy EC2 instances, demonstrating a highly available and scalable AWS architecture.