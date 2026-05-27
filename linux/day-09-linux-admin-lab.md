# Day 09 — Linux Administration Lab Task

| Field          | Details                          |
|----------------|----------------------------------|
| **Day**        | Day 09                           |
| **Date**       | May 27, 2026                     |
| **Topic**      | Linux Administration Lab — File Ops, Users, Permissions, Services, Apache, Bash Scripting & Cron |
| **Type**       | Practical / Lab Task             |
| **Environment**| AWS EC2 · Red Hat Linux · SSH from Windows CMD · Hostname: `wordpress-server` |

---

## What I Did Today

Today was a consolidation lab — a structured practical task covering everything from the past two weeks in one session. Seven tasks, one server, zero hand-holding. I ran through file operations, user and group management, file permissions (numeric chmod), `systemctl` service control, a full Apache install with firewall config, a real bash backup script, and finally a user-creation script with interactive input. This wasn't new material — it was proving I can actually *do* it, not just recall it. Every command below was executed live on the EC2 instance.

---

## Task 1: Create, Copy, Move, Rename, and Delete Files

### Step 1 — Create files and directory

```bash
touch file1            # create empty file1
touch file2            # create empty file2
mkdir test             # create directory named test
ls                     # verify all three exist
```

**Terminal output:**
```
[ec2-user@wordpress-server ~]$ touch file1
[ec2-user@wordpress-server ~]$ touch file2
[ec2-user@wordpress-server ~]$ mkdir test
[ec2-user@wordpress-server ~]$ ls
file1  file2  test  wpbackup
```

### Step 2 — Copy a file

```bash
cp file1 test/         # copy file1 into the test/ directory (original stays)
ls test                # verify file1 now exists inside test/
```

**Terminal output:**
```
[ec2-user@wordpress-server ~]$ cp file1 test/
[ec2-user@wordpress-server ~]$ ls test
file1
```

>  `cp` leaves the source file untouched. If you want to move instead of copy, use `mv`.

### Step 3 — Move a file

```bash
mv file2 test/         # move file2 into test/ (file2 disappears from current dir)
ls test                # both file1 and file2 now inside test/
ls                     # file2 is gone from home dir
```

**Terminal output:**
```
[ec2-user@wordpress-server ~]$ mv file2 test/
[ec2-user@wordpress-server ~]$ ls test
file1  file2
[ec2-user@wordpress-server ~]$ ls
file1  test  wpbackup
```

### Step 4 — Rename a file

```bash
mv file1 newfile1      # mv doubles as rename when destination is a new name in the same dir
ls
```

**Terminal output:**
```
[ec2-user@wordpress-server ~]$ mv file1 newfile1
[ec2-user@wordpress-server ~]$ ls
newfile1  test  wpbackup
```

>  Linux has no dedicated `rename` command for simple single-file renames. `mv oldname newname` is the standard approach.

### Step 5 — Delete file and directory

```bash
rm newfile1            # delete a single file
rm -r test             # delete directory and everything inside it (recursive)
ls                     # only wpbackup remains
```

**Terminal output:**
```
[ec2-user@wordpress-server ~]$ rm newfile1
[ec2-user@wordpress-server ~]$ ls
test  wpbackup
[ec2-user@wordpress-server ~]$ rm -r test
[ec2-user@wordpress-server ~]$ ls
wpbackup
```

>  `rm -r` is silent and permanent — there is no recycle bin on Linux. Always double-check the path before running it.

### Task 1 Quick Reference

| Operation | Command | Notes |
|-----------|---------|-------|
| Create file | `touch filename` | Creates empty file |
| Create directory | `mkdir dirname` | Creates empty directory |
| Copy file | `cp src dest/` | Source remains |
| Move file | `mv src dest/` | Source is removed |
| Rename | `mv oldname newname` | Same directory |
| Delete file | `rm filename` | Permanent |
| Delete directory | `rm -r dirname` | Recursive, permanent |

---

## Task 2: User and Group Management

```bash
sudo useradd student1               # create new user account
sudo passwd student1                # set password (prompted interactively)
```

```bash
sudo groupadd linuxgroup            # create a new group
sudo usermod -aG linuxgroup student1  # add student1 to linuxgroup (-a = append, -G = supplementary group)
groups student1                     # verify group membership
```

**Terminal output:**
```
[ec2-user@wordpress-server ~]$ sudo useradd student1
[ec2-user@wordpress-server ~]$ sudo passwd student1
New password:
BAD PASSWORD: The password is shorter than 8 characters
Retype new password:
passwd: password updated successfully
[ec2-user@wordpress-server ~]$ ls /home/
ec2-user  student1
[ec2-user@wordpress-server ~]$ sudo groupadd linuxgroup
[ec2-user@wordpress-server ~]$ sudo usermod -aG linuxgroup student1
[ec2-user@wordpress-server ~]$ groups student1
student1 : student1 linuxgroup
```

>  Always use `-aG` (append) with `usermod`, never just `-G`. Using `-G` alone **replaces** all existing group memberships — you can accidentally lock a user out of sudo.

>  The `BAD PASSWORD` warning is just a policy hint — the password was still accepted and set. In production, enforce strong passwords via PAM.

### Key Concepts

| Command | What it does |
|---------|-------------|
| `useradd username` | Creates user (no home dir by default on RHEL without `-m`) |
| `passwd username` | Sets or changes password |
| `groupadd groupname` | Creates a new group |
| `usermod -aG group user` | Appends user to a supplementary group |
| `groups username` | Lists all groups a user belongs to |
| `id username` | Shows UID, GID, and all group memberships |

---

## Task 3: File Permissions

```bash
touch permission.txt          # create a test file
ls -l permission.txt          # check default permissions
```

```bash
chmod 777 permission.txt      # grant full rwx to owner, group, and others
ls -l                         # verify: should show -rwxrwxrwx

chmod 755 permission          # owner: rwx | group: r-x | others: r-x
ls -l

chmod 644 permission          # owner: rw- | group: r-- | others: r--
ls -l
```

**Terminal output:**
```
[ec2-user@wordpress-server ~]$ touch permission
[ec2-user@wordpress-server ~]$ ls -l
total 0
-rw-r--r--. 1 ec2-user ec2-user  0 May 27 06:04 permission
drwxr-xr-x. 2 ec2-user ec2-user 51 May 21 09:47 wpbackup
[ec2-user@wordpress-server ~]$ chmod 777 permission
[ec2-user@wordpress-server ~]$ ls -l
total 0
-rwxrwxrwx. 1 ec2-user ec2-user  0 May 27 06:04 permission
drwxr-xr-x. 2 ec2-user ec2-user 51 May 21 09:47 wpbackup
[ec2-user@wordpress-server ~]$ chmod 755 permission
[ec2-user@wordpress-server ~]$ ls -l
total 0
-rwxr-xr-x. 1 ec2-user ec2-user  0 May 27 06:04 permission
drwxr-xr-x. 2 ec2-user ec2-user 51 May 21 09:47 wpbackup
[ec2-user@wordpress-server ~]$ chmod 644 permission
[ec2-user@wordpress-server ~]$ ls -l
total 0
-rw-r--r--. 1 ec2-user ec2-user  0 May 27 06:04 permission
drwxr-xr-x. 2 ec2-user ec2-user 51 May 21 09:47 wpbackup
```

###  Permission Values — Interview Essential

| Value | Permission | Symbol |
|-------|-----------|--------|
| 4 | Read | `r` |
| 2 | Write | `w` |
| 1 | Execute | `x` |
| 0 | None | `-` |

Values add up per entity (owner / group / others):

| Mode | Owner | Group | Others | Use case |
|------|-------|-------|--------|----------|
| `777` | rwx | rwx | rwx | Dangerous — full access to everyone |
| `755` | rwx | r-x | r-x | Standard for executables and directories |
| `644` | rw- | r-- | r-- | Standard for regular files |
| `600` | rw- | --- | --- | Private files (e.g. SSH keys) |

>  `chmod 777` should never be used in production. It gives every user on the system write and execute access — a serious security risk.

---

## Task 4: Manage Services with systemctl

```bash
systemctl status sshd                  # check current state of the SSH daemon
sudo systemctl start sshd              # start the service
sudo systemctl stop sshd               # stop the service
sudo systemctl restart sshd            # stop + start in one command
sudo systemctl enable sshd             # enable auto-start at boot
systemctl status sshd                  # confirm running state
```

**Terminal output (status after start + enable):**
```
[ec2-user@wordpress-server ~]$ systemctl status sshd
● sshd.service - OpenSSH server daemon
     Loaded: loaded (/usr/lib/systemd/system/sshd.service; enabled; preset: enabled)
     Active: active (running) since Wed 2026-05-27 06:10:03 UTC; 20s ago
 Invocation: 633ca7bcc6844e1f98a0d2416083565c
       Docs: man:sshd(8)
             man:sshd_config(5)
   Main PID: 2280 (sshd)
      Tasks: 1 (limit: 4145)
     Memory: 1.2M (peak: 1.5M)
        CPU: 13ms
     CGroup: /system.slice/sshd.service
             └─2280 "sshd: /usr/sbin/sshd -D [listener] 0 of 10-100 startups"

May 27 06:10:03 wordpress-server systemd[1]: Starting sshd.service - OpenSSH server daemon...
May 27 06:10:03 wordpress-server sshd[2280]: Server listening on 0.0.0.0 port 22.
May 27 06:10:03 wordpress-server sshd[2280]: Server listening on :: port 22.
May 27 06:10:03 wordpress-server systemd[1]: Started sshd.service - OpenSSH server daemon.
```

###  systemctl Cheat Sheet

| Command | Action |
|---------|--------|
| `systemctl status <svc>` | Show running state, PID, recent logs |
| `systemctl start <svc>` | Start now (not persistent across reboots) |
| `systemctl stop <svc>` | Stop now |
| `systemctl restart <svc>` | Stop then start |
| `systemctl enable <svc>` | Auto-start at boot (persistent) |
| `systemctl disable <svc>` | Remove from boot |
| `systemctl is-active <svc>` | Returns "active" or "inactive" |

>  `start` and `enable` are separate operations. Starting a service runs it now; enabling it makes it survive a reboot. You usually want both: `sudo systemctl enable --now sshd`.

---

## Task 5: Install and Configure Apache Web Server

### Install and start

```bash
sudo dnf update -y                        # update all installed packages first
sudo dnf install httpd -y                 # install Apache (package name is httpd on RHEL/CentOS)
sudo systemctl start httpd                # start Apache
sudo systemctl enable httpd               # enable at boot
sudo systemctl status httpd              # verify active (running)
```

**Terminal output:**
```
[ec2-user@wordpress-server ~]$ sudo dnf install httpd -y
Updating Subscription Management repositories.
Unable to read consumer identity
This system is not registered with an entitlement server. You can use "rhc" or "subscription-manager" to register.
Last metadata expiration check: 0:39:06 ago on Wed May 27 05:37:54 2026.
Package httpd-2.4.63-13.el10.x86_64 is already installed.
Dependencies resolved.
Nothing to do.
Complete!
[ec2-user@wordpress-server ~]$ sudo systemctl start httpd
[ec2-user@wordpress-server ~]$ sudo systemctl enable httpd
[ec2-user@wordpress-server ~]$ sudo systemctl status httpd
● httpd.service - The Apache HTTP Server
     Loaded: loaded (/usr/lib/systemd/system/httpd.service; enabled; preset: disabled)
   Drop-In: /etc/systemd/system/httpd.service.d
             └─php-fpm.conf
     Active: active (running) since Wed 2026-05-27 04:59:26 UTC; 1h 17min ago
 Invocation: b62303031a9e4063a032755c0f9085bc
       Docs: man:httpd.service(8)
   Main PID: 844 (httpd)
     Status: "Total requests: 6; Idle/Busy workers 100/0;Requests/sec: 0.00129; Bytes served/sec: 57 B/sec"
      Tasks: 230 (limit: 4145)
     Memory: 20.8M (peak: 22.4M)
        CPU: 4.713s
     CGroup: /system.slice/httpd.service
             ├─ 844 /usr/sbin/httpd -DFOREGROUND
             ├─ 948 /usr/sbin/httpd -DFOREGROUND
             ├─ 949 /usr/sbin/httpd -DFOREGROUND
             ├─ 952 /usr/sbin/httpd -DFOREGROUND
             ├─ 953 /usr/sbin/httpd -DFOREGROUND
             └─1767 /usr/sbin/httpd -DFOREGROUND
```

### Open HTTP through the firewall

```bash
sudo firewall-cmd --state                          # confirm firewalld is running
sudo firewall-cmd --permanent --add-service=http   # allow HTTP (port 80) permanently
sudo firewall-cmd --reload                         # apply the change
sudo firewall-cmd --list-services                  # verify http is listed
```

### Get the server's public IP

```bash
ip a                # shows all network interfaces and IPs
curl ifconfig.me    # on EC2: returns the public IP directly
```

### Create a custom test page

```bash
echo "<h1>Apache Successfully Configured by Eshan</h1>" | sudo tee /var/www/html/index.html
sudo systemctl restart httpd
```

Then open in browser: `http://65.2.178.185/`

The browser returned: **Apache Successfully Configured by Eshan**

>  `/var/www/html/` is Apache's default document root on RHEL. Anything placed here is served over HTTP. `tee` writes to the file while also printing to stdout — useful because we need `sudo` for the write, which a redirect (`>`) wouldn't inherit.

>  The EC2 Security Group must also allow inbound port 80 (HTTP). `firewall-cmd` only controls the OS-level firewall — AWS SG is a separate layer.

### Apache Setup Summary

| Step | Command |
|------|---------|
| Install | `sudo dnf install httpd -y` |
| Start | `sudo systemctl start httpd` |
| Enable at boot | `sudo systemctl enable httpd` |
| Allow through firewall | `sudo firewall-cmd --permanent --add-service=http && sudo firewall-cmd --reload` |
| Document root | `/var/www/html/` |
| Config file | `/etc/httpd/conf/httpd.conf` |

---

## Task 6: Bash Script — Automatic File Backup + Cron

### Step 1 — Create source files

```bash
mkdir Documents
touch Documents/file1.txt
touch Documents/file2.txt
ls Documents              # verify: file1.txt  file2.txt
```

### Step 2 — Write the backup script

```bash
vi backup.sh              # open vi editor
```

Press `i` to enter insert mode, then paste:

```bash
#!/bin/bash

SOURCE=/home/ec2-user/Documents    # folder to back up
DEST=/home/ec2-user/Backup         # destination folder

mkdir -p $DEST                     # create Backup dir if it doesn't exist (-p = no error if exists)
cp -r $SOURCE $DEST                # copy source folder recursively into destination
echo "Backup completed successfully"
```

Save and exit: `ESC` → `:wq` → `Enter`

### Step 3 — Make script executable

```bash
chmod +x backup.sh        # add execute permission for owner
ls -l backup.sh           # verify: should show -rwxr-xr-x
```

### Step 4 — Run and verify

```bash
./backup.sh               # execute the script
```

Output:
```
Backup completed successfully
```

```bash
ls Backup                 # verify Backup/Documents/ now exists
```

### Step 5 — Schedule with cron

```bash
crontab -e                # open cron editor (select vi if prompted)
```

Add at the bottom:

```bash
0 8 * * * /home/ec2-user/backup.sh
```

Save and exit: `ESC` → `:wq`

```bash
crontab -l                # list all cron jobs to verify
```

**Terminal output:**
```
[ec2-user@wordpress-server ~]$ crontab -e
no crontab for ec2-user - using an empty one
crontab: installing new crontab
[ec2-user@wordpress-server ~]$ crontab -l
0 8 * * * /home/ec2-user/backup.sh
```

###  Cron Syntax — Interview Essential

```
┌─── minute (0-59)
│  ┌─── hour (0-23)
│  │  ┌─── day of month (1-31)
│  │  │  ┌─── month (1-12)
│  │  │  │  ┌─── day of week (0-7, 0=Sun)
│  │  │  │  │
0  8  *  *  *   /home/ec2-user/backup.sh
```

`0 8 * * *` — runs at 08:00 every day, every month, every day of the week.

| Field | Value | Meaning |
|-------|-------|---------|
| Minute | `0` | At minute 0 |
| Hour | `8` | At 8 AM |
| Day | `*` | Every day |
| Month | `*` | Every month |
| Weekday | `*` | Any day of week |

>  Always use the **full absolute path** in cron jobs (`/home/ec2-user/backup.sh`, not `./backup.sh`). Cron runs with a minimal environment and may not know your working directory.

---

## Task 7: Bash Script — Interactive User Creation

### Write the script

```bash
vi createuser.sh
```

Press `i`, then paste:

```bash
#!/bin/bash

echo "Enter username:"
read username                          # read input from the user at runtime

sudo useradd $username                 # create the user account
echo "Set password for user"
sudo passwd $username                  # prompt to set password interactively

echo "User created successfully"
```

Save: `ESC` → `:wq`

### Make executable and run

```bash
chmod +x createuser.sh
./createuser.sh
```

**Terminal output:**
```
[ec2-user@wordpress-server ~]$ ./createuser.sh
Enter username:
Eshan
Set password for user
New password:
BAD PASSWORD: The password is shorter than 8 characters
Retype new password:
passwd: password updated successfully
User created successfully
```

### Verify the user was created

```bash
cat /etc/passwd | grep Eshan
# Output: Eshan:x:1002:1003::/home/Eshan:/bin/bash

id Eshan
# Output: uid=1002(Eshan) gid=1003(Eshan) groups=1003(Eshan)
```

**Terminal output:**
```
[ec2-user@wordpress-server ~]$ cat /etc/passwd | grep Eshan
Eshan:x:1002:1003::/home/Eshan:/bin/bash
[ec2-user@wordpress-server ~]$ id Eshan
uid=1002(Eshan) gid=1003(Eshan) groups=1003(Eshan)
```

>  `read` is how bash gets interactive input at runtime. The value entered is stored in the variable `$username` and used in subsequent commands. This is the foundation of interactive shell scripts.

### `/etc/passwd` field breakdown

```
Eshan  :  x  :  1002  :  1003  :  :  /home/Eshan  :  /bin/bash
  │       │      │        │       │       │               │
username  │     UID      GID    GECOS   home dir       shell
      password hash
      (x = stored in /etc/shadow)
```

---

##  Interview / Viva Q&A

**Q: What is the difference between `cp` and `mv`?**
A: `cp` copies — source remains. `mv` moves — source is deleted. Both accept `-r` for directories.

**Q: What does `chmod 755` mean in terms of permissions?**
A: Owner gets read+write+execute (7), group gets read+execute (5), others get read+execute (5). The standard mode for executables and public directories.

**Q: What is the difference between `systemctl start` and `systemctl enable`?**
A: `start` runs the service immediately but only for this boot. `enable` registers it to start automatically on every future boot. Use `enable --now` to do both at once.

**Q: Why is `-aG` important in `usermod -aG`?**
A: The `-a` flag means "append." Without it, `-G` replaces all supplementary groups with only the one specified — you can accidentally remove a user from the `wheel` (sudo) group.

**Q: What is the cron field order?**
A: Minute, Hour, Day-of-month, Month, Day-of-week. Memory trick: **M H D M W** — "My Hours Don't Matter Weekdays."

**Q: What does `read` do in a bash script?**
A: It pauses execution and waits for input from the user (stdin), storing the typed value in the named variable.

**Q: What is the document root for Apache on RHEL?**
A: `/var/www/html/` — place your HTML/PHP files here to serve them over HTTP.

**Q: Why use `tee` instead of `>` when writing to a root-owned file?**
A: `sudo echo "..." > file` doesn't work because the shell performs the redirect as the current user before sudo elevates privileges. `echo "..." | sudo tee file` pipes the output into `tee` which runs as root and can write to the protected file.

---

## Key Takeaways

- File operations (`touch`, `cp`, `mv`, `rm`) are the daily bread of Linux — knowing the edge cases (cp vs mv, rm -r safety) matters more than memorising syntax.
- User and group management centres on three commands: `useradd`, `groupadd`, `usermod -aG`. Always append, never replace.
- Numeric chmod (755, 644, 600) is faster and less ambiguous than symbolic mode — learn the three-digit pattern by heart.
- `systemctl` is the single interface for all service management on modern Linux (systemd). `start` ≠ `enable` — know the difference.
- Apache on RHEL is `httpd`. Two firewall layers exist: OS (`firewall-cmd`) and AWS Security Group. Both must allow port 80.
- Bash scripts only need three things to run: a shebang (`#!/bin/bash`), execute permission (`chmod +x`), and a path (`./script.sh`).
- Cron uses absolute paths. Always. No exceptions.

---
