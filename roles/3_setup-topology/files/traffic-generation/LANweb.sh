#!/bin/bash

# Catching Input from main Cronjob
web_weight=$1


while true
do

    if [ $(($RANDOM % 2)) -eq 0 ]
    then
        curl DMZsite.dev
        sleep $web_weight
        wait
    else
        curl -k https://httpsDMZsite.dev
        sleep $web_weight
        wait
    fi

    sleep 5
    wait

    # sleep $[ ( $RANDOM % 10 )  + 1 ]s

done