# Day 07 — Job Scheduling (at & cron) & Disk Management

**Date:** May 25, 2026
**Topic:** One-time tasks with `at`, recurring jobs with `cron`, disk usage with `df`/`du`, partitioning intro
**Lab Environment:** AWS EC2 — Red Hat Linux (wordpress-server, via SSH from Windows CMD)

---

##  What I Learned Today

Two major topics — automating tasks using Linux schedulers (`at` for one-time, `cron` for recurring), and understanding disk usage with `df`, `du`, and `lsblk`. Also introduced to disk partitioning concepts.

---

##  Part 1 — Job Scheduling

### `at` — One-Time Scheduled Tasks

`at` schedules a command to run **once** at a specific future time.

```bash
sudo yum install -y at          # Install the at package
sudo systemctl start atd        # Start the at daemon
sudo systemctl enable atd       # Enable at boot
sudo systemctl status atd       # Verify running
```

**Lab output — atd running:**
```
● atd.service - Deferred execution scheduler
   Active: active (running) since Mon 2026-05-25 04:55:15 UTC
   Main PID: 1817 (atd)
```

---

### Creating a One-Time Task

```bash
at now +2min         # Schedule a job 2 minutes from now
```

Inside the `at` prompt, type your commands then press `Ctrl+D` (shown as `<EOT>`) to save:

```bash
[ec2-user@wordpress-server ~]$ at now +2min
warning: commands will be executed using /bin/sh
at Mon May 25 04:59:00 2026
at> touch /home/ec2-user/new
at> touch abc
at> <EOT>
job 1 at Mon May 25 04:59:00 2026
```

>  Common syntax error — `at now 2+min` is wrong. Correct format is `at now +2min`.

---

### Managing `at` Jobs

```bash
atq                     # List all pending one-time jobs
atrm jobid              # Remove a single job
atrm jobid jobid        # Remove multiple jobs at once
```

**Lab output:**
```bash
[ec2-user@wordpress-server ~]$ atq
2       Mon May 25 05:02:00 2026 a ec2-user
3       Mon May 25 05:03:00 2026 a ec2-user

[ec2-user@wordpress-server ~]$ atrm 4 5
[ec2-user@wordpress-server ~]$ atq
                        # empty — both jobs removed
```

---

### `at` Quick Reference

| Command              | Description                            |
|----------------------|----------------------------------------|
| `at now +2min`       | Run job in 2 minutes                   |
| `at now +1hour`      | Run job in 1 hour                      |
| `at 14:30`           | Run job at 2:30 PM today               |
| `atq`                | List pending jobs (at queue)           |
| `atrm jobid`         | Remove a specific job                  |
| `atrm 4 5`           | Remove multiple jobs                   |

---

##  Part 2 — Cron (Recurring Scheduled Jobs)

`cron` schedules jobs that run **repeatedly** on a defined schedule (every minute, hour, day, etc.).

```bash
sudo yum install cronie          # Install cronie package
sudo systemctl start crond       # Start the cron daemon
sudo systemctl enable crond      # Enable at boot
sudo systemctl status crond      # Verify running
```

**Lab output — crond running:**
```
● crond.service - Command Scheduler
   Active: active (running) since Mon 2026-05-25 04:46:45 UTC
   Main PID: 1556 (crond)
```

---

### Crontab Syntax

```
* * * * * command
│ │ │ │ │
│ │ │ │ └── Day of week  (0–6, Sunday=0)
│ │ │ └──── Month        (1–12)
│ │ └────── Day of month (1–31)
│ └──────── Hour         (0–23, 0=midnight, 23=11PM)
└────────── Minute       (0–59)
```

### Special Syntax

| Symbol  | Meaning                                     |
|---------|---------------------------------------------|
| `*`     | Every (any value)                            |
| `*/5`   | Every 5 units (e.g. every 5 minutes)         |
| `*/2`   | Every 2 units                                |
| `0`     | At the exact start of the unit               |

### Common Crontab Examples

```bash
* * * * * command          # Every minute
*/5 * * * * command        # Every 5 minutes
0 * * * * command          # Every hour (at :00)
0 2 * * * command          # Every day at 2:00 AM
0 2 * * 0 command          # Every Sunday at 2:00 AM
30 8 1 * * command         # 1st of every month at 8:30 AM
```

---

### Managing Crontabs

```bash
crontab -e          # Edit your cron file (opens in vi/nano)
crontab -l          # List all your cron jobs
crontab -r          # Remove your entire cron file (careful!)
```

---

### Lab — Running a Shell Script Every 2 Minutes

```bash
# cron.sh script contents
echo "hello"

# Crontab entry
*/2 * * * * . /home/ec2-user/cron.sh
```

**Cron log showing execution:**
```
May 25 05:56:01 wordpress-server CROND[2550]: (ec2-user) CMD (. /home/ec2-user/cron.sh)
May 25 05:56:01 wordpress-server CROND[2548]: (ec2-user) CMDOUT (hello)
May 25 05:56:01 wordpress-server CROND[2548]: (ec2-user) CMDEND (. /home/ec2-user/cron.sh)
May 25 05:58:01 wordpress-server CROND[2565]: (ec2-user) CMD (. /home/ec2-user/cron.sh)
May 25 05:58:01 wordpress-server CROND[2563]: (ec2-user) CMDOUT (hello)
```

>  The script ran at 05:56 and then again at 05:58 — exactly every 2 minutes as configured with `*/2`.

---

### Monitoring Cron Logs

```bash
tail -f /var/log/cron          # Continuously display cron log (live view)
```

>  `tail -f` is extremely useful for watching real-time log output — it keeps updating as new lines are added.

---

### `at` vs `cron` — Key Difference

| Feature       | `at`                          | `cron`                         |
|---------------|-------------------------------|--------------------------------|
| Type          | One-time job                  | Recurring/repeated job         |
| Use case      | Run once at a future time     | Run on a repeating schedule    |
| Daemon        | `atd`                         | `crond`                        |
| Config        | Interactive prompt            | `crontab -e`                   |
| List jobs     | `atq`                         | `crontab -l`                   |
| Remove job    | `atrm jobid`                  | Edit crontab and delete line   |
| Log file      | —                             | `/var/log/cron`                |

---

##  Part 3 — Disk Management

### `df` — Disk Filesystem Usage

`df` shows **filesystem-level** disk usage — total size, used, available, and mount points.

```bash
df              # Show disk usage in 1K blocks
df -h           # Human-readable (KB, MB, GB)
```

**Lab output — `df -h`:**
```
Filesystem      Size  Used Avail Use% Mounted on
/dev/nvme0n1p3  9.8G  3.2G  6.7G  33% /
devtmpfs        346M     0  346M   0% /dev
tmpfs           454M     0  454M   0% /dev/shm
/dev/nvme0n1p2  200M  9.0M  191M   5% /boot/efi
tmpfs            91M  4.0K   91M   1% /run/user/1000
```

---

### `du` — Disk Usage (Directory Level)

`du` shows **how much disk space** a specific directory or file is using.

```bash
du                          # Show usage of current directory (in KB)
du -h                       # Human-readable
du -h --max-depth=1         # Show only top-level subdirectories
```

**Lab output — `du`:**
```
12      ./.ssh
30196   ./wpbackup
0       ./.cache/crontab
0       ./.cache
30236   .
```

---

### `df` vs `du` — Interview Question 

| Feature       | `df`                                      | `du`                                    |
|---------------|-------------------------------------------|-----------------------------------------|
| What it shows | Filesystem-level disk space               | Directory/file level disk space         |
| Scope         | Entire mounted filesystem                 | Specific directory or file              |
| Use case      | Check how full a disk/partition is        | Find which folder is eating disk space  |
| Output        | Total, Used, Available, Use%, Mountpoint  | Size of each directory                  |

>  **Interview tip:** `df` tells you how full the disk is. `du` tells you what is filling it up. Both are essential for disk troubleshooting.

---

### `lsblk` — List Block Devices

```bash
lsblk           # Show all disks and partitions with mount points
```

**From Day 01 lab:**
```
NAME        MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
nvme0n1     259:0    0   10G  0 disk
├─nvme0n1p1 259:1    0    1M  0 part
├─nvme0n1p2 259:2    0  200M  0 part /boot/efi
└─nvme0n1p3 259:3    0  9.8G  0 part /
```

---

## 🖴 Part 4 — Disk Partitioning (Introduction)

### Partition Types

| Type             | Description                                              |
|------------------|----------------------------------------------------------|
| Normal Partition | Standard partition on a disk — fixed size                |
| LVM Partition    | Logical Volume Manager — flexible, can resize on the fly |

### Partitioning Commands (Intro)

```bash
fdisk /dev/sdX              # Interactive tool to create/delete partitions
sudo partprobe              # Notify kernel of partition table changes (no reboot needed)
sudo mkfs.ext4 /dev/sdXN    # Format partition with ext4 filesystem
mount /dev/sdXN /mountpoint # Temporarily mount partition (lost after reboot)
```

### Making Mounts Permanent

```bash
vim /etc/fstab              # Add entry here to mount automatically on boot
```

>  `mount` is **temporary** — it's lost after reboot. To make it permanent, add an entry to `/etc/fstab`.

---

##  Quick Revision Table

| Command                    | Description                                      |
|----------------------------|--------------------------------------------------|
| `sudo yum install -y at`   | Install the `at` package                         |
| `sudo systemctl start atd` | Start the at daemon                              |
| `at now +2min`             | Schedule a one-time job in 2 minutes             |
| `atq`                      | List pending at jobs                             |
| `atrm jobid`               | Remove an at job                                 |
| `atrm 4 5`                 | Remove multiple at jobs                          |
| `sudo yum install cronie`  | Install cronie (cron daemon)                     |
| `sudo systemctl start crond` | Start cron daemon                              |
| `crontab -e`               | Edit user's cron jobs                            |
| `crontab -l`               | List user's cron jobs                            |
| `crontab -r`               | Delete user's cron file                          |
| `* * * * * cmd`            | Run `cmd` every minute                           |
| `*/5 * * * * cmd`          | Run `cmd` every 5 minutes                        |
| `tail -f /var/log/cron`    | Watch cron log live                              |
| `df -h`                    | Show disk filesystem usage (human-readable)      |
| `du -h`                    | Show directory disk usage (human-readable)       |
| `du -h --max-depth=1`      | Show top-level directory sizes only              |
| `lsblk`                    | List all block devices and partitions            |
| `fdisk /dev/sdX`           | Create/manage partitions                         |
| `sudo partprobe`           | Update kernel with new partition table           |
| `sudo mkfs.ext4 /dev/sdXN` | Format partition as ext4                         |
| `mount`                    | Temporarily mount a partition                    |
| `/etc/fstab`               | Permanent mount configuration file               |

---

##  Key Takeaway

> `at` and `cron` are the foundation of Linux automation — every backup script, log rotation, and monitoring job runs through them. Understanding the 5-field cron syntax unlocks a huge amount of power. For disk management: `df` tells you the disk is full, `du` tells you what filled it — both are essential troubleshooting tools and common interview questions.

---

