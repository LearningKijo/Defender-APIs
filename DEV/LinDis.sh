#!/bin/bash

# Create output directory
OUTPUT_DIR="/tmp/system_info_dump"
mkdir -p $OUTPUT_DIR

# Append current date to filename
DATE=$(date +"%Y%m%d_%H%M%S")
OUTPUT_FILE="$OUTPUT_DIR/system_info_$DATE.txt"

# Start system information dump
echo "System Information Dump - $DATE" > $OUTPUT_FILE
echo "-----------------------------------" >> $OUTPUT_FILE

# OS information
echo "OS Information:" >> $OUTPUT_FILE
cat /etc/os-release >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# Kernel information
echo "Kernel Information:" >> $OUTPUT_FILE
uname -a >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# Distribution info
echo "Distribution Info:" >> $OUTPUT_FILE
cat /etc/os-release >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# CPU info
echo "CPU Info:" >> $OUTPUT_FILE
cat /proc/cpuinfo >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# Memory info
echo "Memory Info:" >> $OUTPUT_FILE
free -h >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# Disk information
echo "Disk Space Info:" >> $OUTPUT_FILE
df -h >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# User information
echo "Users Info:" >> $OUTPUT_FILE
cat /etc/passwd >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# Logged-in users
echo "Logged-in Users:" >> $OUTPUT_FILE
who >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# Network interfaces info
echo "Network Interfaces Info:" >> $OUTPUT_FILE
ifconfig >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# Network connections info
echo "Network Connections Info:" >> $OUTPUT_FILE
netstat -tulnp >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# Running processes
echo "Running Processes Info:" >> $OUTPUT_FILE
ps aux >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# Processes running as root
echo "Processes running as root:" >> $OUTPUT_FILE
ps aux | grep root >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# Cron jobs information
echo "Cron Jobs Info:" >> $OUTPUT_FILE
crontab -l >> $OUTPUT_FILE
cat /etc/crontab >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# At jobs information
echo "At Jobs Info:" >> $OUTPUT_FILE
atq >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# Sudoers file info
echo "Sudoers File Info:" >> $OUTPUT_FILE
cat /etc/sudoers >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# Network routing info
echo "Routing Table Info:" >> $OUTPUT_FILE
route -n >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# DNS configuration info
echo "DNS Config Info:" >> $OUTPUT_FILE
cat /etc/resolv.conf >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# SELinux status
echo "SELinux Status:" >> $OUTPUT_FILE
sestatus >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# Firewall rules (UFW and iptables)
echo "Firewall Rules (UFW and iptables):" >> $OUTPUT_FILE
sudo ufw status >> $OUTPUT_FILE
sudo iptables -L >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# Authentication log
echo "Authentication Log Info:" >> $OUTPUT_FILE
cat /var/log/auth.log >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# File search (be cautious with large systems)
echo "System Files List (find):" >> $OUTPUT_FILE
find / -type f 2>/dev/null >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# Syslog information
echo "Syslog Info:" >> $OUTPUT_FILE
cat /var/log/syslog >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# Completion message
echo "System Information Dump completed. Output saved to: $OUTPUT_FILE"
