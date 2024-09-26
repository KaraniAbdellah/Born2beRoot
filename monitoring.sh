#!/bin/bash 


# OS architecture and kernel version
OS_ARCH=$(uname -a)
echo -e "--> OS architecture and kernel version: $OS_ARCH"

# Number of physical processors
NBR_PROC=`nproc --all`
echo -e "--> Number of physical processors: $NBR_PROC"

# Number of virtual processors
NBR_VR_PROC=$(nproc)
echo -e "--> Number of virtual processors: ${NBR_VR_PROC}"

# Current available RAM and its utilization rate
CURR_RAM=$(free -m | awk 'NR==2{printf "Available RAM: %sMB (%.2f%%)\n", $7, $7*100/$2}')
echo -e "--> Current available RAM and its utilization rate: $CURR_RAM"

# Current available memory and its utilization rate
CURR_MEM=$(df -h --total | awk '/^total/ {printf "Available Memory: %sB (%.2f%%)\n", $4, $5}')
echo -e "--> Current available memory and its utilization rate: $CURR_MEM"

# Current CPU utilization rate
CPU_UTIL=$(top -bn1 | grep "Cpu(s)" | awk '{printf "%.2f%%\n", $2 + $4}')
echo -e "--> Current CPU utilization rate: $CPU_UTIL"

# Date and time of the last reboot
LAST_REBOOT=$(who -b | awk '{print $3, $4}')
echo -e "--> Date and time of the last reboot: $LAST_REBOOT"

# Whether LVM is active
LVM_STATUS=$(lsblk | grep -q "lvm" && echo "active" || echo "inactive")
echo -e "--> LVM status: $LVM_STATUS"

# Number of active connections
ACTIVE_CONN=$(netstat -tun | grep ESTABLISHED | wc -l)
echo -e "--> Number of active connections: $ACTIVE_CONN"

# Number of users on the server
NBR_USERS=$(who | wc -l)
echo -e "--> Number of users on the server: $NBR_USERS"

# IPv4 address and MAC address
IPV4_ADDR=$(hostname -I | awk '{print $1}')
MAC_ADDR=$(ip link show | awk '/ether/ {print $2}')
echo -e "--> IPv4 address: $IPV4_ADDR"
echo -e "--> MAC address: $MAC_ADDR"

# Number of sudo commands executed
NBR_SUDO_CMDS=$(grep -c 'COMMAND' /var/log/sudo/sudo.log)
echo -e "--> Number of sudo commands executed: $NBR_SUDO_CMDS"
























