#!/bin/bash
snort_dir="/etc/snort"
rule_file_url="https://www.snort.org/rules/community-rules.tar.gz"
rule_backup_dir="$snort_dir/rules_backup"

backup_rules() {
    echo "Backing up current rules..."
    mkdir -p $rule_backup_dir
    cp -r $snort_dir/rules/* $rule_backup_dir/
    echo "Backup completed at $rule_backup_dir."
}

download_rules() {
    echo "Downloading latest Snort rules..."
    wget $rule_file_url -O /tmp/snort_rules.tar.gz
    if [ $? -eq 0 ]; then
        echo "Rules downloaded successfully."
    else
        echo "Failed to download rules. Exiting."
        exit 1
    fi
}

update_rules() {
    echo "Updating Snort rules..."
    tar -xzvf /tmp/snort_rules.tar.gz -C /tmp/
    cp -r /tmp/community-rules/* $snort_dir/rules/
    echo "Rules updated successfully."
}

restart_snort() {
    echo "Restarting Snort service..."
    sudo systemctl restart snort
    if [ $? -eq 0 ]; then
        echo "Snort restarted successfully."
    else
        echo "Failed to restart Snort."
    fi
}

backup_rules
download_rules
update_rules
restart_snort
