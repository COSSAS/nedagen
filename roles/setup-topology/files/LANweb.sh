#!/bin/bash

while true
do

    curl DMZsite.dev

    sleep $[ ( $RANDOM % 10 )  + 1 ]s

    curl WANsite.dev

    sleep $[ ( $RANDOM % 10 )  + 1 ]s

done