# ftp-backup

Collection of bash scripts to monitor a folder and upload newly modified files through ftp, while deleting old files on the ftp server.

Typical use case: OVH providing a backup server accessible through ftp from the machine only. Make your backups periodically to a subfolder, and watch it with these scripts

##Requirements

``bash
apt-get install lftp inotiy-tools
``

## Setup

Edit `www-backup.sh` and `remove-ftp-old.sh` with ftp host/user/password information.

``bash
#permissions
chmod +x *.sh
chmod +x www-backup

#put files at correct place
sudo mv www-backup /etc/init.d
sudo mv www-backup.sh /usr/local/bin
sudo mv remove-ftp-old.sh /usr/local/bin

#register service on startup
sudo update-rc.d service enable
``

## Command

``bash
sudo service www-backup start/stop/status
``

## Debug

``bash
sudoo journalctl -u www-backup
``
