#!/bin/bash

INTERFACE=$(ip route | awk '/default/ {print $5}' | head -n1)

RX_PREV="/tmp/.rx_prev"
TX_PREV="/tmp/.tx_prev"

RX_NOW=$(cat /sys/class/net/"$INTERFACE"/statistics/rx_bytes)
TX_NOW=$(cat /sys/class/net/"$INTERFACE"/statistics/tx_bytes)

[[ ! -f "$RX_PREV" ]] && echo "$RX_NOW" > "$RX_PREV"
[[ ! -f "$TX_PREV" ]] && echo "$TX_NOW" > "$TX_PREV"

RX_OLD=$(cat "$RX_PREV")
TX_OLD=$(cat "$TX_PREV")

echo "$RX_NOW" > "$RX_PREV"
echo "$TX_NOW" > "$TX_PREV"

RX_DIFF=$((RX_NOW - RX_OLD))
TX_DIFF=$((TX_NOW - TX_OLD))

human_readable() {
    local bytes=$1
    if [ "$bytes" -ge 1073741824 ]; then
        printf "%.2f GB" "$(echo "$bytes / 1073741824" | bc -l)"
    elif [ "$bytes" -ge 1048576 ]; then
        printf "%.2f MB" "$(echo "$bytes / 1048576" | bc -l)"
    elif [ "$bytes" -ge 1024 ]; then
        printf "%.2f KB" "$(echo "$bytes / 1024" | bc -l)"
    else
        echo "${bytes} B"
    fi
}

speed_readable() {
    local bytes=$1
    if [ "$bytes" -ge 1073741824 ]; then
        printf "%.2f GB/s" "$(echo "$bytes / 1073741824" | bc -l)"
    elif [ "$bytes" -ge 1048576 ]; then
        printf "%.2f MB/s" "$(echo "$bytes / 1048576" | bc -l)"
    elif [ "$bytes" -ge 1024 ]; then
        printf "%.2f KB/s" "$(echo "$bytes / 1024" | bc -l)"
    else
        echo "${bytes} B/s"
    fi
}

DL_SPEED=$(speed_readable "$RX_DIFF")
UP_SPEED=$(speed_readable "$TX_DIFF")
TOTAL_DL=$(human_readable "$RX_NOW")
TOTAL_UP=$(human_readable "$TX_NOW")

# ✅ CORRECT color format using foreground=
OUTPUT="<span foreground='#4FC3F7'> $DL_SPEED</span> <span foreground='#81C784'>($TOTAL_DL)</span>  <span foreground='#FFB74D'> $UP_SPEED</span> <span foreground='#E57373'>($TOTAL_UP)</span>"

echo "{\"text\": \"$OUTPUT\", \"tooltip\": false}"

