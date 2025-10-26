#!/bin/bash

echo "========== SYSTEM STATUS =========="

echo -e "$(uptime | awk -F'( |,|:)+' '{d=h=m=0; if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}')\n$(hostnamectl | grep -E 'hostname|Operating System |Architecture|Kernel')"

echo "========== NETWORK STATUS =========="



echo "========== SYSTEM RESOURCE STATUS =========="
