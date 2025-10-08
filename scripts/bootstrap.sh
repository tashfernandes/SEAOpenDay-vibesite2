#!/usr/bin/env bash

NAME=$(basename $0)
SCRIPTS=/scripts
export SCRIPTS

maxcounter=45

counter=1
while ! mysql -u root -e "show databases;" > /dev/null 2>&1; do
    sleep 1
    counter=`expr $counter + 1`
    if [ $counter -gt $maxcounter ]; then
        >&2 echo "We have been waiting for MySQL too long already; failing."
        exit 1
    fi;
done

umask 022

mysql -u root < /scripts/mysql.sql

exit 0

