#!/bin/bash

### sends a email with curl to the postfix dovecot server
while :
do
random_number=$(($RANDOM % 50))
sleep $random_number
curl -svk --url 'smtp://172.16.0.7:25' --ssl-reqd --mail-from 'Excited' --mail-rcpt 'john@Server6-mail-DMZ' -F data='hello world'
done