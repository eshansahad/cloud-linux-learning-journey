# Day 46 - Amazon Managed Service for Prometheus

> Learn how to collect, store, and monitor application and container metrics using Amazon Managed Service for Prometheus (AMP).

---

## Overview

Amazon Managed Service for Prometheus is a monitoring service that provides a managed Prometheus-compatible environment for collecting and querying metrics from applications and infrastructure.

In this lab, I created an Amazon Managed Service for Prometheus workspace, configured IAM permissions for an EC2 instance, configured metrics collection, verified metric ingestion, and integrated Prometheus with Grafana for visualization.

---

## Objectives

- Understand Amazon Managed Service for Prometheus
- Create a Prometheus workspace
- Configure IAM permissions
- Configure metrics collection
- Collect application and infrastructure metrics
- Verify metric ingestion
- Integrate Prometheus with Grafana
- Visualize collected metrics

---

# What is Amazon Managed Service for Prometheus?

Amazon Managed Service for Prometheus (AMP) is a fully managed monitoring service based on the open-source Prometheus project.

It provides a scalable environment for collecting, storing, querying, and monitoring metrics without requiring users to manage the underlying Prometheus infrastructure.

---

# Key Metrics

The lab focused on collecting and monitoring metrics such as:

- CPU Usage
- Memory Usage
- Pod Status
- Network Metrics
- Application Performance Metrics

---

# Hands-on Lab

## Task 1 – Create a Prometheus Workspace

Configured:

- Opened Amazon Managed Service for Prometheus
- Created a Prometheus workspace
- Assigned a workspace alias
- Waited for the workspace to become Active
- Retrieved the Remote Write URL
- Retrieved the Query URL

:contentReference[oaicite:1]{index=1}

---

## Task 2 – Configure IAM Permissions for EC2

Performed:

- Created an EC2 instance role
- Selected EC2 as the trusted service
- Attached the `AmazonPrometheusRemoteWriteAccess` policy
- Created the Prometheus EC2 role
- Associated the role with the monitoring environment

The IAM configuration enabled authenticated metric transmission to the Prometheus workspace. :contentReference[oaicite:2]{index=2}

---

## Task 3 – Configure Metrics Collection

Configured the monitoring environment to collect application and infrastructure metrics.

The collected metrics included:

- CPU utilization
- Memory usage
- Network metrics
- Application performance
- Container or pod-related metrics

---

## Task 4 – Verify Metrics Ingestion

Performed:

- Checked the Prometheus workspace
- Verified that metrics were being transmitted
- Queried the collected metrics
- Confirmed successful metric ingestion

---

## Task 5 – Integrate Prometheus with Grafana

Configured:

- Connected Grafana to the Prometheus workspace
- Added the Prometheus endpoint as a data source
- Configured the required authentication
- Tested the connection
- Created monitoring visualizations

---

## Troubleshooting

During the integration process, an authentication issue resulted in a `403 Forbidden` response when Grafana attempted to query the Prometheus API.

The issue was related to authentication while establishing the connection between the monitoring components. :contentReference[oaicite:3]{index=3}

---

# AWS Services Used

- Amazon Managed Service for Prometheus
- Amazon EC2
- Amazon Managed Grafana / Grafana
- AWS IAM

---

# Skills Learned

- Cloud monitoring
- Prometheus administration
- Metrics collection
- IAM-based authentication
- Prometheus querying
- Grafana integration
- Infrastructure monitoring
- Troubleshooting monitoring integrations

---

# Key Takeaways

- Amazon Managed Service for Prometheus provides a managed Prometheus environment.
- IAM permissions are required for authenticated metric ingestion.
- Prometheus can collect infrastructure and application metrics.
- Grafana can be integrated with Prometheus for visual monitoring.
- Proper authentication and permissions are essential when connecting monitoring services.

---

# Conclusion

In this lab, I successfully created an Amazon Managed Service for Prometheus workspace, configured IAM permissions, established metrics collection, verified metric ingestion, and integrated Prometheus with Grafana for visualization.

This hands-on exercise strengthened my understanding of cloud monitoring, Prometheus metrics, IAM-based authentication, and Grafana-based observability on AWS.