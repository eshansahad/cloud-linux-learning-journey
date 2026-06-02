#!/bin/bash

REPORT_FILE="audit-report.txt"
> "$REPORT_FILE"
DATE=$(date)

echo "==================================" | tee -a "$REPORT_FILE"
echo "SSH SECURITY AUDIT REPORT" | tee -a "$REPORT_FILE"
echo "Date: $DATE" | tee -a "$REPORT_FILE"
echo "==================================" | tee -a "$REPORT_FILE"
echo "" | tee -a "$REPORT_FILE"


SCORE=0

echo "=================================="
echo "SSH SECURITY AUDIT REPORT"
echo "=================================="
echo ""

# SSH Service

if systemctl is-active --quiet sshd
then
    echo "[PASS] SSH Service Running" | tee -a "$REPORT_FILE"
    SCORE=$((SCORE+20))
else
    echo "[FAIL] SSH Service Not Running"
fi

# Root Login

ROOT_LOGIN=$(sudo sshd -T | grep permitrootlogin | awk '{print $2}')

if [ "$ROOT_LOGIN" = "no" ]
then
    echo "[PASS] Root Login Disabled"
    SCORE=$((SCORE+20))

elif [ "$ROOT_LOGIN" = "without-password" ]
then
    echo "[PASS] Root Login Restricted (Key-Based Only)"
    SCORE=$((SCORE+20))

else
    echo "[FAIL] Root Login Enabled"
fi

# Password Authentication

PASSWORD_AUTH=$(sudo sshd -T | grep passwordauthentication | awk '{print $2}')

if [ "$PASSWORD_AUTH" = "no" ]
then
    echo "[PASS] Password Authentication Disabled"
    SCORE=$((SCORE+20))
else
    echo "[WARNING] Password Authentication Enabled"
fi

# SSH Port

SSH_PORT=$(sudo sshd -T | grep "^port" | awk '{print $2}')

if [ "$SSH_PORT" = "22" ]
then
    echo "[WARNING] Default SSH Port (22)"
    SCORE=$((SCORE+10))
else
    echo "[PASS] Custom SSH Port: $SSH_PORT"
    SCORE=$((SCORE+20))
fi

# Firewall

if systemctl is-active --quiet firewalld
then
    echo "[PASS] Firewall Active" | tee -a "$REPORT_FILE"
    SCORE=$((SCORE+20))
else
    echo "[FAIL] Firewall Not Active"
fi

echo ""
echo "" | tee -a "$REPORT_FILE"
echo "==================================" | tee -a "$REPORT_FILE"
echo "Security Score: $SCORE / 100" | tee -a "$REPORT_FILE"
echo "==================================" | tee -a "$REPORT_FILE"
