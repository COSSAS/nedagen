#!/bin/bash

ip route delete default
echo "nameserver 5.5.5.5" > /etc/resolv.conf


while true
do
    while true
    do
        set $(dd if=/dev/urandom bs=4 count=1 2>/dev/null | od -An -tu1)
        ip_address=96.$2.$3.$4
        if [ $4 -ne 0 ] && [ $4 -ne 1 ] && [ $4 -ne 255 ]
        then
            break
        fi
    done

    ip addr add $ip_address/8 dev eth1

    sleep 1

    ip route add 0.0.0.0/0 via 96.0.0.1 dev eth1

    sleep 1

    curl DMZsite.dev

    sleep 1

    ip addr del $ip_address/8 dev eth1

    sleep 1

    macchanger -r eth1
done