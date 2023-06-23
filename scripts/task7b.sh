#!/bin/bash

th=50

delay=5

monitor_bandwidth() {
    local threshold=$1
    local interval=$2

    while true; do
        bandwidth=$(ifstat -i wlp2s0 "$interval" 1 | tail -1 | awk '{print $1+$2}')

        if (( $(echo "$bandwidth > $threshold" | bc -l) )); then
            # notify-send "Bandwidth Alert" "Network bandwidth exceeded threshold: ${bandwidth} Kbps"
            curl -d "Bandwidth Alert Network bandwidth exceeded threshold: ${bandwidth} Kbps" ntfy.sh/XqgAuKFUiyL1I0Te
        fi
    done
}

monitor_bandwidth $th $delay
