#!/bin/bash

# Get battery path
BATTERY_PATH=$(upower -e | grep BAT)

# Get energy values
INFO=$(upower -i "$BATTERY_PATH")
FULL=$(echo "$INFO" | grep "energy-full:" | awk '{print $2}')
DESIGN=$(echo "$INFO" | grep "energy-full-design:" | awk '{print $2}')

# Calculate health
if [[ -n "$FULL" && -n "$DESIGN" ]]; then
    HEALTH=$(awk "BEGIN {printf \"%.0f\", ($FULL / $DESIGN) * 100}")
    echo "Battery Health: ${HEALTH}%"
else
    echo "Battery Health: N/A"
fi

