#!/bin/bash
# Host and ports 
host="<add-IP>" # change
ports="<add-ports-here>"  # change

echo "Checking open ports on $host..."

for port in $ports; do
    nc -z -v -w 1 $host $port &> /dev/null
    if [ $? -eq 0 ]; then
        echo "Port $port is open on $host"
    else
        echo "Port $port is closed on $host"
    fi
done
