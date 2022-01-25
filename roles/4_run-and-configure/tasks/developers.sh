#!/bin/bash

# Catching Input from main config
web_weight=$1
smb_weight=$2
vpn_weight=$3

# Bash only accept integers, using BC to multiply decimals to 0-100% representation
web=$(bc<<<"$web_weight*10")
smb=$(bc<<<"$smb_weight*10")
vpn=$(bc<<<"$vpn_weight*10")


# Configuring Traffic Distribution on Developers:
developers () {
     echo "this is web $web"
     echo "this is smb $smb"
     echo "this is vpn $vpn"
#    bash /WANweb.sh $web
}
# fi


developers

