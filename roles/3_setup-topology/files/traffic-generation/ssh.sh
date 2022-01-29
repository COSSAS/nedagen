#!/bin/sh

ssh_weight=$1



while true
do
    sshpass -p sshuserpassword ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no  sshuser@172.16.0.3 << EOF
    dd if=/dev/random of=random.stuff bs=1M count=2
    rm random.stuff
EOF
    sleep $((20*$ssh_weight))
    wait
    
done


