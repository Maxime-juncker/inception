#!/bin/sh

cd /var/www/
chown -R www-data:root /var/www;

# cp config.sample.php config.php

if [ "$(ls -A /var/www/nextcloud)" ]; then
	echo nextcloud is already installed!
exec php-fpm83 --nodaemonize

# php -S 0.0.0.0:4242
# exec tail -f

fi

mv /www.conf /etc/php83/php-fpm.d/www.conf


# Download the latest Nextcloud
wget https://download.nextcloud.com/server/releases/latest.tar.bz2

# Extract to your web directory (adjust path as needed)
echo extracting nextcloud
tar -xjf latest.tar.bz2 -C /var/www/

cd /var/www/nextcloud

echo seting permission
# chmod -R 777 /var/www/nextcloud
find /var/www/nextcloud -type f -exec chmod 644 {} \;
find /var/www/nextcloud -type d -exec chmod 755 {} \;
chmod +x /var/www/nextcloud/occ

echo installing nextcloud
php -d memory_limit=512M occ maintenance:install \
  --database="mysql" \
  --database-name="nextcloud" \
  --database-user="mysql" \
  --database-pass="xx_mysql_Passw09_xx" \
  --database-host="mariadb" \
  --database-port="3306" \
  --admin-user="mjuncker" \
  --admin-pass="mjuncker" \
  --data-dir="/var/www/nextcloud/data"

chmod 644 /var/www/nextcloud/config/config.php 

# curl -o nextcloud.zip https://download.nextcloud.com/server/releases/latest.zip
# unzip nextcloud.zip # will create nextcloud folder
# chmod 777 -R /var/www/nextcloud

# cd /var/www/nextcloud

# # php -d memory_limit=1024M occ maintenance:install --database="mysql" --database-name="nextcloud" --database-host="mariadb" --database-port="3306" --database-user="mysql" --database-pass="xx_mysql_Passw09_xx" --admin-user="admin" --admin-pass="password"
# # chmod 777 /var/www/nextcloud/config/config.php

# cp config.sample.php config.php



chown -R www-data:www-data /var/www/nextcloud

ls -l /var/www/nextcloud/

exec php-fpm83 --nodaemonize


# php -S 0.0.0.0:4242
# exec tail -f
