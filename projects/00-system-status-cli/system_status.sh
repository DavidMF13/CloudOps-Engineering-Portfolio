#!/bin/bash

exec >> Historic_logs.txt
echo -e "System Status Run: $(date)"

echo "========== SYSTEM STATUS =========="

echo -e "$(uptime | awk -F'( |,|:)+' '{d=h=m=0; if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}')\n$(hostnamectl | grep -E 'hostname|Operating System |Architecture|Kernel')"

echo "========== NETWORK STATUS =========="

echo -e "LOCAL IP ADDRESS: $(hostname -I | awk -F'( )' '{print $3}')"

IP_PUBLICA=$(curl -4s icanhazip.com)
echo -e "PUBLIC IP ADDRESS: $IP_PUBLICA"

RESULTS=$(ping 8.8.8.8 -c 1 | grep 'packet loss' | awk -F'(, )+' '{print $3}')
echo -e "CONNECTIVITY: $RESULTS"

CONNECTION=""
if [ "$RESULTS" == "0% packet loss"]; then
    CONNECTION="Online"
else
    CONNECTION="Offline"
fi

echo "CONNECTIVITY: $CONNECTION"

echo "========== SYSTEM RESOURCE STATUS =========="

CPU=$(top -n 1 | grep "%Cpu(s)" | awk -F'( )+' '{print $2}')
echo -e "CPU USAGE: $CPU%"

MEM_TOTAL=$(free | grep "Mem:" | awk -F'( )+' '{print $2}')
MEM_USED=$(free | grep "Mem:" | awk -F'( )+' '{print $3}')
MEM_PER=$(echo "scale=2; ($MEM_USED / $MEM_TOTAL) * 100" | bc)

echo -e "RAM USAGE: $MEM_PER%"

DISK_USE=$(df -h | grep " /$" | awk -F'( )+' '{print $5}')
echo -e "DISK USAGE: $DISK_USE%"

echo "========= SYSTEM LOG STATUS =========="

sudo grep "error: " /var/log/messages | tail | awk -F'error: ' '{split($1,a," "); print a[1], $2}'


