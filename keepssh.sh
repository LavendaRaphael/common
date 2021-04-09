#!/bin/bash
set -euo pipefail

ontime=0
while true
do
    sleep 10m
    ontime=$((${ontime} + 10))
    echo ${ontime} min
done
