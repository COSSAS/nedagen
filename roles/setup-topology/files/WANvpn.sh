#!/bin/bash

first='yes'

while true
do
    while true
    do
        set $(dd if=/dev/urandom bs=4 count=1 2>/dev/null | od -An -tu1)
        ip_address=193.166.$3.$4
        if [ $4 -ne 0 ] && [ $4 -ne 1 ] && [ $4 -ne 255 ]
        then
            break
        fi
    done
    echo $ip_address

    macchanger -r eth1
    sleep 1
    ip addr add $ip_address/16 dev eth1

    if [ $first == 'yes' ]
    then
        ip route delete default
        sleep 1
        ip route add 0.0.0.0/0 via 193.166.0.1 dev eth1
        echo "nameserver 5.5.5.5" > /etc/resolv.conf
        first='no'
    fi

    sleep 1

    # do shit

    ip addr del $ip_address/16 dev eth1

    sleep 1

done