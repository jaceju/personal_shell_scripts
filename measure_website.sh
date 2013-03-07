#!/bin/bash
CURL=$(which curl)
GAWK=$(which gawk)
URL=${1-}

until [ "$URL" != "" ]
do
    read -p "Please pass the url you want to measure: " URL
done

result=`$CURL -o /dev/null -s -w %{time_connect}:%{time_starttransfer}:%{time_total} "$URL"`
echo -e "connect\tstart_transfer\ttotal "
echo -e $result | $GAWK -F: '{ print $1"s\t"$2"s\t\t"$3"s"}'
