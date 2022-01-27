#!/bin/bash

# Catching Input from main config
web_weight=$1
smb_weight=$2
vpn_weight=$3

# Bash only accept integers, using BC to multiply decimals to 0-100% representation
web=$(bc<<<"$web_weight*10")
smb=$(bc<<<"$smb_weight*10")
vpn=$(bc<<<"$vpn_weight*10")


# Applying Traffic Distribution for Developers:

# ( Should execute these on the container groups )
developers () {
     while true 
     do
     # docker exec -it {{ department }} bash /WANweb.sh $web
     
     # bash /WANweb.sh $web
     # bash /SMBtraffic.sh $web
     # bash /WANweb.sh $web
     done
}
# fi


developers

