#!/bin/bash
# get a list of files and dates from ftp and remove files older than ndays
ftpsite="ftpback-xxx.ovh.net"
ftpuser="user"
ftppass="pass"
#remote folder in which you want to delete files
putdir="/wordpress"

ndays=19

mkdir -p /tmp/www-backup
MM=`date --date="$ndays days ago" +%b`
DD=`date --date="$ndays days ago" +%d`

echo removing files older than $MM $DD
lftp -e "set ftp:ssl-allow no; mirror $putdir /tmp/www-backup --older-than=now-${ndays}days --Remove-source-files; exit" -u $ftpuser,$ftppass $ftpsite

rm /tmp/www-backup/*
