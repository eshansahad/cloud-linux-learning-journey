# Day 39 - Amazon Elastic Kubernetes Service (Amazon EKS)

> Learn how to deploy and manage containerized applications using Kubernetes on Amazon Elastic Kubernetes Service (EKS).

---

## Overview

Amazon Elastic Kubernetes Service (Amazon EKS) is a fully managed Kubernetes service that simplifies deploying, managing, and scaling containerized applications on AWS. Amazon EKS manages the Kubernetes control plane while allowing users to provision worker nodes for running applications.

In this lab, I created an Amazon EKS cluster, configured IAM roles, provisioned worker nodes, connected using kubectl, deployed an Nginx application using Kubernetes manifests, exposed it through a LoadBalancer Service, and verified successful public access.

---

## Objectives

- Understand Amazon EKS
- Configure IAM roles
- Create an EKS cluster
- Provision worker nodes
- Configure kubectl
- Deploy an application using Kubernetes YAML
- Expose the application using a LoadBalancer
- Verify application accessibility

---

# What is Amazon EKS?

Amazon Elastic Kubernetes Service (EKS) is a managed Kubernetes platform that enables organizations to run containerized workloads without managing the Kubernetes control plane.

EKS integrates with AWS networking, IAM, Elastic Load Balancing, CloudWatch, and Amazon ECR, making it suitable for production-grade container orchestration.

---

# Key Components

### EKS Cluster

Hosts the Kubernetes control plane managed by AWS.

### Node Group

Provides EC2 worker nodes where Kubernetes Pods are scheduled.

### kubectl

The Kubernetes command-line tool used to manage cluster resources.

### LoadBalancer Service

Automatically provisions an AWS Elastic Load Balancer to expose Kubernetes applications to the internet.

---

# Hands-on Lab

## Task 1 – Configure IAM Roles

Configured:

- Created the EKS Cluster IAM Role
- Created the Worker Node IAM Role
- Attached the required AWS managed policies

---

## Task 2 – Create the EKS Cluster

Performed:

- Created an Amazon EKS cluster
- Selected the default VPC and multiple subnets
- Enabled public endpoint access
- Waited for the cluster to become Active

---

## Task 3 – Create a Managed Node Group

Configured:

- Added a managed Node Group
- Selected Amazon Linux AMI
- Configured worker node scaling
- Verified successful node provisioning

---

## Task 4 – Configure kubectl

Performed:

- Installed kubectl
- Updated kubeconfig using AWS CLI
- Connected the local machine to the EKS cluster
- Verified worker nodes using:

```
kubectl get nodes
```

---

## Task 5 – Deploy the Application

Performed:

- Created a Kubernetes Deployment manifest
- Created a Kubernetes Service
- Applied the configuration using:

```
kubectl apply -f nginx-deployment.yaml
```

- Verified successful deployment

---

## Task 6 – Verify Application Access

Verified:

- Retrieved the LoadBalancer endpoint
- Waited for the external DNS name
- Opened the application in a web browser
- Successfully viewed the default **Welcome to nginx!** page

---

# AWS Services Used

- Amazon EKS
- Amazon EC2
- AWS IAM
- Elastic Load Balancer
- Amazon ECR
- AWS CLI
- kubectl

---

# Skills Learned

- Kubernetes cluster administration
- Amazon EKS deployment
- IAM role configuration
- Worker node management
- Kubernetes Deployment and Service resources
- LoadBalancer configuration
- Container orchestration

---

# Key Takeaways

- Amazon EKS provides a fully managed Kubernetes control plane.
- Managed Node Groups simplify worker node provisioning.
- kubectl is the primary tool for Kubernetes administration.
- Kubernetes YAML manifests define application deployments.
- AWS automatically provisions a LoadBalancer for external application access.
- Amazon EKS integrates seamlessly with Amazon ECR for container image deployment.

---

# Conclusion

In this lab, I successfully deployed a Kubernetes environment using Amazon EKS by configuring IAM roles, creating a managed cluster, provisioning worker nodes, connecting through kubectl, deploying an Nginx application, and exposing it using a LoadBalancer Service. This hands-on exercise strengthened my understanding of Kubernetes architecture, container orchestration, and cloud-native application deployment on AWS.