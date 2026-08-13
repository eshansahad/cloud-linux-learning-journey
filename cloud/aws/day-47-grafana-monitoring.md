# Day 47 - Grafana Monitoring on AWS EC2

> Learn how to deploy Grafana and Prometheus on an EC2 instance and create dashboards for infrastructure monitoring.

---

## Overview

Grafana is an open-source observability and visualization platform used to create dashboards for monitoring infrastructure, applications, and other data sources.

In this lab, I launched an Ubuntu EC2 instance, installed Grafana and Prometheus, configured the required network access, connected Grafana to the local Prometheus data source, and created a custom monitoring dashboard.

---

## Objectives

- Understand Grafana monitoring
- Launch an Ubuntu EC2 instance
- Install Grafana
- Install Prometheus
- Configure Grafana access
- Connect Grafana to Prometheus
- Create a monitoring dashboard
- Visualize system metrics

---

# What is Grafana?

Grafana is an open-source visualization and monitoring platform that allows users to create interactive dashboards from different data sources.

Grafana can connect to monitoring systems such as Prometheus and display collected metrics through graphs, panels, and dashboards.

---

# What is Prometheus?

Prometheus is an open-source monitoring and metrics collection system.

In this lab, Prometheus was installed locally on the EC2 instance and used as the data source for Grafana.

---

# Architecture

```text
EC2 Instance
     │
     ├── Prometheus
     │       │
     │       └── Metrics
     │
     └── Grafana
             │
             └── Monitoring Dashboard
```

---

# Hands-on Lab

## Task 1 – Provision the EC2 Instance

Configured:

- Launched an Ubuntu Server EC2 instance
- Selected a suitable instance type
- Enabled a public IP address
- Configured SSH access
- Configured Grafana access on TCP port 3000
- Configured Prometheus access on TCP port 9090

:contentReference[oaicite:2]{index=2}

---

## Task 2 – Install Open-Source Grafana

Performed:

- Connected to the EC2 instance through SSH
- Updated the Ubuntu package repositories
- Installed required dependencies
- Added the official Grafana repository
- Installed Grafana
- Started the Grafana server
- Enabled Grafana to start automatically

Verified that the Grafana service was running successfully. :contentReference[oaicite:3]{index=3}

---

## Task 3 – Install Prometheus

Performed:

- Installed Prometheus using the Ubuntu package manager
- Started the Prometheus service
- Verified the Prometheus service status
- Confirmed Prometheus was available on port 9090

:contentReference[oaicite:4]{index=4}

---

## Task 4 – Access Grafana

Performed:

- Opened the Grafana web interface
- Accessed Grafana using the EC2 public IP and port 3000
- Logged into the Grafana interface
- Configured the administrative password

:contentReference[oaicite:5]{index=5}

---

## Task 5 – Connect Grafana to Prometheus

Configured:

- Opened Grafana Data Sources
- Added Prometheus as a data source
- Configured the Prometheus URL:

```text
http://localhost:9090
```

- Selected Save & Test
- Verified successful connection

:contentReference[oaicite:6]{index=6}

---

## Task 6 – Create a Monitoring Dashboard

Performed:

- Created a new Grafana dashboard
- Added a visualization panel
- Selected the Prometheus data source
- Configured a Prometheus metric query
- Customized the dashboard panel
- Saved the dashboard

:contentReference[oaicite:7]{index=7}

---

# AWS Services & Tools Used

- Amazon EC2
- Ubuntu Server
- Grafana
- Prometheus
- SSH

---

# Skills Learned

- Grafana installation
- Prometheus installation
- Monitoring architecture
- Data source configuration
- Dashboard creation
- EC2-based monitoring
- Linux service management
- Infrastructure visualization

---

# Key Takeaways

- Grafana provides powerful visualization for monitoring data.
- Prometheus can act as a metrics data source for Grafana.
- Grafana dashboards make infrastructure metrics easier to analyze.
- EC2 can be used to host a complete monitoring stack.
- Security group rules control access to Grafana and Prometheus.

---

# Conclusion

In this lab, I successfully deployed a monitoring stack on an Ubuntu EC2 instance by installing Grafana and Prometheus. I connected Grafana to the local Prometheus data source and created a custom dashboard for visualizing system telemetry.

This hands-on exercise strengthened my understanding of infrastructure monitoring, metrics visualization, Linux service management, and Grafana-Prometheus integration on AWS. :contentReference[oaicite:8]{index=8}