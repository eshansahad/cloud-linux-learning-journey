# Day 54 - Amazon Neptune Graph Database

> Learn how to create and manage a graph database using Amazon Neptune and query graph relationships using Gremlin.

---

## Overview

Amazon Neptune is a fully managed graph database service designed for applications that need to represent and query highly connected data.

In this lab, I created an Amazon Neptune graph database cluster, configured private VPC connectivity and security group access, connected to Neptune from an EC2 instance using the Apache TinkerPop Gremlin Console, created sample vertices and edges representing an IoT network, and verified the relationships using Gremlin traversal queries.

---

## Objectives

- Understand Amazon Neptune
- Create a Neptune DB cluster
- Configure VPC and security group connectivity
- Launch a Neptune DB instance
- Connect to Neptune from an EC2 instance
- Configure the Gremlin Console
- Create graph vertices and edges
- Execute Gremlin traversal queries
- Verify graph relationships

---

# What is Amazon Neptune?

Amazon Neptune is a fully managed graph database service designed for applications that work with highly connected datasets.

Instead of representing information primarily as rows and columns, graph databases represent data as entities and relationships, making them useful for applications involving connected data.

---

# Key Components

### Vertices

Vertices represent entities or nodes in the graph.

Examples from this lab:

- Sensors
- Gateway

### Edges

Edges represent relationships between vertices.

In this lab, the relationship was:

```text
ROUTES_DATA_TO
```

### Gremlin

Gremlin is a graph traversal language used to query and manipulate graph data.

---

# Hands-on Lab

## Task 1 – Create the Neptune DB Cluster

Configured:

- Created an Amazon Neptune database
- Engine: Neptune
- Template: Development and Testing
- Cluster identifier: `neptune-iot-graph-lab`
- Instance class: `db.t3.medium`
- Disabled cross-AZ replica creation for the lab

The Neptune cluster was successfully provisioned. :contentReference[oaicite:2]{index=2}

---

## Task 2 – Configure Private Connectivity

Configured:

- Selected the default VPC
- Used the default subnet configuration
- Created security group: `sg-neptune-internal`
- Configured inbound access on TCP port `8182`
- Restricted access to the security group of the EC2 instance

Neptune was accessed privately through resources within the same VPC rather than through a public internet endpoint. :contentReference[oaicite:3]{index=3}

---

## Task 3 – Connect from an EC2 Instance

Performed:

- Retrieved the Neptune cluster endpoint
- Connected to the Amazon Linux EC2 instance
- Installed Java
- Installed the Apache TinkerPop Gremlin Console
- Started the Gremlin Console
- Configured the remote Neptune connection

The Gremlin Console was used to communicate with the Neptune cluster through the configured endpoint. :contentReference[oaicite:4]{index=4}

---

## Task 4 – Create Graph Data

Created vertices representing an IoT network.

### Sensor Vertices

```text
TempSensor-01
Location: Room A

MotionSensor-02
Location: Hallway
```

### Gateway Vertex

```text
IoT-Hub-North
Status: Active
```

Created directional edges:

```text
TempSensor-01
      │
      └── ROUTES_DATA_TO ──→ IoT-Hub-North

MotionSensor-02
      │
      └── ROUTES_DATA_TO ──→ IoT-Hub-North
```

:contentReference[oaicite:5]{index=5}

---

## Task 5 – Retrieve and Verify Graph Data

Executed Gremlin traversal queries to:

- Retrieve all vertices
- Display vertex properties
- Identify sensors connected to the gateway
- Verify directional relationships

Example traversal:

```text
g.V().valueMap(true)
```

Relationship query:

```text
g.V().has('name', 'IoT-Hub-North').in('ROUTES_DATA_TO').values('name')
```

The query successfully returned:

```text
TempSensor-01
MotionSensor-02
```

This verified that the graph database was correctly storing entities and their relationships. :contentReference[oaicite:6]{index=6}

---

# AWS Services & Tools Used

- Amazon Neptune
- Amazon EC2
- Amazon VPC
- Security Groups
- Apache TinkerPop Gremlin Console

---

# Skills Learned

- Graph database administration
- Amazon Neptune configuration
- VPC-based database connectivity
- Security group configuration
- Gremlin query language
- Graph traversal
- Vertices and edges
- Connected-data modeling

---

# Key Takeaways

- Amazon Neptune is designed for highly connected data.
- Graph databases represent entities as vertices and relationships as edges.
- Neptune clusters are accessed through private VPC connectivity.
- Gremlin can be used to create and query graph relationships.
- Security groups can restrict Neptune access to trusted resources.
- Graph traversal makes relationship-based queries efficient and intuitive.

---

# Conclusion

In this lab, I successfully deployed an Amazon Neptune graph database cluster inside a private VPC, configured secure access from an EC2 instance, installed the Apache TinkerPop Gremlin Console, created an IoT graph containing sensors and a gateway, and verified the relationships using Gremlin traversal queries.

This hands-on exercise strengthened my understanding of graph databases, connected-data modeling, secure VPC-based database access, and graph querying using Amazon Neptune.