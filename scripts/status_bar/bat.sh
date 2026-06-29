#!/bin/bash

BAT=$(upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep "percentage:" | awk '{print $2}' | tr -d "%")




STATE=$(upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep "state:" | awk '{print $2}')

if [ "$STATE" = "discharging" ]; then 

case "$BAT" in
	100| [8-9][0-9])
	echo "${BAT}%[■■■■■]"
	;;
	
	[6-7][0-9])
	echo "${BAT}%[■■■■ ]"
	;;
	[4-5][0-9])
	echo "${BAT}%[■■■  ]"
	;;
	[1-3][0-9])
	echo "${BAT}%[■■   ]"
	;;
	[5-9])
	echo "${BAT}%[■    ]"
	;;
	[0-5])
		notify-send -u critical "Charge: Battery is below 5%"
	;;	
esac

else

case "$BAT" in
	100| [8-9][0-9])
	echo "${BAT}%[■■■■■⚡]"
	;;
	
	[6-7][0-9])
	echo "${BAT}%[■■■■ ⚡]"
	;;
	[4-5][0-9])
	echo "${BAT}%[■■■  ⚡]"
	;;
	[1-3][0-9])
	echo "${BAT}%[■■   ⚡]"
	;;
	[0-9])
	echo "${BAT}%[■    ⚡]"
	;;
esac
fi
