#!/bin/bash
### MySQL Server Login Info ###
MUSER="backup"
MPASS="ZyFQV7XebVCPu6Ww"
MHOST="localhost"
MYSQL="$(which mysql)"
MYSQLDUMP="$(which mysqldump)"
BAK="/var/mysql-backups"
GZIP="$(which gzip)"
NOW=$(date +"%Y%m%d")

### See comments below ###
### [ ! -d $BAK ] && mkdir -p $BAK || /bin/rm -f $BAK/* ###
[ ! -d "$BAK" ] && mkdir -p "$BAK"

echo "Start at " $(date +"%T")
# DBS="$($MYSQL -u $MUSER -h $MHOST -p$MPASS -Bse 'show databases')"
for db in "7new" #$DBS
do
 FILE=$BAK/$db.$NOW.gz
 echo $FILE
 $MYSQLDUMP -u $MUSER -h $MHOST -p$MPASS $db | $GZIP -9 > $FILE
done

echo "End at " $(date +"%T")