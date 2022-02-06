#!/bin/sh

# Check Server Status Health Continuously
while true
do
ping -c 1 172.16.0.2 &
ping -c 1 172.16.0.4 &
ping -c 1 172.16.0.5 &
ping -c 1 172.16.0.6 &
ping -c 1 172.16.0.7 &
ping -c 1 192.168.50.2 &
ping -c 1 192.168.40.5 &
ping -c 1 172.16.1.1 &
sleep 60
wait
done
