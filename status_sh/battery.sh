#!/bin/bash

# Path to Battery

BATTERY_PATH="/org/freedesktop/UPower/devices/battery_BAT1"

# Get current percentage and status
PERCENTAGE=$(upower -i $BATTERY_PATH | grep percentage | awk '{print $2}' | sed 's/%//')
STATUS=$(upower -i $BATTERY_PATH | grep status | awk '{print $2}')

# Alert if discharging and below 10%
if [ "$STATUS" = "Discharging" ] && [ $PERCENTAGE -le 10 ]; then
  notify-send "Low Battery!" "Charge remaining: $PERCENTAGE%. Plug in now!" -u critical
fi
