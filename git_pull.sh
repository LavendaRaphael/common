#!/bin/bash

while true
do
    result=$(git pull)
    echo $result
    if  [[ $result =~ 'up to date' ]] 
    then
        exit
    fi
    sleep 1s
done

