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

done