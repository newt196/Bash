#!/bin/bash
snort_interface="eth0"
snort_conf="/etc/snort/snort.conf"

check_snort() {
    pgrep snort &> /dev/null
    if [ $? -eq 0 ]; then
        echo "Snort is running."
    else
        echo "Snort is not running!"
    fi
}

start_snort() {
    echo "Starting Snort on interface $snort_interface..."
    sudo snort -i $snort_interface -c $snort_conf -A console &> /dev/null &
    sleep 2
    check_snort
}

stop_snort() {
    echo "Stopping Snort..."
    sudo pkill snort
    sleep 2
    check_snort
}

echo "Choose an action:"
echo "1) Check Snort status"
echo "2) Start Snort"
echo "3) Stop Snort"
echo "4) Restart Snort"

read -p "Enter choice [1-4]: " choice

case $choice in
    1)
        check_snort
        ;;
    2)
        start_snort
        ;;
    3)
        stop_snort
        ;;
    4)
        stop_snort
        start_snort
        ;;
    *)
        echo "Invalid choice. Exiting."
        ;;
esac
#!/bin/bash
snort_interface="eth0"
snort_conf="/etc/snort/snort.conf"

check_snort() {
    pgrep snort &> /dev/null
    if [ $? -eq 0 ]; then
        echo "Snort is running."
    else
        echo "Snort is not running!"
    fi
}

start_snort() {
    echo "Starting Snort on interface $snort_interface..."
    sudo snort -i $snort_interface -c $snort_conf -A console &> /dev/null &
    sleep 2
    check_snort
}

stop_snort() {
    echo "Stopping Snort..."
    sudo pkill snort
    sleep 2
    check_snort
}

echo "Choose an action:"
echo "1) Check Snort status"
echo "2) Start Snort"
echo "3) Stop Snort"
echo "4) Restart Snort"

read -p "Enter choice [1-4]: " choice

case $choice in
    1)
        check_snort
        ;;
    2)
        start_snort
        ;;
    3)
        stop_snort
        ;;
    4)
        stop_snort
        start_snort
        ;;
    *)
        echo "Invalid choice. Exiting."
        ;;
esac
