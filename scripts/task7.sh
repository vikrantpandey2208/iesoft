#!/bin/bash

diskTh=75

monitor_disk_space() {
    disk_usage=$(df -P / | awk 'NR==2 {print $5}' | tr -d '%')

    if (( disk_usage >= diskTh )); then
        # notify-send "Disk Usage Alert" "Disk space usage exceeded the threshold. Current usage: $disk_usage%"
        curl -d "Disk Usage Alert Disk space usage exceeded the threshold. Current usage: $disk_usage%" ntfy.sh/XqgAuKFUiyL1I0Te
    fi
}

interval=10

while true; do
    monitor_disk_space
    sleep "$interval"
done
