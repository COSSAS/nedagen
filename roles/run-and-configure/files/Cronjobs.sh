#!/bin/sh
croncmd="bash /WANweb.sh"
cronjob="0 9 * * 1-5 $croncmd"

killcroncmd="crontab -r"
killcronjob="0 17 * * 1-5 $killcroncmd"



( crontab -l | grep -v -F "$croncmd" ; echo "$cronjob" ) | crontab -
( crontab -l | grep -v -F "$killcroncmd" ; echo "$killcronjob" ) | crontab -


