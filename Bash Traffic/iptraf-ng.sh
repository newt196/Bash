#!/bin/bash
logfile="/var/log/iptraf.log"  # double check both files
analysis_file="traffic_analysis.txt" 
monitor_time=60  

echo "Monitoring network traffic for $monitor_time seconds..."
sudo iptraf-ng -i all -B -L $logfile &

sleep $monitor_time

sudo killall iptraf-ng

echo "Analyzing the traffic log..." | tee $analysis_file
grep "Bytes" $logfile | awk '{total += $8} END {print "Total Bytes Transferred: ", total}' | tee -a $analysis_file

echo "Traffic analysis completed. Results saved in $analysis_file"
