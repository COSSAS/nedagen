#!/bin/bash

# Catching Input from main Cronjob
web_weight=$1

web_sleep=$(bc<<<"($web_weight*50)") 

### query the local hosted websites and most popular websites found in the Tranco-list of top million sites ID: L225 (date: 01:02:2022)

random_number=$(($RANDOM % 10))

while true
do

    arr_record2=( $(tail -n +2 1000000.csv | cut -d ',' -f2) )

    if [ $random_number -eq 0 ]
    then
        echo "nameserver 172.16.0.5" | tee /etc/resolv.conf
        curl -k -s DMZsite.dev > /dev/null
        sleep $web_sleep
        wait
    elif [ $random_number -eq 1 ]
    then
        echo "nameserver 172.16.0.5" | tee /etc/resolv.conf
        curl -k -s https://httpsDMZsite.dev > /dev/null
        sleep $web_sleep
        wait
    else
        echo "nameserver 1.1.1.1
        nameserver 8.8.8.8" | tee /etc/resolv.conf
        random_site=$(shuf -i 1-1000000 -n1)
        echo "https://${arr_record2[$random_site]} " | xargs curl -k -s > /dev/null
        wait
    fi

done