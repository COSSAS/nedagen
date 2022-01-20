#!/bin/sh
croncmd="bash /WANweb.sh"
cronjob="0 9 * * 1-5 $croncmd"

killcroncmd="crontab -r"
killcronjob="0 17 * * 1-5 $killcroncmd"



( crontab -l | grep -v -F "$croncmd" ; echo "$cronjob" ) | crontab -
( crontab -l | grep -v -F "$killcroncmd" ; echo "$killcronjob" ) | crontab -


kill $(ps -o pid,args -C bash | awk '/WANweb.sh/ { print $1 }')


docker exec clab-conftest-Client3-WANweb bash -c "( crontab -l | grep -v -F $(kill $(ps -o pid,args -C bash | awk '/WANweb.sh/ { print $1 }')) ; echo "$(0 17 * * 1-5 kill $(ps -o pid,args -C bash | awk '/WANweb.sh/ { print $1 }'))" ) | crontab -"



croncmd="bash /WANweb.sh"
cronjob="0 9 * * 1-5 $croncmd"

docker exec clab-conftest-Client3-WANweb bash -c "killcroncmd='kill $(ps -o pid,args -C bash | awk '/WANweb.sh/ { print $1 }')'"
docker exec clab-conftest-Client3-WANweb bash -c "killcronjob='0 17 * * 1-5 $killcroncmd'"
docker exec clab-conftest-Client3-WANweb bash -c "( crontab -l | grep -v -F $croncmd ) | crontab -"
docker exec clab-conftest-Client3-WANweb bash -c "( crontab -l | grep -v -F $killcroncmd ) | crontab -"

bash -c "killcronjob='0 17 * * 1-5 $killcroncmd'"


docker exec clab-conftest-Client3-WANweb bash -c "croncmd='ps -o pid,args -C bash | awk '/WANweb.sh/ { print $1 }''"
#docker exec clab-conftest-Client3-WANweb bash -c "killcroncmd='kill $(ps -o pid,args -C bash | awk '/WANweb.sh/ { print $1 }')'"
#docker exec clab-conftest-Client3-WANweb bash -c "killcronjob='0 17 * * 1-5 kill $croncmd'"

docker exec clab-conftest-Client3-WANweb bash -c "( crontab -l | grep -v -F kill $croncmd ) | crontab -"
#docker exec clab-conftest-Client3-WANweb bash -c "( crontab -l | grep -v -F $killcroncmd ) | crontab -"




docker exec -it clab-conftest-Client3-WANweb bash -c 



"( crontab -l | grep -v -F 'kill $(ps -o pid,args -C bash | awk '/WANweb.sh/ { print $1 }')" ; echo 'test' ) | crontab -"


"( crontab -l | grep -v -F 'bash /WANweb.sh' ; echo '0 9 * * 1-5 bash /WANweb.sh' ) | crontab -"


"( crontab -l | grep -v -F "kill $(ps -o pid,args -C bash | awk '/WANweb.sh/ { print $1 }')" ; echo "0 17 * * 1-5 kill $(ps -o pid,args -C bash | awk '/WANweb.sh/ { print $1 }')" ) | crontab -"

docker exec -it clab-conftest-Client3-WANweb bash -c "( crontab -l | grep -v -F 'bash /WANweb.sh' ; echo '0 9 * * 1-5 bash /WANweb.sh' ) | crontab -"


docker exec -it clab-conftest-Client3-WANweb bash -c "( crontab -l | grep -v -F 'kill $(ps -o pid,args -C bash | awk '/WANweb.sh/ { print $1 }') ; echo "0 17 * * 1-5 kill $(ps -o pid,args -C bash | awk '/WANweb.sh/ { print $1 }') ) | crontab -"