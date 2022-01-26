#!/bin/bash

# Catching Input from main Cronjob
web_weight=$1



ip route delete default
echo "nameserver 5.5.5.5" > /etc/resolv.conf


# Sleep statements to account for traffic distribution (based upon input weights)

# Randomly query HTTP or HTTPS sites
web_traffic () {
    if [ $(($2 % 2)) -eq 0 ]
    then
        curl DMZsite.dev &
        sleep $web_weight
    else
        curl -k https://httpsDMZsite.dev &
        sleep $web_weight
    fi
}




while true
do  

    # Generate random IP addresses
    while true
    do
        set $(dd if=/dev/urandom bs=4 count=1 2>/dev/null | od -An -tu1)
        ip_address=96.$2.$3.$4 # Outside client
        if [ $4 -ne 0 ] && [ $4 -ne 1 ] && [ $4 -ne 255 ]
        then
            break
        fi
    done

    # Configure new IP address
    ip addr add $ip_address/8 dev eth1
    sleep 1

    # Add IP route
    ip route add 0.0.0.0/0 via 96.0.0.1 dev eth1
    sleep 1

    # Calling Traffic Generation Functions
    bash web_traffic 

    sleep 1

    # Remove IP
    ip addr del $ip_address/8 dev eth1
    sleep 1

    # Change MAC address
    macchanger -r eth1
    sleep 1
done