# Day 35 - AWS Lambda & Serverless Computing

> Learn how to build, deploy, and execute serverless applications using AWS Lambda without managing servers.

---

## Overview

AWS Lambda is a serverless compute service that enables developers to run code without provisioning or managing servers. Lambda automatically handles infrastructure management, scaling, availability, and monitoring while executing code in response to events from AWS services or external applications.

This lab demonstrates creating a Lambda function, writing Python code, configuring test events, executing the function, monitoring logs in Amazon CloudWatch, and redeploying updated code.

---

## Objectives

- Understand AWS Lambda
- Create a Lambda function
- Configure the runtime environment
- Write Python function code
- Deploy the function
- Create a test event
- Execute the function
- Monitor execution logs
- Modify and redeploy the function

---

# What is AWS Lambda?

AWS Lambda is a fully managed serverless compute service that runs code in response to events without requiring server management.

Instead of provisioning virtual machines, developers upload their code and Lambda automatically allocates compute resources, scales the application, and charges only for actual execution time.

---

# Benefits of AWS Lambda

- No server management
- Automatic scaling
- Pay only for execution time
- High availability
- Event-driven architecture
- Easy integration with AWS services

---

# Hands-on Lab

## Task 1 – Create a Lambda Function

Configured the following:

- Created a new Lambda function
- Selected the Python runtime
- Configured execution permissions
- Created the default execution role

---

## Task 2 – Develop and Deploy the Function

Performed the following:

- Modified the default Python code
- Implemented a function to process JSON event data
- Deployed the updated code
- Verified successful deployment

---

## Task 3 – Create and Execute a Test Event

Configured:

- Created a sample JSON test event
- Executed the Lambda function
- Verified successful execution
- Confirmed the HTTP status code and response payload

---

## Task 4 – Monitor Execution Logs

Verified:

- Execution logs were generated automatically
- Logs were available in Amazon CloudWatch
- Execution details included START, END, and REPORT information
- Event data was successfully logged

---

## Task 5 – Update and Redeploy the Function

Performed:

- Modified the function logic
- Redeployed the updated version
- Executed another test
- Verified the updated output

---

# AWS Services Used

- AWS Lambda
- Amazon CloudWatch
- AWS IAM

---

# Skills Learned

- Serverless computing
- Function deployment
- Event-driven programming
- CloudWatch log analysis
- Lambda testing
- JSON event processing
- Serverless application development

---

# Key Takeaways

- AWS Lambda eliminates server management.
- Functions automatically scale based on incoming requests.
- CloudWatch provides detailed execution logs for monitoring and troubleshooting.
- Lambda integrates easily with many AWS services to build event-driven applications.
- Serverless architectures reduce operational overhead while improving scalability.

---

# Conclusion

In this lab, I successfully created, deployed, tested, monitored, and updated an AWS Lambda function using the Python runtime. I also verified execution logs in Amazon CloudWatch and gained practical experience with serverless computing, event-driven architectures, and automated application scaling.