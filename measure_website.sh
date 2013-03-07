#!/bin/bash
CURL=$(which curl)
GAWK=$(which gawk)
URL=${1-}

until [ "$URL" != "" ]
do
    read -p "Please pass the url you want to measure: " URL
done

result=`$CURL -o /dev/null -s -w %{time_connect}:%{time_starttransfer}:%{time_total} "$URL"`
echo " Time_Connect Time_startTransfer Time_total "
echo $result | $GAWK -F: '{ print $1" "$2" "$3}'
