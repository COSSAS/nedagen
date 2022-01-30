#!/bin/bash

# Catching Input from main Cronjob
web_weight=$1

web_sleep=$(bc<<<"($web_weight*10)") 



while true
do

    if [ $(($RANDOM % 2)) -eq 0 ]
    then
        curl DMZsite.dev
        sleep $web_sleep
        wait
    else
        curl -k https://httpsDMZsite.dev
        sleep $web_sleep
        wait
    fi

    sleep 5
done