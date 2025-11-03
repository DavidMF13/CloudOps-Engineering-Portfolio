# System Status CLI Dashboard

Develop a tool for quick diagnosis when a production server is failing. This tool should be exdcuted directly in the terminal to get a quick view of the system state.

## Objective

Develop a **Bash script** named system_status.sh that shows in the terminal the server information related with:
1. [General system information](#general-system-information)
2. [Network and connectivity](#network-and-connectivity)
3. [Resource usage (CPU, RAM, Disk)](#resource-usage)
4. [Recent system logs](#system-logs)

## System Requirements and Information

- The script was developed and tested using default bash version included with openSUSE. Some information may vary depending on the linux distribution and region.
- The script will automatically create a file named 'Historical_logs.txt' or append in the same file if previously created.
- The script should be executed with root privilages.

## Content

### General system information

Show on screen the name of the operating system (OS), date, and uptime.

### Network and connectivity

Show the local and public IP address and validate its connection to internet.

### Resource usage

Show the following information:
- CPU usage (percentage)
- RAM usage (percentage)
- Disk usage (percentage and total capacity)

### System logs

Show the last 10 system errors events with only the date and error message. 

