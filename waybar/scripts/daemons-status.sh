#!/bin/bash

# Important system daemons to monitor
DAEMONS=("NetworkManager" "bluetooth" "pipewire" "wireplumber" "swaync")

# Check status of each daemon
running=0
total=0

for daemon in "${DAEMONS[@]}"; do
    total=$((total + 1))
    if systemctl --user is-active --quiet "$daemon" 2>/dev/null || systemctl is-active --quiet "$daemon" 2>/dev/null; then
        running=$((running + 1))
    fi
done

# Calculate percentage
if [ $total -gt 0 ]; then
    percentage=$((running * 100 / total))
else
    percentage=0
fi

# Determine icon and tooltip based on status
if [ $running -eq $total ]; then
    icon="󰘨"  # All running
    class="all-running"
    tooltip="All daemons running ($running/$total)"
elif [ $running -gt 0 ]; then
    icon="󰘨"  # Some running
    class="some-running"
    tooltip="Some daemons running ($running/$total)"
else
    icon="󰘨"  # None running
    class="none-running"
    tooltip="No daemons running ($running/$total)"
fi

# Output JSON for waybar
echo "{\"text\":\"$icon\", \"tooltip\":\"$tooltip\", \"class\":\"$class\", \"percentage\":$percentage}"
