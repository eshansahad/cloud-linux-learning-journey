# WaslaSoft POS — Windows / SQL Server Deployment

**Internship Task — Febno Technology**

> **Note on scope:** WaslaSoft is a commercial POS product owned by Febno Technology and its vendor, not code I authored. In line with that, this write-up documents the **deployment process, environment, and troubleshooting** I carried out — it deliberately does not include the vendor's installer, source code, database backups, license/activation keys, API keys, or any customer-identifying data. Everything below is genericized for a public portfolio.

---

## Overview

WaslaSoft is a .NET WinForms point-of-sale application (Restaurant and Retail editions) backed by Microsoft SQL Server. The task was to deploy it end-to-end on a clean Windows machine — install the database engine, restore the application database, configure the client, and get a working POS session — while documenting every step and every failure encountered along the way.

## Objective

- Stand up a working WaslaSoft POS installation from a **fresh Windows environment** (nothing pre-installed)
- Install and configure Microsoft SQL Server as the backing database
- Restore the application database from a vendor-supplied backup
- Connect the POS client to the database and reach a functioning sales screen
- Document the process and any environment-specific issues for the team's internal knowledge base

## Starting Environment

| Component | Details |
|-----------|---------|
| OS | Windows 11 (24H2, build 10.0.26100) |
| Target App | WaslaSoft POS (.NET WinForms — Restaurant & Retail editions) |
| Target Database | Microsoft SQL Server |
| Starting State | Clean machine — no SQL Server, no .NET Framework 3.5, no application files installed |

---

## Deployment Walkthrough

### 1. Environment prerequisites

- Enabled **.NET Framework 3.5** via *Control Panel → Programs → Turn Windows features on or off* (required by the WaslaSoft client and by SQL Server 2014's setup tooling)
- Downloaded the SQL Server installer matching the machine's architecture

<img src="./assets/01-sql2014-download-selection.png" width="480" alt="Choosing the correct SQL Server 2014 Express download for the machine's architecture"><br>
<img src="./assets/02-dotnet-framework-35-enabled.png" width="480" alt="Enabling .NET Framework 3.5 via Windows Features">

### 2. First SQL Server install attempt — blocked

- Attempted **SQL Server 2014 Express** (the version specified in the vendor's install guide) via the SQL Server Installation Center
- Setup failed a prerequisite check: **Windows PowerShell 2.0**, a hard requirement for the SQL Server 2014 engine, is **fully removed** (not just disabled) on current Windows 11 24H2+ builds — it's a deprecated feature Microsoft has been phasing out
- Tried both the native `Enable-WindowsOptionalFeature` / DISM route and a manual PowerShell 2.0 side-load — neither restored the engine cleanly on this build

<img src="./assets/03-sql-installation-center.png" width="480" alt="SQL Server Installation Center"><br>
<img src="./assets/04-sql2014-feature-rules-failed.png" width="480" alt="SQL Server 2014 Feature Rules check failing on the .NET Framework/PowerShell prerequisite"><br>
<img src="./assets/05-powershell-enable-feature-attempt.png" width="480" alt="Attempting to re-enable PowerShell 2.0 via Enable-WindowsOptionalFeature — feature not found"><br>
<img src="./assets/06-dism-enable-feature-attempt.png" width="480" alt="Attempting to re-enable PowerShell 2.0 via DISM — feature not found">

### 3. Pivot: SQL Server 2022 Express

- Rather than continue forcing an 8-year-old SQL Server version onto a build that no longer supports its prerequisites, pivoted to **SQL Server 2022 Express** — fully supported on current Windows, and backward-compatible with the WaslaSoft database schema
- Installed SQL Server 2022 Express with **Mixed Mode authentication** (SQL + Windows auth, required for the POS client's connection string)
- Installed **SQL Server Management Studio (SSMS)** for database administration

<img src="./assets/07-sql2022-express-installer-start.png" width="480" alt="SQL Server 2022 Express installer start screen"><br>
<img src="./assets/08-sql2022-feature-selection.png" width="480" alt="SQL Server 2022 Feature Selection"><br>
<img src="./assets/09-sql2022-database-engine-mixedmode.png" width="480" alt="SQL Server 2022 Database Engine Configuration — Mixed Mode authentication"><br>
<img src="./assets/10-sql2022-install-rules-passed.png" width="480" alt="SQL Server 2022 install rules passing after the pivot"><br>
<img src="./assets/11-ssms-installer.png" width="480" alt="SQL Server Management Studio installer">

### 4. Database restore

- Used SSMS's **Restore Files and Filegroups** flow to restore the vendor-supplied `.bak` backup into a new database matching the name expected by the client's connection string
- Verified the restore by expanding the database tree in SSMS (tables, views, stored procedures all present)
- Along the way, hit and resolved a routine SQL auth login error while validating the new instance

<img src="./assets/12-ssms-login-failed-example.png" width="480" alt="SSMS login failure while validating SQL authentication on the new instance"><br>
<img src="./assets/13-ssms-connected.png" width="480" alt="SSMS successfully connected to the new SQL Server 2022 instance"><br>
<img src="./assets/14-restore-restaurant-database.png" width="480" alt="Restoring the Restaurant database via Restore Files and Filegroups"><br>
<img src="./assets/15-restaurant-db-restored.png" width="480" alt="Restaurant database visible in SSMS Object Explorer after restore">

### 5. First app launch — Restaurant edition

- Pointed the WaslaSoft Restaurant client at the restored database via its **Data Connection** dialog (server name, SQL auth credentials, database name) and confirmed a successful **Test Connection**
- Launching the app past that point surfaced a vendor-side **license/activation expiry notice** ("Renew Notice") — not a deployment defect, but a blocker outside my control (no valid vendor license available in the lab environment)

<img src="./assets/16-restaurant-license-renew-notice.png" width="480" alt="WaslaSoft Restaurant license Renew Notice blocking further access">

### 6. Pivot: Retail edition

- Reused the already-configured SQL Server 2022 environment and repeated the restore process for the **Retail edition's** database
- Confirmed the connection string requirements matched (server name, database name) and reached the client's **Test Connection → Succeeded** state
- Progressed to the **Activation** screen — the furthest reachable point without vendor-issued activation credentials, which weren't available for this environment

<img src="./assets/17-restore-retail-database.png" width="480" alt="Restoring the Retail database via Restore Files and Filegroups"><br>
<img src="./assets/18-retail-db-restored.png" width="480" alt="Retail database visible in SSMS Object Explorer after restore">

### 7. Configuration exposure (from the Restaurant session that did activate on a separate reference install)

Where I did get past activation, I worked through the application's configuration surface to understand how a production install is tuned:

- Company information, receipt header/footer, and slip printing setup (POS/kitchen/juice/extra printer roles)
- Menu appearance — item and group button sizing, fonts, colors, layout grid
- Table settings — table map dimensions and display options
- User management — creating a cashier account and scoping admin privileges
- Item catalog — manual entry vs. bulk **Excel upload** for item lists
- Print flow — routing a sale to a print-to-PDF target and reviewing a sample receipt layout

---

## Troubleshooting Log

| Issue | Root Cause | Resolution |
|-------|-----------|------------|
| SQL Server 2014 setup fails prerequisite check | Windows PowerShell 2.0 fully removed on Windows 11 24H2+, not just hidden | Pivoted to SQL Server 2022 Express (supported on current Windows, compatible with the app's schema) |
| Restaurant client blocked after successful DB connection | Vendor license/activation expired — not a config issue | Documented as a vendor-side blocker; pivoted to Retail edition to continue validating the deployment path |
| Retail activation incomplete | No vendor-issued activation key available in the lab environment | Deployment validated up to the activation step; noted as the handoff point for production rollout |

---

## Skills Practiced

- Microsoft SQL Server installation & version troubleshooting (2014 → 2022 pivot)
- SQL Server Management Studio (SSMS) — database restore via Restore Files and Filegroups
- Mixed Mode authentication configuration
- Windows feature/prerequisite diagnosis (.NET Framework 3.5, PowerShell 2.0 deprecation on Windows 11 24H2+)
- .NET WinForms client-to-database connection configuration
- POS application configuration (printers, menu layout, user roles, catalog import)
- Root-cause troubleshooting and pivoting when blocked by factors outside deployment scope (licensing)
- Deployment documentation for an internal knowledge base

## Deployment Environment

| Component | Details |
|-----------|---------|
| Application | WaslaSoft POS (Restaurant & Retail editions) |
| Application Type | .NET WinForms |
| Database Engine (attempted) | SQL Server 2014 Express — blocked by OS-level prerequisite |
| Database Engine (deployed) | SQL Server 2022 Express |
| DB Tooling | SQL Server Management Studio (SSMS) |
| Authentication Mode | Mixed Mode (SQL + Windows) |
| Operating System | Windows 11, 24H2 |
| Version Control | Git & GitHub (documentation only) |

## Outcome

Both editions reached a validated, working connection to a correctly restored database on a modern SQL Server version — the deployment path itself was fully de-risked and documented, including the version-compatibility issue with SQL Server 2014 on current Windows builds. The remaining step in both cases (Restaurant license renewal, Retail activation) required vendor-issued credentials outside the scope of the lab environment, and was handed off accordingly.

---

*Screenshots above are drawn from the internal deployment report and have been reviewed to exclude credentials, API keys, license/activation codes, and customer-identifying details — see `assets/` for the full set.*
