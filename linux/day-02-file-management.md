# Day 02 — File Management, Links & I/O Redirection

**Date:** May 15, 2026
**Topic:** Copy, Move, Remove, Hard/Soft Links, I/O Redirection, grep, Pipeline
**Lab Environment:** AWS EC2 — Red Hat Linux (via SSH from Windows CMD)

---

## 📋 What I Learned Today

Hands-on session covering file and directory operations — copying, moving, renaming, deleting — along with the concept of hard links vs soft links, standard I/O redirection, and filtering output using `grep` and the pipeline operator.

---

## 📁 Copy, Move & Remove

### Copy — `cp`

```bash
cp file1 file2          # Copy file1 content into file2 (overwrites file2)
cp -r dir1 dir2         # Copy entire directory dir1 into dir2
```

> 💡 `cp` overwrites the destination file's contents without warning.

---

### Move & Rename — `mv`

```bash
mv file1 dir1           # Move file1 into dir1
mv file1 eshan          # Rename file1 to eshan
```

**Example from lab:**
```bash
[ec2-user@server ~]$ touch file1 abc
[ec2-user@server ~]$ ls
abc  file1
[ec2-user@server ~]$ mv file1 eshan
[ec2-user@server ~]$ ls
abc  eshan
```

> 💡 `mv` does double duty — moving AND renaming, depending on the destination.

---

### Remove — `rm` / `rmdir`

```bash
rm filename         # Remove a file
rmdir dirname       # Remove an empty directory
rm -rf dirname      # Force remove directory with all its contents
rm -rf *            # Remove everything inside current directory
```

**Example from lab:**
```bash
[ec2-user@server dir1]$ touch a b c d
[ec2-user@server dir1]$ ls
a  b  c  d
[ec2-user@server dir1]$ rm -rf *
[ec2-user@server dir1]$ ls
                        # empty — all gone
```

> ⚠️ `rm -rf *` is irreversible. Double-check your path before running it.

---

## 🔗 Hard Links vs Soft Links

### inode — The Identity of a File

Every file in Linux has a unique inode number — its actual identity on disk.

```bash
ls -i filename      # Show inode number of a file
```

```bash
[ec2-user@server ~]$ ls -i file1
389960 file1
```

---

### Hard Link — `ln`

A hard link points to the **same inode** as the original file. Both paths share the same data — editing one updates the other.

```bash
ln file1 dir1       # Create a hard link of file1 inside dir1
```

**Example from lab:**
```bash
# Original file
[ec2-user@server ~]$ ls -i file1
389960 file1

# Hard link inside dir1 — same inode!
[ec2-user@server dir1]$ ls -i file1
389960 file1

# Appending to the linked file updates the original too
[ec2-user@server dir1]$ cat >> file1
456
[ec2-user@server ~]$ cat file1
123
234
456
```

> 💡 Use hard links for **backup purposes**. Even if you delete one path, the data survives at the other.

---

### Soft Link (Symbolic Link) — `ln -s`

A soft link is a **shortcut** — it points to the file path, not the inode. If the original is deleted, the soft link breaks.

```bash
ln -s file1 dir1    # Create a soft link of file1 inside dir1
```

```bash
[ec2-user@server dir1]$ ls -l
lrwxrwxrwx. 1 ec2-user ec2-user 4 May 15 05:56 file -> file
```

> 💡 The `l` at the start of `lrwxrwxrwx` indicates it's a **linked/shortcut file**.

---

### Hard Link vs Soft Link — Quick Comparison

| Feature                       | Hard Link          | Soft Link           |
|-------------------------------|--------------------|---------------------|
| Points to                     | Same inode (data)  | File path (shortcut)|
| Works if original deleted?    | ✅ Yes             | ❌ No — link breaks |
| Use case                      | Backup             | Shortcut / alias    |
| Cross-filesystem              | ❌ No              | ✅ Yes              |
| Identified by                 | Same inode number  | `l` in `ls -l`      |

---

## 🔀 I/O Redirection

Linux has three standard streams:

| Stream | Number | Meaning         |
|--------|--------|-----------------|
| stdin  | 0      | Standard Input  |
| stdout | 1      | Standard Output |
| stderr | 2      | Standard Error  |

---

### Output Redirection

```bash
date 1> file1       # Redirect stdout to file1 (overwrites)
date 1>> file1      # Append stdout to file1
date >> file1       # Same as above (default is stdout)
```

**Example from lab:**
```bash
[ec2-user@server ~]$ date 1> file1
[ec2-user@server ~]$ cat file1
Fri May 15 06:09:30 UTC 2026

[ec2-user@server ~]$ date 1>> file1
[ec2-user@server ~]$ cat file1
Fri May 15 06:09:30 UTC 2026
Fri May 15 06:09:48 UTC 2026
```

---

### Error Redirection

```bash
dae 2> file1        # Redirect stderr into file1
```

```bash
[ec2-user@server ~]$ dae 2> file1
[ec2-user@server ~]$ cat file1
-bash: dae: command not found
```

---

### Redirect Both Output & Error — `&>`

```bash
date &> file1       # Redirect both stdout and stderr (overwrites)
daaee &>> file1     # Append both stdout and stderr
```

```bash
[ec2-user@server ~]$ date &> file1
[ec2-user@server ~]$ daaee &>> file1
[ec2-user@server ~]$ cat file1
Fri May 15 06:18:01 UTC 2026
-bash: daaee: command not found
```

---

## 🔍 grep — Search Inside Files

```bash
grep -r "word"      # Find "word" in current directory and subdirectories (shows lines)
grep -rl "word"     # Find only the filenames where "word" appears
```

**Example from lab:**
```bash
[ec2-user@server ~]$ grep -r "one"
.bashrc:    done
file1:one
file2:one

[ec2-user@server ~]$ grep -rl "one"
.bashrc
file1
file2
```

---

## 🔧 Package Management & Editor

```bash
sudo yum update             # Check and apply system updates (run this first!)
sudo yum install -y vim     # Install vim editor (-y auto-confirms yes/no prompts)
vi filename                 # Open/create a file in vi editor
```

**Inside `vi` editor:**

| Action            | Key   |
|-------------------|-------|
| Enter insert mode | `i`   |
| Save and exit     | `:wq` |
| Quit without save | `:q!` |

---

## 🔗 Pipeline Operator `|`

The `|` pipe passes the output of one command as input to another.

```bash
cat file1 | wc -l       # Count number of lines in file1
cat file1 | sort        # Sort file1 output alphabetically
```

**Example from lab:**
```bash
[ec2-user@server ~]$ cat file1 | wc -l
10

[ec2-user@server ~]$ cat file1 | sort
eight
five
four
nine
one
seven
six
ten
three
two
```

> 💡 You can chain multiple pipes: `cat file1 | grep "one" | wc -l`

---

## 🗂️ Quick Revision Table

| Command               | Description                                    |
|-----------------------|------------------------------------------------|
| `cp`                  | Copy file (overwrites destination)             |
| `cp -r`               | Copy entire directory                          |
| `mv`                  | Move or rename file/directory                  |
| `rm`                  | Remove a file                                  |
| `rmdir`               | Remove empty directory                         |
| `rm -rf`              | Force remove directory with contents           |
| `rm -rf *`            | Remove all files/folders in current directory  |
| `ls -i`               | Show inode number of file                      |
| `ln`                  | Create a hard link                             |
| `ln -s`               | Create a soft link (shortcut)                  |
| `1>`                  | Redirect stdout to file (overwrite)            |
| `1>>`                 | Redirect stdout to file (append)               |
| `2>`                  | Redirect stderr to file                        |
| `&>`                  | Redirect both stdout and stderr (overwrite)    |
| `&>>`                 | Redirect both stdout and stderr (append)       |
| `grep -r`             | Search word recursively (show lines)           |
| `grep -rl`            | Search word recursively (show filenames only)  |
| `\|`                  | Pipeline — pass output to next command         |
| `sort`                | Sort output alphabetically                     |
| `wc -l`               | Count lines                                    |
| `vi filename`         | Open/create file in vi editor                  |
| `sudo yum update`     | Check and apply system updates                 |
| `sudo yum install -y` | Install a package                              |

---

## 💭 Key Takeaway

> Hard links and soft links look similar but behave very differently. Hard links share the same inode — the data lives as long as at least one link exists. Soft links are just pointers — delete the source, the shortcut is useless. Also, `&>` is your best friend when debugging scripts — it catches everything.

---

## ➡️ What's Next

- File permissions — `chmod`, `chown`, `umask`
- User and group management
- Process management — `ps`, `top`, `kill`
