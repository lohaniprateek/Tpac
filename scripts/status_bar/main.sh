#!/bin/bash
FILE="$HOME/Tpac/scripts/status_bar"


while true; do
	STATUS="$(
		$FILE/mem.sh
		) | $(
		$FILE/cpu.sh
		)  | $(
		$FILE/bat.sh 
		)| $(
		date '+%H:%M'
		)"

  xsetroot -name "$STATUS"
  sleep 60
done
