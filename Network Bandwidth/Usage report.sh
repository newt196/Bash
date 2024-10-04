#!/bin/bash
interface="eth0"
monitor_time=200
logfile="bandwidth_report.log"

echo "Monitoring bandwidth usage on $interface for $monitor_time seconds..."
rx_before=$(cat /sys/class/net/$interface/statistics/rx_bytes)
tx_before=$(cat /sys/class/net/$interface/statistics/tx
