# Day 43 - Amazon Simple Queue Service (SQS)

> Learn how to create and manage an Amazon SQS queue for asynchronous message processing.

---

## Overview

Amazon Simple Queue Service (SQS) is a fully managed message queuing service that enables applications to communicate asynchronously. It helps decouple application components by temporarily storing messages until they can be processed by a consumer.

In this lab, I created a Standard SQS queue, sent JSON messages into the queue, polled and inspected the messages, deleted the processed messages, and verified that the queue was empty.

---

## Objectives

- Understand Amazon SQS
- Create a Standard queue
- Configure queue parameters
- Send messages to the queue
- Receive and inspect messages
- Delete processed messages
- Verify the queue state

---

# What is Amazon SQS?

Amazon Simple Queue Service (SQS) is a managed message queuing service used to store and transfer messages between distributed application components.

SQS enables asynchronous communication and helps decouple producers from consumers, allowing each component to operate independently.

---

# Key Components

### Queue

A temporary storage location for messages waiting to be processed.

### Producer

An application or service that sends messages to the queue.

### Consumer

An application or service that receives and processes messages from the queue.

### Message

The data payload transferred through the queue.

---

# Hands-on Lab

## Task 1 – Create an SQS Queue

Configured:

- Created a Standard SQS queue
- Queue name: `async-order-processing-queue`
- Visibility timeout: 30 seconds
- Message retention period: 4 days
- Maximum message size: 256 KB
- Receive message wait time: 0 seconds
- Verified successful queue creation

---

## Task 2 – Send Messages into the Queue

Performed:

- Opened the Send and receive messages interface
- Created a sample JSON payload
- Sent the message to the queue
- Verified successful message submission

Example payload:

```json
{
  "order_id": "ORD-2026-8842",
  "customer_id": "CUST-501",
  "amount": 149.99,
  "status": "PENDING_PROCESSING"
}
```

---

## Task 3 – Receive and Inspect Messages

Performed:

- Used Poll for messages
- Retrieved the available message
- Opened the message details
- Inspected the JSON body
- Verified message attributes and receive information

---

## Task 4 – Delete Processed Messages

Performed:

- Selected the processed message
- Deleted the message from the queue
- Confirmed the deletion
- Polled the queue again

---

## Task 5 – Verify Queue State

Verified:

- No messages remained in the queue
- Processed messages were successfully removed
- Queue was ready to receive new messages

Deleting messages after processing prevents the same payload from being processed again by downstream consumers. :contentReference[oaicite:3]{index=3}

---

# AWS Services Used

- Amazon SQS
- AWS Management Console

---

# Skills Learned

- Message queue management
- Asynchronous communication
- Standard SQS queue configuration
- Message publishing
- Message polling
- Message inspection
- Message deletion
- Event-driven architecture

---

# Key Takeaways

- Amazon SQS enables asynchronous communication between application components.
- Standard queues provide high throughput and at-least-once delivery.
- Messages remain available until they are processed and deleted.
- Queue-based architectures help decouple distributed applications.
- SQS can be integrated with other AWS services to build event-driven systems.

---

# Conclusion

In this lab, I successfully created and configured an Amazon SQS Standard queue, sent JSON messages, retrieved and inspected the messages, and deleted them after processing. The queue was then verified to be empty.

This hands-on exercise strengthened my understanding of asynchronous messaging, application decoupling, and event-driven architectures using Amazon SQS.