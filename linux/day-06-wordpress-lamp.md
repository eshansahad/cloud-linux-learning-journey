# Day 06 — WordPress on LAMP Stack (AWS EC2)

**Date:** May 21, 2026
**Topic:** LAMP Stack Setup, WordPress Installation, Security Hardening, Backup
**Lab Environment:** AWS EC2 — Red Hat Linux | Apache | PHP 8.3 | MariaDB 10.11

---

##  What I Learned Today

Full end-to-end deployment of a WordPress website on a Linux server from scratch — installing the entire LAMP stack (Linux + Apache + PHP + MariaDB), configuring the database, deploying WordPress files, setting permissions, configuring Apache virtual hosts, hardening security, and creating backups. All 18 lab tasks completed successfully.

---

##  What is the LAMP Stack?

| Layer   | Component       | Role                                      |
|---------|-----------------|-------------------------------------------|
| **L**   | Linux (RHEL)    | Operating system                          |
| **A**   | Apache (httpd)  | Web server — handles HTTP requests        |
| **M**   | MariaDB         | Database — stores all WordPress data      |
| **P**   | PHP 8.3         | Server-side scripting — processes .php files |

### Architecture Flow

```
Browser (Client)
    ↓ HTTP Request (Port 80)
AWS Security Group (Inbound: port 80 open)
    ↓
Apache HTTP Server (httpd) — listens on port 80
    ↓ passes .php files to PHP-FPM
PHP 8.3 (extensions: pdo, mysqlnd, xml, gd, mbstring, intl, zip, opcache)
    ↓ DB queries via mysqli/PDO
MariaDB 10.11 — Database: wordpressdb | User: wpuser@localhost
    ↓
WordPress Files at /var/www/html/wordpress
```

---

##  Step-by-Step Installation

### Step 1 — Set Hostname & Verify Network

```bash
sudo hostnamectl set-hostname wordpress-server   # Set persistent hostname
hostnamectl                                       # Verify
ping -c 4 google.com                             # Test internet connectivity
ip addr show                                     # Show network interfaces and IPs
```

---

### Step 2 — Update OS Packages

```bash
sudo dnf update -y        # Install all available updates
sudo dnf repolist         # Verify enabled repositories
```

>  `dnf` is the package manager on Amazon Linux 2023 / RHEL 9+ (replaces `yum`).

---

### Step 3 — Install Apache

```bash
sudo dnf install -y httpd     # Install Apache HTTP Server
httpd -v                      # Verify version
```

**What is Apache?**
- World's most widely used open-source web server
- Listens on port 80 (HTTP) and 443 (HTTPS)
- Config files: `/etc/httpd/conf/` and `/etc/httpd/conf.d/`

---

### Step 4 — Install PHP 8.3 and Extensions

WordPress requires PHP 7.4 or higher. PHP 8.3 was installed:

```bash
sudo dnf install -y php php-cli php-common php-fpm php-mysqlnd php-xml \
    php-mbstring php-gd php-pdo php-opcache php-intl php-pecl-zip
```

| PHP Package    | Purpose in WordPress                              |
|----------------|---------------------------------------------------|
| `php`          | Core PHP interpreter                              |
| `php-fpm`      | FastCGI Process Manager — handles PHP for Apache  |
| `php-mysqlnd`  | MySQL Native Driver — database connectivity       |
| `php-xml`      | XML parsing — feeds, sitemaps                     |
| `php-mbstring` | Multi-byte strings — internationalization         |
| `php-gd`       | Image manipulation — thumbnails, uploads          |
| `php-pdo`      | PHP Data Objects — database abstraction layer     |
| `php-opcache`  | Bytecode caching — speeds up PHP                  |
| `php-intl`     | Internationalization functions                    |
| `php-pecl-zip` | ZIP support — plugin/theme installation           |

>  **What is PHP-FPM?** FastCGI Process Manager — when Apache receives a `.php` request, it passes it to PHP-FPM via a socket. PHP-FPM maintains a pool of worker processes for efficient handling.

---

### Step 5 — Install MariaDB

```bash
sudo dnf install -y mariadb105-server     # Install MariaDB server
mysql --version                           # Verify version (10.11.15 installed)
```

>  **What is MariaDB?** Open-source database forked from MySQL by its original developers. WordPress uses it to store all posts, pages, users, settings, comments, and plugin data.

---

### Step 6 — Enable & Start All Services

```bash
# Apache
sudo systemctl enable httpd && sudo systemctl start httpd

# MariaDB
sudo systemctl enable mariadb && sudo systemctl start mariadb

# PHP-FPM
sudo systemctl enable php-fpm && sudo systemctl start php-fpm

# Verify all running
sudo systemctl status httpd
sudo systemctl status mariadb
sudo systemctl status php-fpm
```

**Service Status Confirmed:**
```
httpd.service   — Active: active (running) since Thu 2026-05-21 09:47:14 UTC
mariadb.service — Active: active (running) since Thu 2026-05-21 06:03:50 UTC
php-fpm.service — Active: active (running) since Thu 2026-05-21 09:34:56 UTC
```

| Command              | What it does                                    |
|----------------------|-------------------------------------------------|
| `systemctl start`    | Starts service immediately (current session)    |
| `systemctl enable`   | Auto-starts service on every reboot             |

---

### Step 7 — Configure Firewall

```bash
sudo systemctl status firewalld                          # Check firewall
sudo firewall-cmd --permanent --add-service=http         # Open port 80
sudo firewall-cmd --permanent --add-service=https        # Open port 443
sudo firewall-cmd --reload                               # Apply changes
sudo firewall-cmd --list-all                             # Verify open ports
```

>  On AWS EC2, traffic must also be allowed through the **Security Group inbound rules** — both are needed.

---

### Step 8 — Secure MariaDB

```bash
sudo mysql_secure_installation
```

This interactive script removes insecure defaults:
1. Set root password
2. Remove anonymous users
3. Disallow root login remotely
4. Remove test database
5. Reload privilege tables

---

### Step 9 — Create WordPress Database & User

```bash
sudo mysql -u root -p
```

Inside MariaDB:

```sql
CREATE DATABASE wordpressdb CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'StrongPassword123!';
GRANT ALL PRIVILEGES ON wordpressdb.* TO 'wpuser'@'localhost';
FLUSH PRIVILEGES;
SHOW DATABASES;
SELECT User, Host FROM mysql.user;
EXIT;
```

| DB Detail     | Value                |
|---------------|----------------------|
| Database Name | `wordpressdb`        |
| User          | `wpuser`             |
| Host          | `localhost`          |
| Charset       | `utf8mb4`            |
| Collation     | `utf8mb4_unicode_ci` |

>  **Why utf8mb4?** MySQL's `utf8` only supports 3-byte characters (misses emojis). `utf8mb4` supports full 4-byte Unicode — WordPress recommends it to avoid data corruption.

---

### Step 10 — Download WordPress

```bash
cd /tmp
curl -O https://wordpress.org/latest.tar.gz    # wget not available on Amazon Linux 2023
ls -lh latest.tar.gz                           # Verify download
```

> 💡 **curl vs wget:** Both download files over HTTP. `curl` is pre-installed on Amazon Linux 2023; `wget` is not. `curl` also supports more protocols (FTP, SMTP etc) making it better for scripting.

---

### Step 11 — Extract & Deploy WordPress

```bash
tar -xzf /tmp/latest.tar.gz -C /tmp/          # Extract archive
sudo cp -r /tmp/wordpress /var/www/html/       # Copy to web root
ls /var/www/html/wordpress                     # Verify
```

**tar flags explained:**

| Flag | Meaning                                    |
|------|--------------------------------------------|
| `-x` | Extract files from archive                 |
| `-z` | Decompress using gzip (.tar.gz)            |
| `-f` | Specifies the archive filename             |
| `-C` | Destination directory for extraction       |

---

### Step 12 — File Ownership, Permissions & SELinux

```bash
# Set Apache as owner
sudo chown -R apache:apache /var/www/html/wordpress

# Set correct permissions
sudo find /var/www/html/wordpress -type d -exec chmod 755 {} \;
sudo find /var/www/html/wordpress -type f -exec chmod 644 {} \;

# Fix SELinux context
sudo chcon -t httpd_sys_rw_content_t /var/www/html/wordpress -R
sudo restorecon -R /var/www/html/wordpress

# Allow Apache to write and make network connections
sudo setsebool -P httpd_unified 1
sudo setsebool -P httpd_can_network_connect 1
```

| Setting                        | Explanation                                       |
|--------------------------------|---------------------------------------------------|
| `755` (directories)            | Owner: rwx, Group+Others: r-x                     |
| `644` (files)                  | Owner: rw-, Group+Others: r--                     |
| `chown apache:apache`          | Apache runs as 'apache' user — must own the files |
| `chcon httpd_sys_rw_content_t` | SELinux context for Apache read/write access      |
| `setsebool httpd_unified`      | Allow Apache to r/w all httpd content             |
| `setsebool httpd_can_network_connect` | Allow WordPress to make outbound connections |

>  **SELinux** enforces access control beyond standard permissions. On RHEL, even if chmod allows access, SELinux can block it. Wrong SELinux context = **403 Forbidden** errors.

---

### Step 13 — Configure WordPress (wp-config.php)

```bash
sudo cp /var/www/html/wordpress/wp-config-sample.php \
        /var/www/html/wordpress/wp-config.php

sudo nano /var/www/html/wordpress/wp-config.php
```

Update these values inside the file:

```php
define( 'DB_NAME',     'wordpressdb' );
define( 'DB_USER',     'wpuser' );
define( 'DB_PASSWORD', 'StrongPassword123!' );
define( 'DB_HOST',     'localhost' );
define( 'DB_CHARSET',  'utf8mb4' );
```

>  `wp-config.php` contains DB credentials and security keys. It must **never** be publicly accessible via HTTP.

---

### Step 14 — Configure Apache Virtual Host

```bash
sudo nano /etc/httpd/conf.d/wordpress.conf
```

```apache
<VirtualHost *:80>
    ServerName 13.232.39.20
    DocumentRoot /var/www/html/wordpress

    <Directory /var/www/html/wordpress>
        Options -Indexes +FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog  /var/log/httpd/wordpress-error.log
    CustomLog /var/log/httpd/wordpress-access.log combined
</VirtualHost>
```

| Directive           | Explanation                                                  |
|---------------------|--------------------------------------------------------------|
| `VirtualHost *:80`  | Listen on all interfaces on port 80                          |
| `DocumentRoot`      | Directory where WordPress files live                         |
| `Options -Indexes`  | Disable directory listing (security)                         |
| `AllowOverride All` | Allow `.htaccess` to override config (needed for permalinks) |
| `ErrorLog`          | Log file for debugging errors                                |

---

### Step 15 — Test & Restart Apache

```bash
sudo apachectl configtest       # Validate config — should show: Syntax OK
sudo systemctl restart httpd    # Apply changes
```

>  Always run `apachectl configtest` before restarting — a bad config file with no test would take the web server down.

---

### Step 16 — Complete WordPress Setup in Browser

```
http://13.232.39.20/                    ← Opens WordPress setup wizard
http://13.232.39.20/wp-admin/           ← Admin dashboard
http://13.232.39.20/wp-login.php        ← Login page
```

Setup wizard fields:

| Field                    | Value Set       |
|--------------------------|-----------------|
| Site Title               | WordPress Lab   |
| Username                 | admin           |
| Search Engine Visibility | Allow indexing  |

**Result:** WordPress installed successfully. Default "Hello World!" post visible. Admin dashboard accessible.

---

##  Security Hardening

### Disable Directory Listing
```apache
Options -Indexes
```

### Protect wp-config.php via .htaccess
```apache
<Files wp-config.php>
    Order allow,deny
    Deny from all
</Files>
```

### Protect .htaccess itself
```apache
<Files .htaccess>
    Order allow,deny
    Deny from all
</Files>
```

### Secure File Permissions
```bash
sudo find /var/www/html/wordpress -type d -exec chmod 755 {} \;
sudo find /var/www/html/wordpress -type f -exec chmod 644 {} \;
sudo chmod 640 /var/www/html/wordpress/wp-config.php   # Extra restriction
```

### Security Hardening Summary

| Measure                               | Status  |
|---------------------------------------|---------|
| Directory listing disabled            | ✅ Done |
| wp-config.php protected via .htaccess | ✅ Done |
| .htaccess itself protected            | ✅ Done |
| File permissions 644/755              | ✅ Done |
| wp-config.php restricted to 640      | ✅ Done |
| SELinux enforcing maintained          | ✅ Done |
| MariaDB secured via secure script     | ✅ Done |
| DB user restricted to localhost only  | ✅ Done |

---

##  Backup Procedures

### Backup Files
```bash
sudo tar -czvf /backup/wordpress-files-$(date +%Y%m%d).tar.gz \
    /var/www/html/wordpress
ls -lh /backup/
```

### Backup Database
```bash
sudo mysqldump -u root -p wordpressdb > \
    /backup/wordpressdb-$(date +%Y%m%d).sql
ls -lh /backup/
```

### Restore (Reference)
```bash
# Restore files
sudo tar -xzvf /backup/wordpress-files-YYYYMMDD.tar.gz -C /

# Restore database
sudo mysql -u root -p wordpressdb < /backup/wordpressdb-YYYYMMDD.sql
```

>  **Backup best practice:** Always backup both files AND database. Store on a separate location (S3 bucket). Automate with cron: `0 2 * * * /path/to/backup.sh`

---

## 🔍 Troubleshooting — Issues Faced & Fixed

| Issue                          | Root Cause                             | Fix Applied                          |
|--------------------------------|----------------------------------------|--------------------------------------|
| `wget: command not found`      | wget not on Amazon Linux 2023          | Used `curl -O` instead               |
| HTTP 500 Internal Server Error | Wrong permissions or SELinux blocking  | Fixed `chown` + `chcon` + restart    |
| WordPress can't write wp-config| PHP-FPM lacked write permission        | Manually copied and edited wp-config |
| Apache FQDN warning            | No domain, only IP                     | Added `ServerName` to Apache config  |

### Debugging Commands

```bash
sudo tail -100 /var/log/httpd/error_log     # Apache error log (most useful)
sudo tail -50 /var/log/httpd/access_log     # Apache access log
sudo journalctl -u httpd -n 50              # systemd logs for httpd
sudo journalctl -u mariadb -n 50            # systemd logs for mariadb
sudo ausearch -m avc -ts recent             # SELinux denial logs
sudo ss -tlnp                               # Check listening ports
php -v                                      # PHP version
php -m | grep -i mysql                      # Check PHP MySQL modules
rpm -qa | grep httpd                        # Verify installed httpd packages
```

---

##  Important File Paths

| Path                                      | Purpose                          |
|-------------------------------------------|----------------------------------|
| `/var/www/html/wordpress`                 | WordPress root directory         |
| `/var/www/html/wordpress/wp-config.php`   | WordPress configuration file     |
| `/etc/httpd/conf.d/wordpress.conf`        | Apache virtual host config       |
| `/etc/httpd/conf/httpd.conf`              | Main Apache configuration        |
| `/var/log/httpd/error_log`                | Apache error log                 |
| `/var/log/httpd/access_log`               | Apache access log                |
| `/etc/php-fpm.d/www.conf`                 | PHP-FPM pool configuration       |
| `/var/lib/mysql/`                         | MariaDB data directory           |

---

##  Viva Q&A (Key Concepts)

**Q: What is the LAMP stack?**
Linux + Apache + MySQL/MariaDB + PHP. Linux is the OS, Apache serves HTTP requests, MariaDB stores data, PHP processes server-side logic.

**Q: systemctl start vs systemctl enable?**
`start` — runs the service now (stops after reboot). `enable` — auto-starts on every boot. Use both together.

**Q: What is SELinux and why does it matter for Apache?**
Mandatory access control system built into the Linux kernel. Files must have the correct SELinux context (`httpd_sys_content_t` or `httpd_sys_rw_content_t`) or Apache gets a 403 error even if Unix permissions are correct.

**Q: Why utf8mb4 instead of utf8?**
MySQL's `utf8` only supports 3-byte characters — emojis and some scripts cause data corruption. `utf8mb4` is full 4-byte Unicode. WordPress requires it.

**Q: What is PHP-FPM?**
FastCGI Process Manager. Apache passes `.php` requests to PHP-FPM via a Unix socket. PHP-FPM maintains a pool of worker processes for efficient handling.

**Q: Why must wp-config.php be protected?**
It contains database credentials and security keys. If accessible via HTTP, an attacker can steal everything. Protected using `.htaccess` and `chmod 640`.

**Q: What does AllowOverride All do?**
Allows `.htaccess` files to override Apache's main config. WordPress needs this for clean permalink URLs — without it, `/post-name/` style URLs won't work.

**Q: curl vs wget?**
Both download files over HTTP/HTTPS. `curl` supports more protocols and is pre-installed on Amazon Linux 2023. `wget` is better for recursive downloads but must be installed separately.

**Q: What is mysqldump?**
Exports a MariaDB/MySQL database to a SQL file with all CREATE TABLE and INSERT statements. Standard tool for database backups.

---

## Key Takeaway

> Deploying WordPress manually on a LAMP stack teaches you everything that managed hosting hides — how Apache routes requests, how PHP-FPM processes them, how MariaDB stores data, how SELinux adds a layer beyond standard permissions, and how file ownership ties it all together. This is exactly what cloud engineers and DevSecOps engineers work with every day.

---

