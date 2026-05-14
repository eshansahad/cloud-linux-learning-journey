# Day 01 — Linux Basics

**Date:** May 14, 2026
**Topic:** Core Linux Commands, Users, File Operations
**Lab Environment:** AWS EC2 — Red Hat Linux (via SSH from Windows CMD)

---

## 🧠 What I Learned Today

Today was my first hands-on session with Linux on a real cloud server (AWS EC2 running Red Hat Linux). I practiced navigating the terminal, switching between users, creating and reading files, and understanding the Linux directory structure.

---

## 👤 Linux Users

Linux supports multiple types of users:

| User Type   | Symbol | Description                          |
|-------------|--------|--------------------------------------|
| Normal User | `$`    | Limited permissions, everyday tasks  |
| Root User   | `#`    | Full admin privileges, superuser     |

```bash
# Normal user prompt
[ec2-user@server ~]$

# Root user prompt
[root@server ~]#
```

---

## 🔄 Switching Users

```bash
# Switch from normal user → root
sudo -i

# Switch back from root → normal user
exit

# Switch root → specific user
su - ec2-user
```

---

## 📁 Directory Navigation

```bash
pwd           # Show Present Working Directory
cd /          # Go to top-level root directory
cd            # Go to your home directory (~)
cd dir1/      # Relative path (from current location)
cd /home/ec2-user/dir1/   # Absolute path (from root /)
```

> 💡 `~` is a shorthand for your home directory (`/home/ec2-user` for normal user, `/root` for root)

---

## 📋 Listing Files

```bash
ls        # List files and folders
ls -a     # List including hidden files (files starting with .)
ls -l     # Long listing with permissions, size, date
ls -la    # Hidden files + long listing combined
```

> 💡 To create a hidden file, prefix the filename with a dot: `touch .hiddenfile`

---

## 🖥️ System Information

```bash
hostname    # Display system hostname
whoami      # Show currently logged-in user
date +%x    # Display date only       → Output: 05/14/26
date +%r    # Display time only       → Output: 06:01:27 AM
lsblk       # List attached disks and partitions
```

**Example `lsblk` output on my EC2 instance:**
```
NAME        MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
nvme0n1     259:0    0   10G  0 disk
├─nvme0n1p1 259:1    0    1M  0 part
├─nvme0n1p2 259:2    0  200M  0 part /boot/efi
└─nvme0n1p3 259:3    0  9.8G  0 part /
```

---

## 📝 File Operations

```bash
touch filename        # Create an empty file
cat > filename        # Write/overwrite content in a file
cat >> filename       # Append content to existing file
tac filename          # Display file content in reverse order
```

---

## 🔍 Reading File Content

```bash
wc filename     # Count lines, words, and characters
head filename   # View first 10 lines (default)
tail filename   # View last 10 lines (default)
```

---

## 🕘 Command History

```bash
history         # List all past commands with line numbers
!23             # Re-run command number 23 from history
```

---

## ⚙️ System & Hostname Management

```bash
sudo nmtui      # Open Network Manager UI to change hostname
exec bash       # Reload bash session to apply hostname change
sudo poweroff   # Completely power off the server
```

---

## 🗂️ Quick Revision Table

| Command         | Description                        |
|-----------------|------------------------------------|
| `pwd`           | Present working directory          |
| `ls`            | List files                         |
| `ls -a`         | Show hidden files                  |
| `ls -l`         | Long listing format                |
| `ls -la`        | Hidden + long listing              |
| `sudo -i`       | Become root user                   |
| `su - username` | Switch to specific user            |
| `whoami`        | Show current user                  |
| `hostname`      | Show system name                   |
| `touch`         | Create empty file                  |
| `cat >`         | Overwrite file content             |
| `cat >>`        | Append to file                     |
| `tac`           | Reverse file content display       |
| `head`          | First 10 lines of file             |
| `tail`          | Last 10 lines of file              |
| `wc`            | Line, word, character count        |
| `history`       | View command history               |
| `!N`            | Run Nth history command            |
| `lsblk`         | List disk information              |
| `cd /`          | Go to root directory               |
| `cd`            | Go to home directory               |
| `sudo poweroff` | Power off the server               |
| `sudo nmtui`    | Change hostname (GUI in terminal)  |
| `exec bash`     | Reload shell session               |

---

## 💭 Key Takeaway

> The root user (`#`) has **unrestricted access** to everything. Always use it carefully — one wrong command can break the entire system. For most tasks, stick to the normal user and use `sudo` only when needed.

---

## ➡️ What's Next

- Linux file permissions (`chmod`, `chown`)
- Process management (`ps`, `top`, `kill`)
- Networking basics (`ifconfig`, `ping`, `curl`)
- Package management with `yum` / `dnf` (Red Hat)
