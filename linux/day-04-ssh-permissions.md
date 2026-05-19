# Day 04 — SSH Deep Dive & File Permissions

**Date:** May 19, 2026
**Topic:** SSH Architecture, Root Login, Key-Based Auth, chmod, chown
**Lab Environment:** AWS EC2 — Red Hat Linux (via SSH from Windows CMD)

---

## 📋 What I Learned Today

Two major topics — a deep dive into SSH (how it works, enabling root login, key-based authentication between servers) and Linux file permissions (chmod numeric & symbolic, chown, chgrp). Both are critical for cloud and DevSecOps work.

---

## 🔐 SSH — Secure Shell (Deep Dive)

### What is SSH?

SSH (Secure Shell) is a network protocol for securely accessing and managing a remote Linux server over a network. It replaced insecure protocols like **Telnet**.

SSH provides:
- Secure remote login
- Encrypted communication (prevents packet sniffing & MITM attacks)
- Secure file transfer (`scp`, `sftp`)
- Remote command execution

---

### SSH Default Details

| Parameter       | Value                    |
|-----------------|--------------------------|
| Default Port    | `22`                     |
| Server Process  | `sshd`                   |
| Client Command  | `ssh`                    |
| Server Config   | `/etc/ssh/sshd_config`   |
| Client Config   | `/etc/ssh/ssh_config`    |

> 💡 Port 22 can be changed — but SELinux and AWS Security Group inbound rules must also be updated.

---

### SSH Architecture

```
Client (Local Machine)
        |
        |  SSH (Encrypted tunnel)
        |
Server (Remote Linux Machine)
        → sshd authenticates user
        → Secure session established
```

---

### Types of SSH Authentication

| Method               | Security  | Default on AWS | Notes                          |
|----------------------|-----------|----------------|--------------------------------|
| Password-Based       | Lower     | ❌ Disabled    | Easy but vulnerable            |
| Key-Based (Recommended) | Higher | ✅ Enabled    | No password, uses crypto keys  |

> 💡 **Key-based auth always takes priority over password auth** when both are enabled.

---

### SSH Key Components

| Key Type          | Description                                      |
|-------------------|--------------------------------------------------|
| Private Key       | Stays with you — **NEVER share** ❌             |
| Public Key        | Stored on the server                             |
| `authorized_keys` | File on server listing allowed public keys       |

> ⚠️ If your private key is lost, access to the server is lost permanently.

Public key is stored at:
```
/home/user/.ssh/authorized_keys
```

---

### SSH Service Management

```bash
systemctl status sshd       # Check SSH service status
systemctl restart sshd      # Restart SSH service
```

---

## 🔑 Enabling Password Authentication

By default on AWS EC2, password login is **disabled**. To enable it:

```bash
# Step 1: Switch to root
sudo -i

# Step 2: Set a password
passwd ec2-user

# Step 3: Edit SSH config
vi /etc/ssh/sshd_config
# Change: PasswordAuthentication yes

# Step 4: Restart SSH
systemctl restart sshd
```

### AWS Special Case — Cloud Init Override

On AWS, even after editing `sshd_config`, password login may still fail due to cloud-init override. Fix:

```bash
vi /etc/ssh/sshd_config.d/50-cloud-init.conf
# Change: PasswordAuthentication yes

systemctl restart sshd
```

---

## 👑 Enabling Root Login via SSH

By default, root SSH login is **disabled** via:
```
PermitRootLogin prohibit-password
```

### Steps to enable root login:

```bash
# Step 1: Set root password
sudo passwd root

# Step 2: Edit sshd_config
sudo vi /etc/ssh/sshd_config
# Change:
PermitRootLogin yes
PasswordAuthentication yes

# Step 3: Disable SELinux temporarily
sudo setenforce 0

# Step 4: Restart SSH
sudo systemctl restart sshd

# Step 5: Login as root from another machine or user
ssh root@server-ip
```

**Lab output:**
```bash
[ec2-user@ip-172-31-41-198 ~]$ sudo setenforce 0
[ec2-user@ip-172-31-41-198 ~]$ sudo systemctl restart sshd
[ec2-user@ip-172-31-41-198 ~]$ ssh root@65.2.176.180
root@65.2.176.180's password:
Last login: Tue May 19 08:59:39 2026
[root@ip-172-31-41-198 ~]#
```

### Root Login Summary

Both must be set to `yes` in `/etc/ssh/sshd_config`:
```
PasswordAuthentication yes
PermitRootLogin yes
```

---

## 🔒 SELinux

SELinux is the **default security system** built into Red Hat Linux. It enforces strict access control policies on top of standard permissions.

```bash
sudo setenforce 0       # Temporarily disable SELinux (until next reboot)
```

> 💡 When changing the SSH port from default (22), you must:
> 1. Update `/etc/ssh/sshd_config` → `Port XXXX`
> 2. Update SELinux
> 3. Add the new port in AWS → Security Group → Inbound Rules

---

## 🔑 Key-Based Auth: Server A → Server B (Passwordless SSH)

Goal: SSH from Server A into Server B **without a password**.

```bash
# Step 1: Test connectivity
ping serverB_ip

# Step 2: On Server B — temporarily enable password login
vim /etc/ssh/sshd_config
# PasswordAuthentication yes
# PermitRootLogin yes
systemctl restart sshd

# Step 3: On Server A — generate SSH key pair
ssh-keygen
# or for stronger key:
ssh-keygen -t ed25519 -C "serverA"

# Step 4: Copy public key to Server B
ssh-copy-id root@serverB_ip
# Type yes → enter password (only this once)

# Step 5: Test passwordless login
ssh root@serverB_ip
# ✅ No password asked!
```

### Generated Key Files

| File                     | Purpose      |
|--------------------------|--------------|
| `id_rsa` / `id_ed25519`  | Private Key  |
| `id_rsa.pub`             | Public Key   |

> 💡 `ed25519` is faster and more secure than RSA — recommended for new keys.

---

### Security Best Practices (Important for DevSecOps)

```bash
# After setting up key auth, disable password login
PasswordAuthentication no

# Disable root SSH login in production
PermitRootLogin no

# Use normal user + sudo instead of root
# Change default SSH port (advanced hardening)
```

---

## 🛡️ File Permissions (`chmod`)

### Permission Values

| Permission | Symbol | Value |
|------------|--------|-------|
| Read       | `r`    | `4`   |
| Write      | `w`    | `2`   |
| Execute    | `x`    | `1`   |
| All (rwx)  |        | `7`   |
| None       | `-`    | `0`   |

### Permission Groups

```
drwxr-xr-x
│ │││ │││ │││
│ ││└─┤ └─┤ └── Others (o)
│ │└──┤ └──── Group (g)
│ └───────── User/Owner (u)
└─────────── File type (d=dir, -=file, l=link)
```

### Numeric chmod

```bash
chmod 400 file1     # User: read only              → r--------
chmod 644 file1     # User: rw, Group+Others: r    → rw-r--r-- (default for files)
chmod 755 file1     # User: all, Group+Others: rx  → rwxr-xr-x (default for dirs)
chmod 777 file1     # Everyone: full access        → rwxrwxrwx
```

> 💡 `chmod 644` is the standard default permission for files. `chmod 755` for directories.

### Symbolic chmod

```bash
chmod u+w file1     # Add write permission for user
chmod g-x file1     # Remove execute from group
chmod o+r file1     # Add read for others
chmod a+x file1     # Add execute for all (user, group, others)
```

| Symbol | Means   |
|--------|---------|
| `u`    | User    |
| `g`    | Group   |
| `o`    | Others  |
| `a`    | All     |
| `+`    | Add permission    |
| `-`    | Remove permission |

> 🎯 **Interview tip:** Which permission allows deleting a file? **Write (`w`)** — not execute. Many people get this wrong.

---

## 👤 Change Ownership (`chown`, `chgrp`)

```bash
chown user2 file1                       # Change file owner to user2
chown :groupname filename               # Change group only
chown username:groupname filename       # Change both owner and group
chgrp groupname filename                # Change group only (alternative)
chown -R username directory             # Recursively change owner of directory + all contents
```

**Lab output — chown in action:**

```bash
# dir1 was created by root — owned by root
[ec2-user@server ~]$ ls -l
drwxr-xr-x. 3 root root 18 May 19 09:16 dir1

# Change owner to ec2-user (user only)
[ec2-user@server ~]$ sudo chown -R ec2-user dir1
drwxr-xr-x. 3 ec2-user root 18 May 19 09:16 dir1

# Change both owner AND group to ec2-user
[ec2-user@server ~]$ sudo chown -R ec2-user:ec2-user dir1
drwxr-xr-x. 3 ec2-user ec2-user 18 May 19 09:16 dir1
```

---

## 🗂️ Quick Revision Table

| Command / Config                     | Description                                       |
|--------------------------------------|---------------------------------------------------|
| `/etc/ssh/sshd_config`               | SSH server config file                            |
| `/etc/ssh/ssh_config`                | SSH client config file                            |
| `systemctl status sshd`              | Check SSH service                                 |
| `systemctl restart sshd`             | Restart SSH service                               |
| `PasswordAuthentication yes`         | Enable password login in sshd_config              |
| `PermitRootLogin yes`                | Allow root SSH login                              |
| `setenforce 0`                       | Temporarily disable SELinux                       |
| `ssh-keygen`                         | Generate SSH key pair                             |
| `ssh-keygen -t ed25519`              | Generate more secure ED25519 key                  |
| `ssh-copy-id user@ip`                | Copy public key to remote server                  |
| `ssh user@ip`                        | Connect to remote server                          |
| `chmod 644 file`                     | Standard file permission (rw-r--r--)              |
| `chmod 755 dir`                      | Standard directory permission (rwxr-xr-x)         |
| `chmod 777 file`                     | Full permission for everyone                      |
| `chmod u+w file`                     | Add write to user                                 |
| `chown user file`                    | Change file owner                                 |
| `chown user:group file`              | Change owner and group                            |
| `chown -R user dir`                  | Recursively change owner of directory             |
| `chgrp group file`                   | Change group only                                 |

---

## 💭 Key Takeaway

> SSH is the gateway to every cloud server. Understanding how to harden it (disable root login, disable password auth, use key-based auth) is core DevSecOps knowledge. File permissions (`chmod`/`chown`) control who can do what on your system — getting these wrong is a common security vulnerability.

---
