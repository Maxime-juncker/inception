#!/bin/sh

cp /proftpd.conf /etc/proftpd.conf

mkdir -p /var/run/proftpd
chown proftpd:proftpd /var/run/proftpd
chmod 755 /var/run/proftpd
chmod -R 777 /var/www/html

adduser $FTP_USER -D 
echo $FTP_USER:$FTP_PASS | chpasswd

echo starting ftpd
exec proftpd -n

