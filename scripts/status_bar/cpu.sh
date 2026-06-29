#!/bin/bash

IDEAL_CPU=$(mpstat | awk 'NR==4{print $NF}')

CPU_USAGE=$(bc <<< "100 - $IDEAL_CPU")

echo "${CPU_USAGE}%" 
