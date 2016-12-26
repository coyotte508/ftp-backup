#!/bin/sh

#upload file when added or modified in watched
#directory

#if the watched directory contains subdirectories, the
#same directory structure should already be on the remote
#server

# Watched directory
WATCHED="/var/www/backups"
ftpuser="user"
ftppass="pass"
ftphost="ftpback-xxx.ovh.net"

inotifywait -q -r -m -e close_write,moved_to $WATCHED --format "%w %f" |
  while read DIR FILE; do
    NDIR=`echo "$DIR" | sed 's_'$WATCHED'/__'`
    echo "File changed: $NDIR$FILE" 
    lftp -e "set ftp:ssl-allow no; cd $NDIR; put $DIR$FILE; exit" -u $ftpuser,$ftppass $ftphost

#Optional, remove old files on remote
    /usr/local/bin/remove-ftp-old.sh
  done
