#!/bin/sh

cp /proftpd.conf /etc/proftpd.conf

mkdir -p /var/run/proftpd
chown proftpd:proftpd /var/run/proftpd  # or whatever user ProFTPD runs as
chmod 755 /var/run/proftpd

 exec proftpd -n

echo failed to launch ftp

tail -f
