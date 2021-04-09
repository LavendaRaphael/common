#!/bin/bash
set -euo pipefail

ontime=0
while true
do
    sleep 8m
    ontime=$((${ontime} + 4))
    echo ${ontime} min
done
