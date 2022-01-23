#!/bin/bash

while true
do

    if [ $(($RANDOM % 2)) -eq 0 ]
    then
        curl DMZsite.dev
    else
        curl -k https://httpsDMZsite.dev
    fi

    sleep $[ ( $RANDOM % 10 )  + 1 ]s

    if [ $(($RANDOM % 2)) -eq 0 ]
    then
        curl WANsite.dev
    else
        curl -k https://httpsWANsite.dev
    fi

    sleep $[ ( $RANDOM % 10 )  + 1 ]s

done