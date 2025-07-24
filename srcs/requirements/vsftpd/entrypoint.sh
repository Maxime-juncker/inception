#!/bin/sh

adduser -D -h /home/ftpuser ftpuser #! <!> to change with env vars
echo "ftpuser:ftppassword" | chpasswd #! <!> to change with env vars

exec /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
