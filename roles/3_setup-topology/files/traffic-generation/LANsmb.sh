#!/bin/bash

# Catch weight
smb_weight=$1


smb_traffic () {
cd /tmp

while true
do
# Series of smbclient commands to list and retrieve all files from directory
smbclient //192.168.40.5/Sambaclient$clients -U 'client$clients%password$clients' << SMBCLIENTCOMMANDS
ls
mask ""
recurse
prompt
mget *
exit
SMBCLIENTCOMMANDS

smb_sleep=$(bc<<<"($smb_weight*10)") 
sleep $smb_sleep
wait
}

smb_traffic


# Traffic Distribution

