#!/bin/bash

# Create a secure temp file
tempfile=$(mktemp) || { echo "{\"text\":\"⚠ Error\",\"tooltip\":\"Failed to create temp file\"}"; exit 1; }

# Run vnstat and capture output
if ! vnstat --live -i wlo1 -tr 5 | tee -a "$tempfile" > /dev/null; then
  echo "{\"text\":\"⚠ vnstat\",\"tooltip\":\"vnstat failed. Check if installed or if wlo1 exists.\"}"
  rm -f "$tempfile"
  exit 1
fi

# Extract rx and tx using awk for robust parsing
rx=$(grep -A2 "Traffic average" "$tempfile" | grep -E '^\s*rx' | awk '{print $(NF-1), $NF}' | tr -s ' ')
tx=$(grep -A2 "Traffic average" "$tempfile" | grep -E '^\s*tx' | awk '{print $(NF-1), $NF}' | tr -s ' ')

# Clean up
rm -f "$tempfile"

# Format output for Waybar
if [[ -n "$rx" && -n "$tx" ]]; then
  text="↓ $rx ↑ $tx"
  tooltip="Download: $rx\nUpload: $tx"
  echo "{\"text\":\"$text\",\"tooltip\":\"$tooltip\"}"
else
  echo "{\"text\":\"↓ 0 kbit/s ↑ 0 kbit/s\",\"tooltip\":\"No network data available\"}"
fi
