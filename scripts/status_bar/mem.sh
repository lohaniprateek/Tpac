#!/bin/bash

read -r TOTAL_RAM AVAIL_RAM <<< $( free -h | grep "Mem:" | awk '{print $2, $7}'| tr -d "Gi")

CONSUMED_MEM=$( bc <<< "scale=2; 100 * ( 1 - $AVAIL_RAM / $TOTAL_RAM)")

echo "${CONSUMED_MEM}%"
