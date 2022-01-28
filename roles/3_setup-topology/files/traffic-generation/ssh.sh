#!/bin/sh

ssh_weight=$1

sshpass -p sshuserpassword ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no  sshuser@172.16.0.3

while true
do
    dd if=/dev/random of=random.stuff bs=1M count=2
    rm random.stuff
    sleep $ssh_weight
    
done


