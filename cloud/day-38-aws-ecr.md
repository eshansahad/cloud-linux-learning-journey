# Day 38 - Amazon Elastic Container Registry (Amazon ECR)

> Learn how to create a private container registry, authenticate Docker, and push container images to Amazon Elastic Container Registry (ECR).

---

## Overview

Amazon Elastic Container Registry (Amazon ECR) is a fully managed container image registry that enables developers to securely store, manage, and deploy Docker container images. It integrates seamlessly with Amazon ECS, Amazon EKS, AWS Batch, and other AWS services, making it an essential component of modern containerized application deployments.

In this lab, I created an Amazon ECR private repository, authenticated Docker with AWS, tagged a local Docker image, pushed it to Amazon ECR, and verified that the image was successfully uploaded.

---

## Objectives

- Understand Amazon ECR
- Create a private container repository
- Authenticate Docker with Amazon ECR
- Tag a Docker image
- Push the image to Amazon ECR
- Verify successful image upload

---

# What is Amazon ECR?

Amazon Elastic Container Registry (ECR) is a secure, scalable, and fully managed Docker container registry provided by AWS. It eliminates the need to manage your own container registry while integrating directly with AWS container services.

Amazon ECR supports private repositories for secure image storage and public repositories for sharing container images with the community.

---

# Key Features

- Fully managed container registry
- Secure image storage
- Private and Public repositories
- Image versioning
- IAM-based access control
- Vulnerability scanning
- Integration with ECS, EKS, and AWS Batch

---

# Hands-on Lab

## Task 1 – Create an Amazon ECR Repository

Configured the following:

- Created a private repository
- Assigned a repository name
- Used default encryption settings
- Verified repository creation

---

## Task 2 – Prepare the Docker Image

Performed:

- Built a Docker image locally
- Verified the image using Docker CLI
- Tagged the image using the Amazon ECR repository URI

---

## Task 3 – Authenticate and Push the Image

Performed:

- Authenticated Docker using AWS CLI
- Logged in successfully to Amazon ECR
- Pushed the tagged Docker image
- Verified successful upload

---

## Task 4 – Verify Repository Contents

Verified:

- Container image appeared in the repository
- Image tag displayed correctly
- Push timestamp recorded successfully
- Repository ready for deployment

---

# AWS Services Used

- Amazon Elastic Container Registry (ECR)
- Docker
- AWS CLI
- AWS IAM

---

# Skills Learned

- Container registry management
- Docker image tagging
- AWS CLI authentication
- Image publishing
- Container image versioning
- Secure image storage

---

# Key Takeaways

- Amazon ECR provides a secure and scalable container registry.
- Docker authentication is performed using AWS CLI.
- Tagged images can be pushed directly into private repositories.
- Amazon ECR integrates seamlessly with ECS, EKS, and AWS Batch.
- Container registries simplify application deployment pipelines.

---

# Conclusion

In this lab, I successfully created an Amazon ECR private repository, authenticated Docker using the AWS CLI, tagged a Docker image, pushed it to the repository, and verified the uploaded image. This exercise strengthened my understanding of container image management and cloud-native application deployment using AWS.