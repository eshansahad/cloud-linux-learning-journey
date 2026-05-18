# Day 03 — User Management, Groups & SSH Key Authentication

**Date:** May 18, 2026
**Topic:** Local Users & Groups, UID/GID, sudo privileges, SSH keygen & Remote Access
**Lab Environment:** AWS EC2 — Red Hat Linux (via SSH from Windows CMD)

---

## 📋 What I Learned Today

Deep dive into Linux user and group management — creating, locking, deleting users, assigning sudo privileges, and understanding how SSH key-based authentication works for secure remote server access.

---

## 👤 What is a User?

A **user** in Linux is any entity (human or process) that interacts with the system through a user account. Each account has:
- A unique username and User ID (UID)
- A home directory
- A default shell
- Access permissions

### Types of Users

| Type         | Description                                                          |
|--------------|----------------------------------------------------------------------|
| Normal User  | Standard user with limited permissions, `$` prompt                  |
| Root User    | Superuser with full system access, `#` prompt                       |
| System User  | Background processes/services, no interactive login                  |

---

## 🛠️ Creating & Managing Users

### Create a User

```bash
useradd username        # Create a new user
passwd username         # Set password for the user
```

### Verify User Was Created

```bash
# Method 1 — Check home directory
cd /home && ls

# Method 2 — Check passwd file
tail -n 2 /etc/passwd

# Method 3 — Check shadow file (encrypted passwords)
tail -n 2 /etc/shadow
```

### Reading `/etc/passwd` fields

```
eshan:x:1001:1001::/home/eshan:/bin/bash
```

| Field          | Value           | Meaning                              |
|----------------|-----------------|--------------------------------------|
| Username       | `eshan`         | Login name                           |
| Password       | `x`             | Stored encrypted in `/etc/shadow`    |
| UID            | `1001`          | User ID                              |
| GID            | `1001`          | Primary Group ID                     |
| User Info      | (empty)         | Optional comment/gecos field         |
| Home Directory | `/home/eshan`   | User's home folder                   |
| Shell          | `/bin/bash`     | Default shell                        |

**Lab output:**
```bash
[root@server ~]# useradd eshan
[root@server ~]# passwd eshan
[root@server ~]# tail -n 3 /etc/passwd
systemd-coredump:x:992:992:systemd Core Dumper:/:/usr/sbin/nologin
ec2-user:x:1000:1000:Cloud User:/home/ec2-user:/bin/bash
eshan:x:1001:1001::/home/eshan:/bin/bash
```

---

## 🔐 Lock & Unlock Users

```bash
usermod -L username     # Lock a user (adds ! in /etc/shadow)
usermod -U username     # Unlock a user (removes !)
```

> 💡 A `!` before the password hash in `/etc/shadow` means the account is **locked**.

```bash
# Locked:
eshan:!$6$abc...

# Unlocked:
eshan:$6$abc...
```

---

## 🐚 Change User Shell

```bash
usermod -s /sbin/nologin username   # Disable login (no shell)
usermod -s /bin/bash username       # Re-enable bash shell
```

| Shell            | Meaning                                      |
|------------------|----------------------------------------------|
| `/bin/bash`      | Interactive shell — user can log in          |
| `/sbin/nologin`  | Non-interactive — user cannot log in         |

---

## 🗑️ Delete a User

```bash
userdel -r username     # Delete user AND their home directory
```

> ⚠️ `-r` removes everything: home directory, mailbox, and related files.

---

## 🔢 UID — User Identifier

Every user has a unique numerical ID:

| UID Range  | Assigned To                                              |
|------------|----------------------------------------------------------|
| `0`        | Root / Superuser (always)                                |
| `1–200`    | System users assigned statically by Red Hat              |
| `201–999`  | System processes that don't own files                    |
| `1000+`    | Regular/new users                                        |

```bash
useradd -u 3000 username    # Create user with specific UID 3000
```

---

## 👥 Group Management

### Types of Groups

| Type      | Description                                                        |
|-----------|--------------------------------------------------------------------|
| Primary   | Default group assigned at user creation                            |
| Secondary | Additional groups a user can be added to                           |

### Group Commands

```bash
groupadd groupname              # Create a group
groupadd -g 3001 groupname      # Create group with specific GID

tail -n 2 /etc/group            # View last 2 groups

usermod -G groupname username   # Add user to a group (replaces existing)
usermod -aG groupname username  # Append user to group (keeps existing groups)

groups username                 # List all groups a user belongs to

gpasswd -d username groupname   # Remove user from a group
groupdel groupname              # Delete a group
```

### Reading `/etc/group` fields

```
college:x:1001:eshan
```

`groupname : password : GID : members`

---

## 🔑 sudo — Superuser Access

### Why sudo?

Normal users can't run admin commands. `sudo` temporarily grants root-level access for specific commands.

```bash
sudo useradd newuser        # Run useradd as root (if sudo permitted)
```

### Granting sudo — Method 1: Wheel Group

```bash
# Edit sudoers file
vim /etc/sudoers

# Allow wheel group members to use sudo
%wheel ALL=(ALL) ALL

# Allow without password prompt
%wheel ALL=(ALL) NOPASSWD: ALL

# Add user to wheel group
usermod -aG wheel username
```

### Granting sudo — Method 2: Manual Entry

```bash
vim /etc/sudoers

# Full sudo access
harsha ALL=(ALL) ALL

# Without password
harsha ALL=(ALL) NOPASSWD: ALL

# Restrict to specific command only
harsha ALL=(ALL) /usr/sbin/useradd
```

> 💡 `%wheel` means the **group** named wheel. Without `%` it's a specific user.

---

## 🔐 SSH — Secure Remote Access

### What is SSH?

SSH (Secure Shell) uses **port 22** to connect securely to a remote server. It uses **asymmetric key encryption** — two mathematically linked keys:

| Key Type    | Extension       | Purpose                          |
|-------------|-----------------|----------------------------------|
| Private Key | `.pem`, `.ppk`  | Kept secret — acts as your key   |
| Public Key  | `.pub`          | Shared — acts as the lock        |

> 💡 The public key goes on the **server**. The private key stays on **your machine**. Never share your private key.

---

### Connecting to Server via SSH

```bash
ssh -i private_key.pem username@server-ip
```

**Lab output (Image 1):**
```
C:\Users\allin> ssh -i [key] 3.111.245.211
The authenticity of host '3.111.245.211' can't be established.
Are you sure you want to continue connecting? yes
Warning: Permanently added to known_hosts.
[eshan@server ~]$
```

---

### Generating SSH Keys — `ssh-keygen`

```bash
ssh-keygen          # Generate a key pair (default: ED25519 or RSA)
```

**Lab output (Image 2):**
```
Generating public/private ed25519 key pair.
Enter file to save key: eshan1
Enter passphrase: (empty for no passphrase)
Your identification has been saved in eshan1
Your public key has been saved in eshan1.pub
```

> 💡 **Passphrase** adds an extra layer of security on top of the key itself.

Default key types:
- Private key: `id_rsa` (or custom name)
- Public key: `id_rsa.pub` (or custom name `.pub`)

---

### Setting Up Key Auth for a New User

```bash
# 1. Switch to the new user
su - username

# 2. Create .ssh directory if it doesn't exist
mkdir .ssh

# 3. Create authorized_keys file and paste public key
vi .ssh/authorized_keys

# 4. Connect from your machine
ssh username@server-ip
```

**Lab output (Image 3):**
```bash
[root@server ~]# useradd eshan
[root@server ~]# passwd eshan
[root@server ~]# tail -n 3 /etc/passwd
eshan:x:1001:1001::/home/eshan:/bin/bash

# SSH denied without key setup:
eshan@3.111.245.211: Permission denied (publickey,gssapi-keyex)
```

> 💡 SSH key auth must be set up before password-based SSH will work on AWS EC2 — AWS disables password login by default.

---

### Converting Key to `.ppk` for PuTTY (Windows)

If you use **PuTTY** instead of CMD:

1. Open **PuTTYgen** (installed with PuTTY)
2. Click **Load** → change dropdown to `All Files (*.*)` → select your private key file
3. Click **OK** on success message
4. Click **Save private key** (say Yes to saving without passphrase if prompted)
5. Save as `user-putty.ppk`
6. Use this `.ppk` file in PuTTY → Connection → SSH → Auth → Credentials

---

## 🗂️ Quick Revision Table

| Command                        | Description                                    |
|--------------------------------|------------------------------------------------|
| `useradd username`             | Create a new user                              |
| `passwd username`              | Set user password                              |
| `tail -n 2 /etc/passwd`        | View last 2 user entries                       |
| `tail -n 2 /etc/shadow`        | View last 2 encrypted password entries         |
| `usermod -L username`          | Lock a user account                            |
| `usermod -U username`          | Unlock a user account                          |
| `usermod -s /sbin/nologin`     | Disable user shell (no login)                  |
| `usermod -s /bin/bash`         | Enable bash shell for user                     |
| `userdel -r username`          | Delete user and home directory                 |
| `useradd -u 3000 username`     | Create user with specific UID                  |
| `su - username`                | Switch to another user                         |
| `groupadd groupname`           | Create a group                                 |
| `groupadd -g 3001 groupname`   | Create group with specific GID                 |
| `usermod -G group username`    | Add user to group (replaces)                   |
| `usermod -aG group username`   | Append user to group (keeps existing)          |
| `gpasswd -d username group`    | Remove user from group                         |
| `groupdel groupname`           | Delete a group                                 |
| `groups username`              | List user's groups                             |
| `tail -n 2 /etc/group`         | View last 2 group entries                      |
| `vim /etc/sudoers`             | Edit sudo privileges file                      |
| `usermod -aG wheel username`   | Grant sudo via wheel group                     |
| `ssh -i key.pem user@ip`       | Connect to remote server via SSH               |
| `ssh-keygen`                   | Generate SSH key pair                          |
| `mkdir .ssh`                   | Create SSH directory for user                  |
| `vi .ssh/authorized_keys`      | Add public key for SSH access                  |

---

## 💭 Key Takeaway

> SSH key authentication is the backbone of secure cloud access. On AWS, password login is disabled by default — you **must** use keys. The private key is your identity; losing it or sharing it means losing control of your server. Always keep it safe.

---
