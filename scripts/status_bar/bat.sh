#!/bin/bash

# Prints all bateries, their percentage remaining and an emoji corresponding 
# to charge status (🔌 for plugged up, 🔋 for discharging on battery, etc.).
case $BLOCK_BUTTON in
	3) notify-send "🔋 Battery module" "🔋: discharging
🛑: not charging
♻: stagnant charge
🔌: charging
⚡: charged
❗: battery very low!
- Scroll to change adjust xbacklight." ;;
	4) xbacklight -inc 10 ;;
	5) xbacklight -dec 10 ;;
	6) setsid -f "$TERMINAL" -e "$EDITOR" "$0" ;;
esac

# Loop through all attached batteries and format the info
 for battery in /sys/class/power_supply/BAT?;do
   
