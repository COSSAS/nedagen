#!/bin/sh


# Assign distribution 0-1
# developers=0.5
# operations=0.5


developers () {
   web=0.8
   smb=0.3
   vpn=0.2
   bash developers.sh $web $smb $vpn
}

clients () {
   web=0.2
   smb=0.6
   vpn=0.3
   bash clients.sh $web $smb $vpn
}

operations () {
   web=0.4
   smb=0.2
   vpn=0.1
   bash clients.sh $web $smb $vpn
}

developers

clients