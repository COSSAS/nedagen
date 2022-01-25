#!/bin/bash

# Catching Input from main config
web_weight=$1
smb_weight=$2
vpn_weight=$3

# Bash only accept integers, using BC to multiply decimals to 0-100% representation
web=$(bc<<<"$web_weight*10")
smb=$(bc<<<"$smb_weight*10")
vpn=$(bc<<<"$vpn_weight*10")



ip route delete default
echo "nameserver 5.5.5.5" > /etc/resolv.conf


# Sleep statements to account for traffic distribution (based upon input weights)

# Randomly query HTTP or HTTPS sites
web_traffic () {
    if [ $(($2 % 2)) -eq 0 ]
    then
        curl DMZsite.dev &
        sleep $web
    else
        curl -k https://httpsDMZsite.dev &
        sleep $web
    fi
}

# Query static Samba Sever with Dynamic shares
smb_traffic () {
for clients in {1..{{ NumberofLANclients }}}
do
smbclient //192.168.40.5/$clients -U $clients &
sleep $smb
done
}

# Query services while connected over WireGuard VPN
vpn_traffic () {
# TODO

# make_traffic &
# sleep $vpn
}


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



    web_traffic
    smb_traffic
    vpn_traffic


    sleep 1

    ip addr del $ip_address/8 dev eth1

    sleep 1

    macchanger -r eth1

    sleep 1
done