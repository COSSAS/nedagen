#!/bin/bash

### sends mail with curl to the postfix dovecot server including a link to a file of the locally hosted webserver 
once=1
while :
do
random_number=$(($RANDOM % 50))
sleep random_number
curl -svk --url 'smtp://172.16.0.7:25' --ssl-reqd --mail-from 'Excited' --mail-rcpt 'john@Server6-mail-DMZ' -F data='hello world'

if ([random_number -eq 10] && [$once -eq 1])
then
    curl -svk --url 'smtp://172.16.0.7:25' --ssl-reqd --mail-from 'Evil' --mail-rcpt 'john@Server6-mail-DMZ' -F data='http://10.0.0.3:8000/malware.sh'
    once=0
fi
done