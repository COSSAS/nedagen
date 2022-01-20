##################################################################
#!/bin/bash

# make a folder if it doesn't exist

for clients in {1..10}
do
[ ! -d /var/www/html/clients$clients ] && mkdir -p /var/www/html/clients$clients

# append these lines at the end of the /etc/samba/smb.conf file
tee -a /etc/samba/smb.conf << EOF
[$clients]

comment = clients$clients folder
path = /var/www/html/clients$clients
browsable = yes
valid users = clients$clients
read only = no
EOF
username=clients$clients

useradd -m $username
(echo "password"; sleep 1; echo "password$clients";) | passwd $username
(echo "password"; sleep 1; echo "password$clients" ) | smbpasswd -s -a $username
done
