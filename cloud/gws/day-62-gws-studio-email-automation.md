# Day 62 — Google Workspace Studio Email Automation

**Date:** August 18, 2026  
**Focus:** Event-driven Gmail automation, keyword filtering, AI summarization, Google Sheets logging, and automated email follow-up using Google Workspace Studio.

---

## Objective

Build an event-driven email automation workflow in **Google Workspace Studio** that identifies relevant incoming requests, summarizes the request with AI, records the structured information in Google Sheets, and sends a confirmation/reply to the sender.

---

## 1. Create the Automation

A new Workspace Studio flow was created and named:

`Automated-Request-Processing`

The workflow was designed around an incoming Gmail message and a sequence of automated processing steps.

---

## 2. Gmail Trigger & Request Filtering

The Gmail connector was configured to start the workflow when a new email is received.

The automation was configured to identify relevant messages containing the keyword:

`Request`

This filtering ensures that the workflow processes request-related messages rather than standard conversational email.

---

## 3. AI Email Summarization

An AI summarization step was added to process the email content.

The email body was supplied as the input, with instructions to extract the core requirement and summarize it in one concise sentence.

The generated summary was stored as a dynamic output that could be passed to the following automation step.

---

## 4. Google Sheets Logging

A Google Sheets action was added to record each processed request.

The workflow used a pre-created spreadsheet:

`Employee_Requests_Log`

### Data Mapping

| Column | Data |
|--------|------|
| Date | Email received timestamp |
| Sender | Sender email address |
| Subject | Email subject |
| AI Summary | AI-generated summary |

This created a centralized log of incoming employee requests and their summarized requirements.

---

## 5. Automated Confirmation / Reply

A final Gmail action was configured to respond to the sender.

The confirmation used the sender's email address dynamically and a standardized message confirming that the request had been received and logged.

The lab documentation specifies the subject as:

`Re: Your Request has been received`

The response informs the sender that the request has been received and that the team will review the summarized requirement.

---

## 6. Testing the Workflow

A sample request was sent from a secondary email account.

### Test Email

**Subject:**

`Hardware Upgrade Request`

**Body:**

> Hello IT, I am requesting a new monitor for my workstation. My current screen is flickering and I need a replacement to continue my design work efficiently.

The workflow was then checked through its execution history.

---

## 7. Verification

The completed automation was verified across the full processing pipeline.

### Workspace Studio Activity

The execution history showed the flow completing its stages:

1. Gmail email received
2. AI summary generated
3. Google Sheets row added
4. Reply action created

### Google Sheets

The `Employee_Requests_Log` sheet received a new row containing the request details and AI-generated summary.

The example summary captured the core requirement: the employee needed a replacement monitor because the existing screen was flickering.

### Email Response

The test sender's inbox was checked to verify the automated request-received response.

---

## Result

An intelligent, event-driven email automation pipeline was successfully deployed using Google Workspace Studio.

The completed workflow:

- Monitored an inbox for incoming messages
- Filtered request-related emails
- Used AI to summarize the message
- Logged structured request data into Google Sheets
- Generated an automated confirmation/reply

This established a practical hands-off triage workflow for IT and administrative requests.

---

## Key Skills Learned

- Google Workspace Studio
- Gmail event-driven automation
- Email filtering and keyword-based processing
- AI/Gemini-assisted summarization
- Dynamic variables in Workspace automation
- Google Sheets automation
- Automated email replies
- Workflow execution monitoring
- Request-triage automation
- Event-driven workflow design

---

## Key Takeaway

This lab demonstrated how Google Workspace can move beyond administration into **workflow automation and AI-assisted operations**. By connecting Gmail, AI summarization, Google Sheets, and automated email responses, a repetitive request-processing workflow can be converted into a structured, traceable automation pipeline.
