#!/bin/sh

cd /var/www/


# cp config.sample.php config.php

if [ "$(ls -A /var/www/nextcloud)" ]; then
	echo nextcloud is already installed!
exec tail -f

php -S 0.0.0.0:4242

fi

# Download the latest Nextcloud
wget https://download.nextcloud.com/server/releases/latest.tar.bz2

# Extract to your web directory (adjust path as needed)
tar -xjf latest.tar.bz2 -C /var/www/
chown -R www-data:www-data /var/www/nextcloud
chmod -R 755 /var/www/nextcloud

cd /var/www/nextcloud

php occ maintenance:install \
  --database="mysql" \
  --database-name="nextcloud" \
  --database-user="mysql" \
  --database-pass="xx_mysql_Passw09_xx" \
  --database-host="mariadb" \
  --database-port="3306" \
  --admin-user="admin" \
  --admin-pass="your_admin_password" \
  --data-dir="/var/www/nextcloud/data"

# curl -o nextcloud.zip https://download.nextcloud.com/server/releases/latest.zip
# unzip nextcloud.zip # will create nextcloud folder
# chmod 777 -R /var/www/nextcloud

# cd /var/www/nextcloud

# # php -d memory_limit=1024M occ maintenance:install --database="mysql" --database-name="nextcloud" --database-host="mariadb" --database-port="3306" --database-user="mysql" --database-pass="xx_mysql_Passw09_xx" --admin-user="admin" --admin-pass="password"
# # chmod 777 /var/www/nextcloud/config/config.php

# cp config.sample.php config.php

chown -R www-data:www-data /var/www/nextcloud


exec tail -f
php -S 0.0.0.0:4242