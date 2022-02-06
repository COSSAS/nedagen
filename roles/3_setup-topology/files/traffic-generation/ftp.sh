#!/bin/bash

# Catching Input from main Cronjob
ftp_weight=$1
ftp_sleep=$(bc<<<"($ftp_weight*50)") 

while true
do  
# Create a random file on the host Container
dd if=/dev/random of=/tmp/random.stuff bs=1M count=2

# Authenticate with FTP, transfer the file and remove the file. 
lftp -u ftpuser,ftpuserpassword 172.16.0.3 << EOF
cd /home/ftpuser/
put /tmp/random.stuff
rm random.stuff
EOF

sleep $ftp_sleep
wait
done