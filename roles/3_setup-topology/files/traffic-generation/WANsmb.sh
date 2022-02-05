#!/bin/bash

# Catch weight
smb_weight=$1
smb_sleep=$(bc<<<"($smb_weight*50)") 


echo "sleep: $smb_sleep"
smb_traffic () {
cd /tmp

while true
do
for clients in {1..5}
do
echo "smbclient //192.168.40.5/Sambaclient$clients -U 'client$clients%password$clients' -c 'ls'"
# Series of smbclient commands to list and retrieve all files from directory
bash -c "smbclient //192.168.40.5/Sambaclient$clients -U 'client$clients%password$clients' -c 'ls'"
done

sleep $smb_sleep
wait
done
}

smb_traffic


