#!/bin/bash

# Catching Input from main Cronjob
mail_weight=$1
mail_sleep=$(bc<<<"($mail_weight*50)") 

### sends a email with curl to the postfix dovecot server
while :
do
sleep $mail_sleep
curl -svk --url 'smtp://172.16.0.7:25' --ssl-reqd --mail-from 'Excited' --mail-rcpt 'john@Server6-mail-DMZ' -F data='hello world'
done