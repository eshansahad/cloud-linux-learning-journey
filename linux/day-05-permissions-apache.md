# Day 05 — Special Permissions, umask & Apache Web Server

**Date:** May 20, 2026
**Topic:** Special Permissions (SUID, SGID, Sticky Bit), umask, Apache HTTP Server
**Lab Environment:** AWS EC2 — Red Hat Linux (via SSH from Windows CMD)

---

##  What I Learned Today

Covered the advanced side of Linux permissions — special bits (SUID, SGID, Sticky Bit) and the umask default permission system. Also set up a real Apache web server on EC2 and served a custom HTML page through the browser using the public IP.

---

##  Quick Permissions Recap

| Permission | Symbol | Value |
|------------|--------|-------|
| Read       | `r`    | `4`   |
| Write      | `w`    | `2`   |
| Execute    | `x`    | `1`   |
| No permission | `-` | `0`   |

**Reading `ls -l` output:**
```
-rw-r--r-- 1 user1 group1 4096 Jan 19 12:30 example.txt
```

| Field        | Meaning                          |
|--------------|----------------------------------|
| `-rw-r--r--` | File type + permissions          |
| `1`          | Number of hard links             |
| `user1`      | Owner                            |
| `group1`     | Group                            |
| `4096`       | File size in bytes               |
| `Jan 19 12:30` | Last modified date/time        |
| `example.txt`| File name                        |

---

## umask — Default Permission Filter

The **umask** (User Mask) controls what permissions are **removed** from newly created files and directories by default.

```bash
umask           # Show current umask value (default: 0022)
```

### How umask works

| Type       | Max Permission | umask | Result (Default) |
|------------|---------------|-------|-----------------|
| Files      | `666`         | `022` | `644` → `rw-r--r--` |
| Directories| `777`         | `022` | `755` → `rwxr-xr-x` |

> 💡 Files never get execute by default (max 666), directories do (max 777).

### Change umask temporarily

```bash
umask 777       # No permissions granted to anyone (not practical)
umask 022       # Back to default
```

### Change umask permanently (for all users)

```bash
vim /etc/login.defs
# Find the line: UMASK
# Change to your desired value:
UMASK 022
```

>  Changes to `/etc/login.defs` require a **system reboot** to fully take effect. Existing users keep their own shell config umask.

---

##  Special File Permissions

Beyond standard `rwx`, Linux has three special permission bits that extend access control.

---

### 1. SUID — Set User ID

When set on an **executable file**, the program runs with the **file owner's permissions** instead of the executing user's permissions.

```bash
chmod u+s filename      # Set SUID (symbolic)
chmod 4777 filename     # Set SUID (numeric — 4 in front)
```

**Identified by:** `s` in the **user** execute position → `-rwsr-xr-x`
- Lowercase `s` = SUID + execute set
- Uppercase `S` = SUID set but execute NOT set

**Real-world example — `passwd` command:**
```bash
[root@server ~]# ll /usr/bin/passwd
-rwsr-xr-x. 1 root root 32648 Aug 10 2021 /usr/bin/passwd
```

Normal users can change their own password using `passwd`, but when you check who actually runs it:

```bash
[root@server ~]# ps -ef | grep passwd
root 4986 3551 0 10:35 pts/2 00:00:00 passwd
```

It runs as **root** — because of SUID on `/usr/bin/passwd`. The user temporarily gets root's permission just for that command.

>  SUID is why regular users can change their own passwords without being root.

---

### 2. SGID — Set Group ID

When set on a **directory**, all new files created inside **inherit the group** of the directory — not the primary group of the user who created them.

```bash
chmod g+s dirname       # Set SGID (symbolic)
chmod 2777 dirname      # Set SGID (numeric — 2 in front)
```

**Identified by:** `s` in the **group** execute position → `drwxrwsr-x`

**Example from lab:**
```bash
[root@server ~]# useradd -G college harsha
[root@server ~]# useradd -G college amal
[root@server ~]# chgrp college /dsoft
[root@server ~]# chmod g+rwx /dsoft
[root@server ~]# chmod g+s /dsoft

# harsha creates a file — it belongs to group 'college', not harsha's primary group
[harsha@server dsoft]$ touch new
[harsha@server dsoft]$ ls -l new
-rw-r--r--. 1 harsha college 0 ... new
```

>  SGID on directories is useful for **shared team folders** — all files automatically belong to the team's group.

---

### 3. Sticky Bit

When set on a **directory**, users can only delete or rename **their own files** inside it — even if they have write permission on the directory.

```bash
chmod o+t dirname       # Set sticky bit (symbolic)
chmod 1777 dirname      # Set sticky bit (numeric — 1 in front)
```

**Identified by:** `t` in the **others** execute position → `drwxrwxrwt`

**Example from lab:**
```bash
[root@server ~]# chmod o+rwx /dsoft
[root@server ~]# chmod o+t /dsoft

# harsha creates a file
[harsha@server dsoft]$ touch new

# amal tries to delete harsha's file — BLOCKED
[amal@server dsoft]$ rm -rf new
rm: cannot remove 'new': Operation not permitted
```

>  `/tmp` is the most famous sticky bit directory — everyone can write, but no one can delete others' files.

---

### Special Permissions — Summary Table

| Special Bit | Set on     | Effect                                         | Symbol | Numeric |
|-------------|------------|------------------------------------------------|--------|---------|
| SUID        | File       | Runs as file owner's permissions               | `s` in user field   | `4xxx`  |
| SGID        | Directory  | New files inherit directory's group            | `s` in group field  | `2xxx`  |
| Sticky Bit  | Directory  | Only owner can delete their own files          | `t` in others field | `1xxx`  |

---

##  Apache Web Server (httpd)

Apache (`httpd`) is the most widely used web server in Linux. On Red Hat, it's installed and managed via `yum` and `systemctl`.

### Install & Start Apache

```bash
sudo yum install httpd              # Install Apache
sudo systemctl start httpd          # Start the service
sudo systemctl status httpd         # Check if running
sudo systemctl enable httpd         # Auto-start after reboot
sudo systemctl stop httpd           # Stop the service
sudo systemctl disable httpd        # Disable auto-start
```

### Open Port 80 on AWS

After starting httpd, you must open port 80 in AWS:
> EC2 → Instance → Security → Security Group → Inbound Rules → Edit → Add Rule → HTTP (Port 80) → Save

Then visit `http://YOUR_PUBLIC_IP` in a browser → you'll see the **Red Hat Enterprise Linux Test Page**.

### Serve Your Own Web Page

```bash
cd /var/www/html        # Apache's default web root
vi index.html           # Create your HTML file
```

Once `index.html` exists, visiting your public IP shows **your page** instead of the default test page.

**Lab output — Apache running:**
```
● httpd.service - The Apache HTTP Server
   Active: active (running) since Wed 2026-05-20 05:43:18 UTC
   Main PID: 45730 (httpd)
   Status: "Total requests: 0; Idle/Busy workers 100/0"
   Listening on: port 80
```

### Firewall Commands (if firewalld is active)

```bash
sudo firewall-cmd --permanent --add-service=http    # Allow HTTP through firewall
sudo firewall-cmd --reload                          # Apply firewall changes
```

---

##  Quick Revision Table

| Command                              | Description                                        |
|--------------------------------------|----------------------------------------------------|
| `umask`                              | Show current umask value                           |
| `umask 022`                          | Set umask temporarily                              |
| `vim /etc/login.defs`                | Set umask permanently (system-wide)                |
| `chmod u+s file`                     | Set SUID on file                                   |
| `chmod 4777 file`                    | Set SUID numeric                                   |
| `chmod g+s dir`                      | Set SGID on directory                              |
| `chmod 2777 dir`                     | Set SGID numeric                                   |
| `chmod o+t dir`                      | Set sticky bit on directory                        |
| `chmod 1777 dir`                     | Set sticky bit numeric                             |
| `ps -ef \| grep passwd`              | Check running process owner                        |
| `ll /usr/bin/passwd`                 | See SUID on passwd command                         |
| `sudo yum install httpd`             | Install Apache web server                          |
| `sudo systemctl start httpd`         | Start Apache                                       |
| `sudo systemctl status httpd`        | Check Apache status                                |
| `sudo systemctl enable httpd`        | Enable Apache on boot                              |
| `sudo systemctl stop httpd`          | Stop Apache                                        |
| `sudo systemctl disable httpd`       | Disable Apache on boot                             |
| `cd /var/www/html`                   | Apache web root — put HTML files here              |
| `firewall-cmd --add-service=http`    | Open HTTP in firewall                              |
| `firewall-cmd --reload`              | Reload firewall rules                              |

---

##  Key Takeaway

> SUID, SGID, and Sticky Bit are powerful but dangerous if misused. SUID on a file means it runs as root — putting SUID on the wrong file is a classic privilege escalation vulnerability. Sticky Bit on `/tmp` is a security essential. And Apache is the gateway to understanding how web servers sit on top of Linux — the same fundamentals apply to Nginx, Node, and cloud-hosted apps.

---
