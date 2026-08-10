# Day 41 - AWS Amplify Frontend Web Application Deployment

> Learn how to deploy and host a front-end web application using AWS Amplify.

---

## Overview

AWS Amplify provides tools and services for building, deploying, and hosting web and mobile applications. It simplifies frontend application deployment by providing managed hosting infrastructure and a globally distributed content delivery network.

In this lab, I created a basic front-end web application, compressed the application files into a ZIP archive, deployed the application through the AWS Amplify Console using the manual deployment method, and verified the application using the generated public URL.

---

## Objectives

- Understand AWS Amplify
- Create a basic front-end web application
- Prepare application files for deployment
- Create an Amplify application
- Deploy an application without Git integration
- Upload a ZIP deployment package
- Monitor the deployment
- Verify the deployed application

---

# What is AWS Amplify?

AWS Amplify is a development and hosting platform that helps developers build and deploy web and mobile applications.

Amplify provides managed hosting for frontend applications and can automatically distribute static assets through a Content Delivery Network (CDN) while providing an SSL/TLS-enabled public URL.

---

# Key Features

- Frontend application hosting
- Static website deployment
- Managed hosting infrastructure
- CDN-based content delivery
- SSL/TLS support
- Git-based and manual deployment options
- Integration with AWS services

---

# Hands-on Lab

## Task 1 – Create the Frontend Application

Created a basic frontend application containing:

- `index.html`
- CSS styling
- Frontend assets

The application was tested locally before deployment.

---

## Task 2 – Compress the Application

Performed:

- Selected the application files
- Created a ZIP archive
- Named the deployment package `build.zip`
- Ensured the `index.html` file and required assets were located correctly inside the archive

---

## Task 3 – Create the Amplify Application

Configured:

- Opened the AWS Amplify Console
- Selected **Create new app**
- Selected **Deploy without Git**
- Chose the manual deployment option

---

## Task 4 – Upload and Deploy the Application

Performed:

- Selected the `build.zip` deployment package
- Used the **Drag and drop** deployment method
- Uploaded the ZIP archive
- Selected **Save and deploy**
- Monitored the deployment process

AWS Amplify automatically provisioned the hosting environment and distributed the application assets through its content delivery infrastructure. :contentReference[oaicite:1]{index=1} :contentReference[oaicite:2]{index=2}

---

## Task 5 – Verify the Deployment

Verified:

- Deployment completed successfully
- Amplify generated a public domain
- Application was accessible through the generated URL
- Custom HTML page rendered successfully
- SSL/TLS was automatically provided for the hosted application

:contentReference[oaicite:3]{index=3}

---

# AWS Services Used

- AWS Amplify
- Amazon CloudFront / CDN
- AWS Hosting Infrastructure

---

# Skills Learned

- Frontend application deployment
- Static website hosting
- AWS Amplify configuration
- Manual application deployment
- ZIP-based deployment
- CDN-based content delivery
- Cloud application verification

---

# Key Takeaways

- AWS Amplify simplifies frontend application hosting.
- Applications can be deployed without connecting a Git repository.
- ZIP-based manual deployment is useful for simple frontend applications.
- Amplify automatically provisions the required hosting infrastructure.
- Deployed applications receive a public HTTPS endpoint.
- CDN distribution improves global delivery of static application assets.

---

# Conclusion

In this lab, I successfully created and deployed a frontend web application using AWS Amplify. The application was packaged into a ZIP archive and manually deployed through the Amplify Console without Git integration. The deployment was successfully completed and verified through the generated public URL.

This hands-on exercise strengthened my understanding of frontend cloud hosting, managed deployment, CDN-based content delivery, and AWS Amplify.