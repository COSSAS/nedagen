#!/bin/bash
while :
do
random_number=$(($RANDOM % 100))
curl -svk --url 'smtp://172.16.0.7:25' --ssl-reqd --mail-from 'Excited' --mail-rcpt 'john@Server6-mail-DMZ' -F data='http://10.0.0.3:8000/malware.sh'
sleep random_number
done