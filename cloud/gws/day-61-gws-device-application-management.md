# Day 61 — Google Workspace Device & Application Management

**Date:** August 18, 2026  
**Focus:** Google Workspace device management, mobile-device policies, application access, third-party app controls, and audit logging.

---

## Objective

Continue the Google Workspace administration journey by working with device and application management in the Google Admin Console. The lab covered device registration and verification, Organizational Units (OUs), mobile-device management policies, Google Workspace application controls, third-party application access, and audit logs.

---

## 1. Device Management

The lab began in the Google Admin Console under **Devices**, reviewing the available management areas:

- Mobile and endpoints
- Chrome devices
- Company-owned devices
- Networks

A test workstation was registered in Google Workspace and its device record was reviewed.

### Device Details Verified

- Assigned user
- Device type
- Operating system
- Last synchronization
- Device status

The completed lab verified a **Windows 10** test device with an **Approved** status and a recent synchronization timestamp.

---

## 2. Organizational Unit & MDM Policy

A dedicated Organizational Unit named **Test Users** was created to isolate the test configuration.

The test user was moved into the new OU so that device-management settings could be applied specifically to that group.

### Device Security Policies

The lab configured basic mobile-device management controls for the Test Users OU:

- Screen lock required
- Strong password requirements
- Device encryption required
- Compromised/rooted/jailbroken devices blocked
- Corporate-data wipe capability for lost or stolen devices

This demonstrated how Google Workspace administrators can scope device policies to specific Organizational Units rather than applying the same configuration to every user.

---

## 3. Google Workspace Application Management

The **Apps → Google Workspace** section was used to review core Workspace applications and their service status for the Test Users OU.

Application-specific settings were also reviewed for:

- **Gmail** — routing and attachment-compliance settings
- **Google Drive** — external sharing and Shared Drive permissions
- **Google Meet** — recording privileges and external attendee access
- **Google Chat** — chat history and external federation
- **Google Calendar** — calendar visibility and sharing settings

The completed lab verified that the core applications were enabled for the Test Users OU.

---

## 4. Web, Mobile & Third-Party Application Controls

The lab also covered **Apps → Web and mobile apps**, where applications can be configured as:

- Allowed
- Blocked
- Available only to selected users or Organizational Units

Third-party application access was reviewed through:

**Security → Access and data control → API controls**

The **Manage Third-Party App Access** area was used to review applications requesting access to Google Workspace data and the available trust controls.

---

## 5. Audit Logging & Reporting

The lab concluded with Google Workspace audit and reporting capabilities.

The **Reporting → Audit and investigation** section was used to review:

- Device log events
- Device synchronization activity
- OS-related events
- Policy/compliance activity
- OAuth application authorization events
- Application activity

The captured audit-log screenshots demonstrated how administrators can use centralized reporting to investigate device and application activity.

---

## Result

The lab successfully covered the core workflow for Google Workspace device and application administration:

1. Registered and verified a Windows 10 test device.
2. Created the **Test Users** Organizational Unit.
3. Assigned the test user to the OU.
4. Configured device security policies for the OU.
5. Reviewed and managed Google Workspace application access.
6. Reviewed web/mobile application controls.
7. Reviewed third-party application access through API Controls.
8. Queried device and application audit logs.

---

## Key Skills Learned

- Google Admin Console device management
- Device registration and verification
- Mobile Device Management (MDM)
- Organizational Unit-based policy application
- Device security controls
- Google Workspace application management
- Web and mobile application access control
- Third-party OAuth application governance
- Device and application audit logging
- Google Workspace administration

---

## Key Takeaway

This lab extended the Google Workspace administration journey from **users, groups, resources, and buildings** into **device security, application governance, and administrative visibility**. It provided practical experience with controlling what users and devices can access while maintaining audit visibility across the Workspace environment.
