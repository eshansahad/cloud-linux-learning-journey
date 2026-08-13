# Day 36 - AWS Batch Administration

> Learn how to execute scalable batch processing workloads using AWS Batch with AWS Fargate.

---

## Overview

AWS Batch is a fully managed batch computing service that enables developers and administrators to efficiently run large-scale batch processing jobs without managing the underlying infrastructure. AWS Batch dynamically provisions compute resources, schedules jobs, and automatically scales workloads based on demand.

In this lab, I configured an AWS Batch environment using AWS Fargate, created a job queue and job definition, submitted a batch job, monitored its execution lifecycle, and verified the generated logs in Amazon CloudWatch.

---

## Objectives

- Understand AWS Batch architecture
- Create a Compute Environment
- Configure a Job Queue
- Create a Job Definition
- Submit a Batch Job
- Monitor job execution
- Verify logs in Amazon CloudWatch

---

# What is AWS Batch?

AWS Batch is a fully managed service that allows users to run batch computing workloads at any scale. It automatically provisions the required compute resources, schedules jobs efficiently, and optimizes resource utilization without requiring manual infrastructure management.

AWS Batch supports Amazon EC2, AWS Fargate, and Amazon EKS as compute environments, making it suitable for a variety of containerized batch workloads.

---

# Key Components

### Compute Environment

Provides the compute resources required to execute batch jobs.

### Job Queue

Receives submitted jobs and schedules them according to priority and available resources.

### Job Definition

Defines how a job should run, including:

- Container image
- vCPU allocation
- Memory allocation
- Commands
- Execution role

---

# Hands-on Lab

## Task 1 – Create a Compute Environment

Configured the following:

- Created a managed Compute Environment
- Selected AWS Fargate as the compute platform
- Configured the default VPC and subnets
- Assigned the AWS Batch service role

---

## Task 2 – Create a Job Queue

Configured:

- Created a Job Queue
- Assigned queue priority
- Connected the Compute Environment
- Enabled the queue for job submissions

---

## Task 3 – Create a Job Definition

Configured:

- Platform: AWS Fargate
- Container image from Amazon ECR Public
- 1 vCPU
- 2 GB Memory
- Execution role
- Command to simulate a batch workload

---

## Task 4 – Submit and Monitor a Job

Performed:

- Submitted a new batch job
- Selected the Job Definition
- Submitted the workload to the Job Queue
- Monitored the execution lifecycle

Observed job states:

- Submitted
- Pending
- Runnable
- Starting
- Running
- Succeeded

---

## Task 5 – Verify Job Output

Verified:

- Opened the CloudWatch Log Stream
- Confirmed successful execution
- Validated the workload output
- Verified job completion

---

# AWS Services Used

- AWS Batch
- AWS Fargate
- Amazon CloudWatch
- Amazon ECR Public
- AWS IAM

---

# Skills Learned

- Batch workload orchestration
- Compute Environment configuration
- Job Queue management
- Job Definition creation
- Container-based batch processing
- CloudWatch log monitoring
- Serverless batch execution using Fargate

---

# Key Takeaways

- AWS Batch automates infrastructure provisioning for batch workloads.
- AWS Fargate removes the need to manage EC2 instances.
- Job Definitions standardize workload execution.
- CloudWatch provides centralized logging for batch jobs.
- AWS Batch efficiently manages scalable container-based processing.

---

# Conclusion

In this lab, I successfully configured an AWS Batch environment by creating a Compute Environment, Job Queue, and Job Definition. I submitted and monitored a batch processing workload using AWS Fargate and verified its successful execution through Amazon CloudWatch logs. This hands-on exercise strengthened my understanding of scalable batch computing, workload scheduling, and serverless container execution on AWS.