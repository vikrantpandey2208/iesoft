#!/bin/bash

cpuMax=10
memoryMax=20

check_usage() {
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")

    cpu_usage=$(top -b -n 1 | grep "%Cpu(s)" | awk '{print $2}')
    if (( $(echo "$cpu_usage > $cpuMax" | bc -l) )); then
        echo "High CPU usage detected at $timestamp"
        echo "CPU Usage: $cpu_usage%"
        echo
    fi

    memory_usage=$(free -m | awk '/Mem:/ { printf "%.2f", $3/$2*100 }')
    if (( $(echo "$memory_usage > $memoryMax" | bc -l) )); then
        echo "High memory usage detected at $timestamp"
        echo "Memory Usage: $memory_usage%"
        echo
    fi

    processes=$(ps -eo pid,comm,%cpu,%mem --sort=-%cpu,-%mem | awk -v cpu_threshold=$cpuMax -v memory_threshold=$memoryMax '{if ($3 > cpu_threshold || $4 > memory_threshold) print}')
    if [ -n "$processes" ]; then
        echo "Processes exceeding thresholds at $timestamp:"
        echo "$processes"
        echo
    fi
}

interval=5

while true; do
    check_usage
    sleep "$interval"
done
