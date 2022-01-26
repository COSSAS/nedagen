#!/bin/bash

# Catching Input from main Cronjob
web_weight=$1


while true
do

    if [ $(($RANDOM % 2)) -eq 0 ]
    then
        curl DMZsite.dev
        sleep $web_weight
    else
        curl -k https://httpsDMZsite.dev
        sleep $web_weight
    fi

    sleep 5

    # sleep $[ ( $RANDOM % 10 )  + 1 ]s

    if [ $(($RANDOM % 2)) -eq 0 ]
    then
        curl WANsite.dev
        sleep $web_weight
    else
        curl -k https://httpsWANsite.dev
        sleep $web_weight
    fi

    # sleep $[ ( $RANDOM % 10 )  + 1 ]s
    sleep 5

done