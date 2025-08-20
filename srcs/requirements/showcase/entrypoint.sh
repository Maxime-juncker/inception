#!/bin/bash

if [ "$(ls -A /var/www/showcase/)" ]; then
	cd /var/www/showcase && git pull
	echo repo are updated!
else
	git clone -b sample https://github.com/Maxime-juncker/inception.git /var/www/showcase/
	echo cloning repos
fi

echo launching script
chmod +x /var/www/showcase/new-cat.py
cd /var/www/showcase/
exec python3 ./new-cat.py

