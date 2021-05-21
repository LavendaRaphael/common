#!/bin/bash

while true
do
    result=$(git pull)
    echo $result
    if  [[ $result =~ 'Already' ]] 
    then
        exit
    fi
    sleep 1s
done

