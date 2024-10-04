#!/bin/bash
# Subnet to scan
subnet="///" #192.168.1.*** change

echo "Performing ping sweep on $subnet.0/24..."

# Loop through IP range 1-254
for ip in $(seq 1 254); do
    ping -c 1 -W 1 $subnet.$ip &> /dev/null
    if [ $? -eq 0 ]; then
        echo "Host $subnet.$ip is alive"
    else
        echo "Host $subnet.$ip is not reachable"
    fi
done
