# Day 59 — Google Workspace Administration Fundamentals

| Field          | Details                          |
|----------------|-----------------------------------|
| **Day**        | Day 59                           |
| **Date**       | Aug 12, 2026                     |
| **Topic**      | Google Workspace Admin Console — OUs, Users, Groups, Resources, Buildings, Suspension & Bulk Operations |
| **Type**       | Practical / Lab Task             |
| **Environment**| Google Workspace Admin Console (GWS) · Domain: `team33.traacc.com` |

---

## What I Did Today

First real session on the Google Workspace track after wrapping up Azure and AWS. This was a full admin-console lab covering the core lifecycle of running a GWS tenant end to end: designing an Organizational Unit structure, provisioning users individually and in bulk, transferring an employee between departments, building and locking down mailing groups, standing up bookable resources (equipment + meeting rooms) inside a building, and suspending/restoring a user account. Nine activities, one Admin Console, real verification at every step — same "prove it, don't just describe it" approach as the Linux and AWS labs.

---

## Objectives

- Design a department-based Organizational Unit (OU) structure
- Provision users individually and assign them to the correct OU
- Transfer a user between OUs and understand policy inheritance
- Create and configure Google Groups with different access levels
- Lock down a group as a restricted internal mailing list
- Create bookable resources (equipment) and verify them in Google Calendar
- Create a building with multiple meeting rooms and verify capacity/booking
- Suspend and restore a user account
- Bulk-provision users via CSV upload

---

# Activity 1: Organizational Structure

**Task:** Design and implement an OU structure that maps to company departments.

**OU Structure Design**

```
Root Organization (company.com)
├── Human Resources
├── Finance
├── Sales
├── IT Support
└── Design
```

**Steps to Implement**

1. Admin console → **Menu > Directory > Organizational units**.
2. Hover over the parent organization, click the **+** icon (Create new organizational unit).
3. Enter the department name (e.g., `Human Resources`) in the **Name** field.
4. Click **Create**.
5. Repeat for Finance, Sales, IT Support, and Design.

> 💡 A flat hierarchy directly beneath the root domain was chosen deliberately — it keeps department-level policy application (Drive sharing restrictions, app access, etc.) simple, without the added complexity of nested OU inheritance chains.

---

# Activity 2: User Lifecycle Management

**Task:** Create user accounts, assign them to the correct OU, and get them ready to use Workspace services.

**User List**

| Name | Email Address | Department (OU) |
|------|---------------|------------------|
| Alice Smith | alice.smith@company.com | Human Resources |
| Bob Jones | bob.jones@company.com | Finance |
| Charlie Brown | charlie.brown@company.com | Sales |
| Diana Prince | diana.prince@company.com | IT Support |
| Evan Wright | evan.wright@company.com | Design |

**Steps to Implement**

1. **Menu > Directory > Users** → **Add new user**.
2. Fill in **First name**, **Last name**, **Primary email**.
3. Click the organizational unit link, select the correct department OU, click **Done**.
4. Generate/auto-generate a password → **Add New User**.
5. Repeat for all five employees.

**Configuration Summary**

All five users were provisioned successfully and assigned to their respective OUs. Passwords were set to require a change on first login for account security.

> ⚠️ Auto-generated passwords are a one-time convenience — always force a password reset on first login rather than letting users keep the admin-generated one indefinitely.

---

# Activity 3: Employee Transfer

**Task:** Move an employee from Sales to Finance and verify policy inheritance.

**Steps to Implement**

1. **Menu > Directory > Users** → locate the user (Charlie Brown) → open their profile.
2. Click **Change organizational unit** on the left panel.
3. Select **Finance** → **Change**.
4. Update profile info (Manager, Job Title) to reflect the new role.

**Explanation of the Changes Made**

Moving Charlie from Sales → Finance had an immediate effect: he lost every Sales-specific Chrome policy and app restriction the moment the OU changed, and automatically inherited whatever security settings, Drive sharing rules, and app states were enforced on the Finance OU — no separate re-provisioning step required.

> 💡 OU membership isn't just organizational labeling — it's the actual policy inheritance mechanism. Moving a user between OUs is effectively a live permissions change, not a cosmetic directory update.

---

# Activity 4: Group Management

**Task:** Configure department groups, add members, assign managers, verify functionality.

**Group Details & Member List**

| Group Name | Email Address | Access Level | Manager |
|---|---|---|---|
| All Employees | all@company.com | Announcement Only | Admin |
| Human Resources | hr@company.com | Team | Alice Smith |
| Finance | finance@company.com | Team | Bob Jones |
| Sales | sales@company.com | Team | Sales Lead |
| IT Support | it@company.com | Team | Diana Prince |

**Steps to Implement**

1. **Menu > Directory > Groups** → **Create group**.
2. Enter Group name, Group email, Description → **Next**.
3. Set the access type — **Team** for department-specific collaboration, **Announcement Only** for global broadcast-style updates, **Public** to allow org-wide posting and joining, **Restricted** to require manager/member approval to post or join, **Custom** for anything that doesn't fit the presets → **Create Group**.
4. **Add members** → search for the departmental users → assign role (**Member** or **Manager**) → **Add**.

| Access Type | Who Can Post | Typical Use Case |
|---|---|---|
| Public | Anyone in the org | Open discussion lists |
| Team | Members, must ask to join | Department collaboration |
| Announcement Only | Owners/Managers only | Company-wide broadcasts |
| Restricted | Approved members only | Sensitive/internal comms |
| Custom | Configurable per setting | One-off requirements |

> 💡 "Team" access requires people to *ask* to join even though anyone in the org can post once they're in — it's a middle ground between fully open and fully locked down.

---

# Activity 5: Access Management Using Groups

**Task:** Lock down the Finance group so only authorized members can send mail to `finance@company.com`.

**Steps to Implement**

1. **Menu > Directory > Groups** → open the **Finance** group.
2. Go to **Access settings**.
3. Under **Who can post**, leave only **Group members** checked — uncheck **External** and **Entire organization**.
4. Restrict **Who can view members** to group members/managers.
5. Save changes.

**Configuration Details & Test Results**

Configured as a restricted internal mailing list.

| Test | Result |
|---|---|
| Email from a non-Finance internal user → finance@company.com | Blocked / Bounced |
| Email from Bob Jones (Finance) → finance@company.com | Delivered successfully |

> ⚠️ Access settings only restrict *who can post* — they don't automatically restrict *who can view* member lists unless that's configured separately. Both need to be locked down for a genuinely private internal list.

---

# Activity 6: Resource Management

**Task:** Create bookable equipment resources and verify they're reservable through Google Calendar.

**Resource List**

- Projector
- Conference Camera
- Company Vehicle
- Training Laptop

**Steps to Implement**

1. **Menu > Directory > Buildings and resources** → **Resource management** → **Open**.
2. Click **+** → **Add resources**.
3. Set Resource Category to **Other**.
4. Enter the resource name (e.g., "Company Vehicle") → **Add Resources**.
5. Repeat for all four items.

**Booking Verification**

Verified by opening Google Calendar, creating a test event, and using **Rooms/Resources** to successfully attach the Company Vehicle and Projector to the meeting. Both showed up correctly in the room/resource picker and reserved the meeting slot on the resource's own calendar.

> 💡 Every resource gets its own calendar under the hood — that's how Calendar knows whether it's free or already booked for a given time slot.

---

# Activity 7: Building Management

**Task:** Create a building with meeting rooms, configure capacity, and verify they appear in Google Calendar.

**Building & Meeting Room Configuration**

| Room | Capacity |
|---|---|
| Training Room | 30 |
| Conference Room | 12 |
| Board Room | 8 |
| Interview Room | 4 |

**Steps to Implement**

1. **Menu > Directory > Buildings and resources** → **Resource management** → **Open**.
2. **Manage buildings** → **+** → **Add new building**.
3. Enter Name (`Main HQ`) and Address → **Add Building**.
4. Back in Resource Management, **+** → **Add resources**.
5. Change Resource category to **Conference room**, select Building `Main HQ`, set room Name + Capacity → **Add Resources**.

> ⚠️ Setting the building, floor, and capacity correctly matters beyond cosmetics — those fields drive the auto-generated resource name and how the room shows up in Calendar's room search, so getting them wrong makes rooms hard to find later.

---

# Activity 8: User Suspension and Restoration

**Task:** Suspend a user account, verify the access restriction, then restore it.

**Steps to Implement**

1. **Suspension:** **Directory > Users** → hover over the employee → **More options** → **Suspend user**. This immediately kills active sessions and blocks new logins, but preserves all data (mail, Drive files).
2. **Verification:** Attempting to log into the suspended account returns a "Your Google Account has been disabled" screen — no ambiguity about the account state.
3. **Restoration:** Back on the user's profile → **More options** → **Reactivate**. Access is restored immediately, no data loss.

> 💡 Suspension is non-destructive by design — it's the correct tool for "employee on leave," not "employee left the company." License fees still apply to suspended users, which is an easy thing to forget when auditing licensing costs.

---

# Activity 9: Bulk User Operations

**Task:** Determine the most efficient way to create multiple user accounts at once.

**Method Used**

**Bulk upload users via CSV** — the right call once you're past 3-4 users; doing them one at a time through the Add User form doesn't scale.

**Steps to Implement**

1. **Menu > Directory > Users** → **Bulk update users**.
2. **Download blank CSV template**.
3. Populate: First Name, Last Name, Email Address, Password, Org Unit Path (e.g., `/Human Resources`) for each user.
4. Save as `.csv`.
5. Back in Admin console → **Attach CSV file** → upload → **Upload**.

**Verification Results**

Upload completed successfully — the Admin Console task list confirmed processing, and all 5 users appeared correctly in the Directory under their assigned OUs shortly after.

> ⚠️ The Org Unit Path field in the CSV needs the exact path syntax (e.g., `/Human Resources`, not `Human Resources`) — get the leading slash wrong and the bulk upload either fails the row or drops the user at the root OU instead of the intended department.

---

# GWS Services & Tools Used

- Google Admin Console
- Directory (Users, Groups, Organizational Units)
- Buildings and Resources
- Google Calendar (resource booking)
- Bulk CSV user provisioning

---

# Skills Learned

- Organizational Unit design and policy inheritance
- User provisioning (manual and bulk via CSV)
- OU transfers and their effect on inherited policy
- Google Groups access-level configuration (Public, Team, Announcement Only, Restricted, Custom)
- Restricting group posting/visibility for internal-only communication
- Resource and building management for bookable equipment and meeting rooms
- Google Calendar resource booking verification
- User suspension and restoration workflow

---

# ⭐ Interview / Viva Q&A

**Q: What's the practical difference between suspending a user and deleting a user?**
A: Suspension blocks login and kills active sessions but keeps all data intact and still counts toward license costs — it's reversible. Deletion removes the account (data can be restored for a limited window depending on settings, but it's meant to be permanent). Suspend for leave/investigation, delete for offboarding.

**Q: If a user is moved from one OU to another, do their Group memberships change?**
A: No — OU membership and Group membership are independent. Moving OUs changes which OU-level policies apply (Chrome policies, app access, etc.), but Group memberships (and any access those groups grant) stay exactly as they were until explicitly changed.

**Q: What's the difference between "Team" and "Restricted" access on a Google Group?**
A: Team allows anyone in the org to post but requires approval to actually join the group. Restricted goes further — only approved members can post *and* joining requires explicit approval, making it the right choice for sensitive internal distribution lists like Finance.

**Q: Why would bulk CSV upload fail to place a user in the correct OU even if the row looks fine?**
A: Almost always an Org Unit Path formatting issue — it needs to match the exact path syntax with a leading slash (`/Human Resources`), not just the OU name on its own.

**Q: What happens to a bookable resource's availability data if you delete and recreate it with the same name?**
A: It's treated as a brand-new resource with a new underlying calendar — none of the old booking history carries over. If continuity matters, edit the existing resource rather than deleting and recreating it.

---

# Key Takeaways

- OU structure is a policy inheritance mechanism, not just an org chart — moving a user between OUs is a live permissions change.
- A flat OU structure directly under root keeps department-level policy management simple; nested OUs add complexity that's only worth it for genuinely hierarchical policy needs.
- Google Groups access levels (Public / Team / Announcement Only / Restricted / Custom) map directly to real-world communication patterns — pick based on who needs to post vs. who needs to join.
- Locking down a group properly requires configuring both "who can post" and "who can view members" — they're separate settings.
- Every bookable resource (room or equipment) has its own calendar under the hood, which is how Calendar handles conflict-checking.
- Suspension ≠ deletion. Suspension is the correct, reversible action for temporary account holds.
- Bulk CSV upload is the only sane way to provision more than a handful of users — but the Org Unit Path field is a common failure point if the syntax is off.

---

# What's Next

Continuing the GWS track — next up: Gmail administration (routing, DKIM/SPF/DMARC), Drive & Shared Drives sharing policies, and Google Meet administration, before moving into identity/security topics (2-Step Verification, SSO) and eventually Microsoft 365.
