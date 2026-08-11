# Day 57 - Amazon DynamoDB Administration

> Learn how to create and manage a NoSQL database using Amazon DynamoDB.

---

## Overview

Amazon DynamoDB is a fully managed NoSQL database service designed to provide fast and predictable performance at scale.

In this lab, I created a DynamoDB table for an Urban Flood & Drainage Monitoring System, configured a composite primary key, selected On-Demand capacity mode, inserted semi-structured sensor data, performed Scan and Query operations, and validated Update and Delete operations.

---

## Objectives

- Understand Amazon DynamoDB
- Create a DynamoDB table
- Configure a Partition Key and Sort Key
- Configure On-Demand capacity
- Insert sample items
- Retrieve data using Scan
- Retrieve data using Query
- Update an item
- Delete an item

---

# What is Amazon DynamoDB?

Amazon DynamoDB is a fully managed NoSQL database service provided by AWS.

It stores data as items and attributes rather than traditional relational rows and columns. DynamoDB is designed for applications that require scalable and low-latency data access.

---

# Key Components

### Partition Key

The partition key determines how DynamoDB distributes data across its storage infrastructure.

In this lab:

```text
SensorNodeID
```

was used as the partition key.

### Sort Key

The sort key organizes items within the same partition.

In this lab:

```text
Timestamp
```

was used as the sort key to organize sensor readings chronologically.

### On-Demand Capacity

On-Demand capacity automatically scales read and write capacity according to application traffic, making it suitable for workloads with unpredictable usage.

---

# Hands-on Lab

## Task 1 – Create the DynamoDB Table

Configured:

- Created a DynamoDB table
- Table name: `UrbanFlood_Drainage_Monitor`
- Partition key: `SensorNodeID`
- Partition key type: String
- Sort key: `Timestamp`
- Sort key type: Number
- Capacity mode: On-Demand

The table was successfully created and became Active. :contentReference[oaicite:1]{index=1}

---

## Task 2 – Insert Sample Data

Performed:

- Opened the Explore table items interface
- Selected Create item
- Switched to JSON view
- Inserted semi-structured sensor data
- Created multiple items using the same sensor node and different timestamps

Sample attributes included:

- SensorNodeID
- Timestamp
- WaterLevel_cm
- FlowRate_Lpm
- ServoValveStatus

Example:

```json
{
  "SensorNodeID": {
    "S": "Node-Kozhikode-01"
  },
  "Timestamp": {
    "N": "1720512000"
  },
  "WaterLevel_cm": {
    "N": "45.5"
  },
  "FlowRate_Lpm": {
    "N": "120"
  },
  "ServoValveStatus": {
    "S": "Closed"
  }
}
```

:contentReference[oaicite:2]{index=2}

---

## Task 3 – Retrieve Data Using Scan

Performed:

- Opened the Explore items interface
- Selected the Scan operation
- Executed the scan
- Retrieved all items currently stored in the table

A Scan reads the entire table and is therefore more resource-intensive for large datasets. :contentReference[oaicite:3]{index=3}

---

## Task 4 – Retrieve Data Using Query

Performed:

- Changed the operation from Scan to Query
- Selected the partition key
- Entered:

```text
Node-Kozhikode-01
```

- Applied a sort-key condition
- Used a timestamp greater-than condition
- Executed the query

The targeted Query retrieved only the items matching the specified partition and time range, demonstrating more efficient access to data using the table's primary key structure. :contentReference[oaicite:4]{index=4}

---

## Task 5 – Update an Item

Performed:

- Selected an existing sensor item
- Opened the item details
- Selected Edit item
- Changed the `ServoValveStatus` attribute
- Updated the value from:

```text
Closed
```

to:

```text
Open
```

This simulated a physical valve actuation command to help relieve drainage flooding. :contentReference[oaicite:5]{index=5}

---

## Task 6 – Delete an Item

Performed:

- Selected an existing item
- Opened the Actions menu
- Selected Delete items
- Confirmed the deletion
- Verified that the item was removed

:contentReference[oaicite:6]{index=6}

---

# AWS Services Used

- Amazon DynamoDB
- AWS Management Console

---

# Skills Learned

- NoSQL database management
- DynamoDB table creation
- Composite primary keys
- Partition key and sort key design
- On-Demand capacity configuration
- JSON data management
- Scan operations
- Query operations
- Item Update and Delete operations

---

# Key Takeaways

- DynamoDB is a fully managed NoSQL database service.
- Composite keys can organize related data efficiently.
- Sort keys are useful for chronological or range-based access.
- Scan reads the entire table, while Query targets a specific partition.
- On-Demand capacity automatically adapts to changing workloads.
- DynamoDB supports flexible, semi-structured item attributes.
- CRUD-style operations can be performed directly through the AWS Console.

---

# Conclusion

In this lab, I successfully created the `UrbanFlood_Drainage_Monitor` DynamoDB table using a composite primary key and On-Demand capacity. I inserted semi-structured sensor data, retrieved records using Scan and Query operations, and validated item Update and Delete operations.

This hands-on exercise strengthened my understanding of NoSQL database design, DynamoDB key structures, scalable capacity management, and efficient data retrieval using AWS DynamoDB.