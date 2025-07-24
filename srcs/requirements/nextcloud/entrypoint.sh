#!/bin/sh

cd /var/www/


if [ "$(ls -A /var/www/nextcloud)" ]; then
	echo nextcloud is already installed!
	exec tail -f
fi

curl -o nextcloud.zip https://download.nextcloud.com/server/releases/latest.zip
unzip nextcloud.zip # will create nextcloud folder
chmod 777 -R /var/www/nextcloud

exec tail -f