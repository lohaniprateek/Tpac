#!/usr/bin/env bash


PASS=/usr/bin/pass

USER_INPUT=$( $PASS | dmenu -p "Enter something:" -i)

ACC=$(echo "$USER_INPUT" | awk -F " " '{print $NF}') 

if [[ -n "$ACC" ]]; then

 pass -c "$ACC"

fi

notify-send "Password for $ACC in clipboard for 45sec" 
sleep 45s 
notify-send "Password cleared from clipboard"

