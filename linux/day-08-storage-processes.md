# Day 08 — Storage Partitioning & Process Management

**Date:** May 26, 2026
**Topic:** Disk Partitioning (fdisk, fstab), Process Management (ps, top, kill, nice, jobs)
**Lab Environment:** AWS EC2 — Red Hat Linux (via SSH from Windows CMD)

---

##  What I Learned Today

Two heavy topics today — full disk partitioning workflow (BIOS/UEFI, MBR/GPT, fdisk, format, mount, fstab) and deep dive into Linux process management (process states, ps, jobs, kill signals, nice/renice, top, htop).

---

##  Part 1 — Storage & Partitioning

### What is a Partition?

A partition is a logically distinct section of a physical disk. Each partition behaves like a separate disk with its own filesystem and directory structure.

### Why Partition?

| Reason                  | Explanation                                                                 |
|-------------------------|-----------------------------------------------------------------------------|
| **Backup**              | Separate user data from OS — back up only what you need                     |
| **Reinstallation**      | Format the OS partition without touching user data                          |
| **Performance**         | Place frequently accessed files on faster disk areas, isolate swap space    |

---

### Step 1 — Identify Firmware Type

```bash
dmidecode       # Shows hardware info including firmware type (BIOS or UEFI)
```

| Firmware | Partitioning Scheme | Partitioning Tool | Max Partition Size | Max Partitions |
|----------|--------------------|--------------------|-------------------|----------------|
| BIOS     | MBR                | `fdisk`            | 2 TiB             | 4 primary      |
| UEFI     | GPT                | `gdisk`            | 8 ZiB             | 128 primary    |

>  **MBR** (Master Boot Record) — older, limited to 2TB and 4 partitions. **GPT** (GUID Partition Table) — modern, supports huge disks and up to 128 partitions.

---

### Partition Types

| Type          | Description                                                              |
|---------------|--------------------------------------------------------------------------|
| Normal        | Standard data/OS partition                                               |
| Swap          | Acts as virtual memory when RAM is full                                  |
| LVM           | Logical Volume Manager — flexible, spans multiple disks, resizable       |
| Stratis       | Modern RHEL storage — snapshots, thin provisioning                       |
| VDO           | Virtual Data Optimizer — data deduplication/compression to save space    |

---

### Full Workflow — Create, Format, Mount a Partition

#### Step 1 — Check available disks

```bash
lsblk           # List all block devices
```

```
NAME   MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
xvda   202:0    0  30G  0 disk
└─xvda1 202:1   0  30G  0 part /
```

>  In AWS, attach a new EBS volume to the EC2 instance first — it shows up as `/dev/xvdf` (or similar).

---

#### Step 2 — Create a Partition with fdisk

```bash
fdisk /dev/xvdf         # Open fdisk for the new disk
```

Inside `fdisk` interactive prompt:

| Key | Action                        |
|-----|-------------------------------|
| `n` | Create new partition           |
| `p` | Select primary partition       |
| `1` | Partition number               |
| Enter | Accept default first sector |
| `+1G` | Set size to 1 GiB            |
| `w` | Write changes and exit         |
| `d` | Delete a partition             |

---

#### Step 3 — Update Kernel Partition Table

```bash
sudo partprobe          # Notify kernel of partition table changes (no reboot needed)
```

---

#### Step 4 — Format the Partition

```bash
sudo mkfs.ext4 /dev/xvdf1       # Format with ext4 filesystem
```

**What is formatting?** It creates the filesystem structure on the partition — inode table, superblock, and data structures — so the OS can store and organize files.

Common filesystems:

| Filesystem | Notes                                          |
|------------|------------------------------------------------|
| `ext4`     | Default on most Linux systems, journaled       |
| `xfs`      | Default on RHEL 7+, better for large files     |
| `ext3`     | Older, journaled ext2                          |
| `ntfs`     | Windows filesystem                             |

---

#### Step 5 — Get Partition UUID

```bash
blkid               # Show UUID of all partitions
```

>  UUID (Universally Unique Identifier) is used in `/etc/fstab` because device names like `/dev/xvdf1` can change after reboot — UUID never changes.

---

#### Step 6 — Create Mount Point

```bash
mkdir /mnt/mount        # Create directory to mount the partition to
```

---

#### Step 7 — Mount the Partition

**Temporary (lost after reboot):**
```bash
mount /dev/xvdf1 /mnt/mount     # Mount the partition
df -Th                           # Verify — shows filesystem type and usage
cd /mnt/mount                    # Access the mounted partition
```

**Permanent (survives reboot) — edit /etc/fstab:**
```bash
vim /etc/fstab
```

Add this line:
```
/dev/xvdf1   /mnt/mount   ext4   defaults   0 0
```

| Field        | Value          | Meaning                                  |
|--------------|----------------|------------------------------------------|
| Device       | `/dev/xvdf1`   | The partition to mount                   |
| Mount point  | `/mnt/mount`   | Where to mount it                        |
| Filesystem   | `ext4`         | Filesystem type                          |
| Options      | `defaults`     | Standard mount options                   |
| Dump         | `0`            | Backup utility — 0 = disabled            |
| fsck order   | `0`            | Filesystem check order — 0 = skip        |

```bash
mount -a        # Mount all filesystems listed in /etc/fstab (test your entry)
```

---

#### Delete a Partition (Optional)

```bash
fdisk /dev/xvdf
# Press d → delete partition
# Press w → write and exit

sudo partprobe  # Update kernel
```

---

### Partition Workflow Summary

```
1. lsblk              → Check available disks
2. fdisk /dev/xvdf    → Create partition (n → p → size → w)
3. partprobe          → Update kernel
4. mkfs.ext4 /dev/xvdf1  → Format with filesystem
5. blkid              → Get UUID
6. mkdir /mnt/mount   → Create mount point
7. mount /dev/xvdf1 /mnt/mount  → Temporary mount
8. vim /etc/fstab     → Add entry for permanent mount
9. mount -a           → Apply fstab changes
```

---

##  Part 2 — Process Management

### What is a Process?

A process is an **instance of a running program** with its own memory space, execution state, and system resources.

---

### Process Types

| Type           | Description                                                                  |
|----------------|------------------------------------------------------------------------------|
| Parent Process | Creates child processes using `fork()` or `exec()`                           |
| Child Process  | Created by a parent — inherits environment, file descriptors, working dir    |
| Zombie Process | Finished execution but still in process table — parent hasn't called `wait()`|

---

### Process States

| State | Code | Description                                              |
|-------|------|----------------------------------------------------------|
| Running        | `R` | Actively executing on CPU                       |
| Sleeping       | `S` | Waiting for event/signal (interruptible)        |
| Uninterruptible Sleep | `D` | Waiting for I/O — cannot be interrupted  |
| Stopped        | `T` | Halted by SIGSTOP or Ctrl+Z                     |
| Zombie         | `Z` | Terminated but entry still in process table     |

---

### `ps` — Process Snapshot

```bash
ps              # Show processes in current terminal session
ps -ef          # All processes, Unix/Linux syntax (full listing)
ps aux          # All processes, BSD syntax (with CPU/MEM %)
ps lax          # Long format with extra details
ps -ef | grep sleep     # Find a specific process by name
```

**`ps -ef` columns explained:**

| Column  | Meaning                                     |
|---------|---------------------------------------------|
| `UID`   | User who owns the process                   |
| `PID`   | Process ID — unique identifier              |
| `PPID`  | Parent Process ID                           |
| `C`     | CPU utilization                             |
| `STIME` | Start time of the process                   |
| `TTY`   | Terminal (`?` = no terminal/daemon)         |
| `TIME`  | Total CPU time consumed                     |
| `CMD`   | Command that started the process            |

**`ps aux` extra columns:**

| Column    | Meaning                                    |
|-----------|--------------------------------------------|
| `%CPU`    | CPU usage percentage                       |
| `%MEM`    | RAM usage percentage                       |
| `VSZ`     | Virtual memory size (KB)                   |
| `RSS`     | Physical RAM used (non-swapped, KB)        |
| `STAT`    | Process state (R, S, D, Z, T)              |

---

### Job Control

A **job** is a process (or group of processes) managed by the shell in a terminal session. Jobs can run in foreground or background.

```bash
sleep 400           # Run in foreground (blocks terminal)
sleep 400 &         # Run in background (& sends to background)

jobs                # List all background jobs
jobs -p             # List jobs showing PID only

fg %1               # Bring job 1 to foreground
bg %1               # Resume stopped job 1 in background
```

**Keyboard shortcuts:**

| Shortcut  | Signal    | Effect                                         |
|-----------|-----------|------------------------------------------------|
| `Ctrl+C`  | SIGINT(2) | Interrupt/terminate foreground process         |
| `Ctrl+Z`  | SIGTSTP(20)| Suspend foreground process, move to background|

**Lab output:**
```bash
[root@server ~]# sleep 500 &
[1] 3989
[root@server ~]# sleep 600 &
[2] 3993
[root@server ~]# sleep 700 &
[3] 3994
[root@server ~]# jobs
[1]   Running   sleep 500 &
[2]-  Running   sleep 600 &
[3]+  Running   sleep 700 &
```

---

### Kill Signals

```bash
kill -l                 # List all available signals
kill PID                # Gracefully terminate process (SIGTERM)
kill -9 PID             # Force kill — cannot be ignored (SIGKILL)
kill -19 PID            # Stop/suspend process (SIGSTOP)
kill -18 PID            # Resume stopped process (SIGCONT)
kill -SIGQUIT PID       # Send signal by name instead of number
killall sleep           # Kill all processes named 'sleep'
pkill sleep             # Kill by process name (like killall)
```

### Signal Reference Table  (Interview Important)

| Signal    | Number | Shortcut  | Description                                           |
|-----------|--------|-----------|-------------------------------------------------------|
| SIGHUP    | 1      | —         | Hangup — reload config files for daemons              |
| SIGINT    | 2      | Ctrl+C    | Interrupt — graceful termination                      |
| SIGQUIT   | 3      | Ctrl+\    | Quit — terminate with core dump                       |
| SIGKILL   | 9      | —         | Force kill — cannot be caught or ignored ❌           |
| SIGTERM   | 15     | —         | Graceful terminate — default `kill` signal            |
| SIGCONT   | 18     | —         | Continue — resume a stopped process                   |
| SIGSTOP   | 19     | —         | Stop — suspend process (cannot be ignored)            |
| SIGTSTP   | 20     | Ctrl+Z    | Terminal stop — suspend, user-initiated               |

>  **Interview tip:** `SIGKILL (9)` cannot be caught, blocked, or ignored — it's the only guaranteed way to kill a process. `SIGTERM (15)` is the polite request; `SIGKILL (9)` is the force command.

---

### `top` — Real-Time Process Monitor

```bash
top                     # Live updating process list (like Task Manager)
top -p PID              # Monitor a specific process by PID
top -o %MEM             # Sort by memory usage
top -o %CPU             # Sort by CPU usage
```

>  Press `q` to quit `top`. Press `k` inside `top` to kill a process interactively.

---

### `htop` — Human-Readable Process Monitor

```bash
htop                    # Enhanced, colorful, interactive version of top
```

>  `htop` is easier to read than `top` — shows CPU bars, memory bars, and allows mouse interaction. Install with `sudo yum install -y htop`.

---

### Process Priority — `nice` & `renice`

Linux assigns every process a **nice value** that determines scheduling priority.

```
Nice value range: -20 (highest priority) to +19 (lowest priority)
Default nice value: 0
```

```bash
nice -n 10 command          # Start a NEW process with priority +10 (lower priority)
nice -n -5 command          # Start with higher priority (needs root for negative values)
renice -n 5 -p PID          # Change priority of an EXISTING/RUNNING process
```

| Command   | When to use                              |
|-----------|------------------------------------------|
| `nice`    | Setting priority for a **new** process   |
| `renice`  | Changing priority of a **running** process|

>  **Interview tip:** Lower nice value = higher priority. A process with nice -20 gets more CPU time than one with nice +19. Think of it as "how nice you are to other processes" — nice +19 gives up CPU willingly.

---

### `pgrep` — Find Process by Name

```bash
pgrep sleep             # Get PID(s) of all processes named 'sleep'
pgrep -l sleep          # Show PID and process name
```

---

### `man` — Manual Pages

```bash
man kill                # Read the manual for the kill command
man ps                  # Read the manual for ps
man top                 # Read the manual for top
```

>  `man command` is your best friend for learning any command in detail. Press `q` to exit.

---

##  Quick Revision Table

| Command                      | Description                                           |
|------------------------------|-------------------------------------------------------|
| `lsblk`                      | List block devices and partitions                     |
| `fdisk /dev/xvdf`            | Create/manage partitions (MBR)                        |
| `gdisk /dev/xvdf`            | Create/manage partitions (GPT)                        |
| `partprobe`                  | Update kernel with new partition table                |
| `mkfs.ext4 /dev/xvdf1`       | Format partition as ext4                              |
| `blkid`                      | Show UUID of all partitions                           |
| `mkdir /mnt/mount`           | Create mount point                                    |
| `mount /dev/xvdf1 /mnt/mount`| Temporarily mount partition                           |
| `vim /etc/fstab`             | Edit permanent mount configuration                    |
| `mount -a`                   | Mount all entries in /etc/fstab                       |
| `df -Th`                     | Disk usage with filesystem type                       |
| `ps`                         | Process snapshot (current terminal)                   |
| `ps -ef`                     | All processes — Unix syntax                           |
| `ps aux`                     | All processes — BSD syntax with CPU/MEM               |
| `ps -ef \| grep name`        | Find specific process                                 |
| `sleep 400 &`                | Run process in background                             |
| `jobs`                       | List background jobs                                  |
| `jobs -p`                    | List job PIDs                                         |
| `fg %1`                      | Bring job 1 to foreground                             |
| `bg %1`                      | Resume job 1 in background                            |
| `kill PID`                   | Gracefully terminate process (SIGTERM)                |
| `kill -9 PID`                | Force kill process (SIGKILL)                          |
| `kill -19 PID`               | Stop/suspend process (SIGSTOP)                        |
| `kill -18 PID`               | Resume stopped process (SIGCONT)                      |
| `kill -l`                    | List all kill signals                                 |
| `killall sleep`              | Kill all processes named 'sleep'                      |
| `pkill sleep`                | Kill by name (like killall)                           |
| `top`                        | Real-time process monitor                             |
| `top -p PID`                 | Monitor specific process                              |
| `top -o %MEM`                | Sort top by memory usage                              |
| `htop`                       | Human-readable interactive process monitor            |
| `nice -n 10 cmd`             | Start new process with lower priority                 |
| `renice -n 5 -p PID`         | Change priority of running process                    |
| `pgrep sleep`                | Find PID by process name                              |
| `man kill`                   | Read manual for any command                           |
| `dmidecode`                  | Show firmware type (BIOS/UEFI)                        |

---

##  Key Takeaway

> Partitioning and process management are core sysadmin skills. Always use `/etc/fstab` for permanent mounts — `mount` alone is lost on reboot. For processes: `SIGTERM (15)` asks nicely, `SIGKILL (9)` doesn't ask at all. Understanding nice values means you can tune which processes get priority on a busy server — critical for DevSecOps and cloud work.

---
