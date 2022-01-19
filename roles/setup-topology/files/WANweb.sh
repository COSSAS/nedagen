#!/bin/bash

first='yes'

while true; do
    while true; do
        set $(dd if=/dev/urandom bs=4 count=1 2>/dev/null | od -An -tu1)
        ip_address=96.$2.$3.$4
        if [ $4 -ne 0 ] && [ $4 -ne 1 ] && [ $4 -ne 255 ]
        then
            break
        fi
    done
    echo $ip_address

    MAC=$(
        hexdump -n 6 -ve '1/1 "%.2x "' /dev/random |\
        awk -v a="0,4,8,c" -v r="$RANDOM" '
            BEGIN {
                srand(r);
            }
            NR==1 {
                split(a, b, ",");
                r=int(rand() * 4 + 1);
                printf("%s%s:%s:%s:%s:%s:%s\n", substr($1, 0, 1), b[r], $2, $3, $4, $5, $6);
            }
        '
    )

    ifconfig eth1 down
    ifconfig eth1 hw ether $MAC
    ip addr add $ip_address/8 dev eth1
    ifconfig eth1 up

    if [ $first == 'yes' ]; then
        ip route delete default
        ip route add 0.0.0.0/0 via 96.0.0.1 dev eth1
        echo "nameserver 5.5.5.5" > /etc/resolv.conf
        first='no'
    fi

    curl LANsite.dev
    sleep 2
    ip addr del $ip_address/8 dev eth1
    sleep 2
done