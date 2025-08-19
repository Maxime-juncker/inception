#!/bin/sh

cd /var/www/
chown -R www-data:root /var/www;

if [ "$(ls -A /var/www/nextcloud)" ]; then
	echo nextcloud is already installed!
	#
	# php -d memory_limit=512M /var/www/nextcloud/occ files_external:create "ftp_share" ftp password::password \
 #  -c host="vsftpd" \
 #  -c port="201" \
 #  -c user="mjuncker" \
 #  -c password="mjuncker" \
 #  -c root="/" \
	#
	exec php-fpm83 --nodaemonize
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
mkdir -p /var/www/nextcloud/nextcloud
php -d memory_limit=1024M occ maintenance:install \
  --database="mysql" \
  --database-name="nextcloud" \
  --database-user="mysql" \
  --database-pass="xx_mysql_Passw09_xx" \
  --database-host="mariadb" \
  --database-port="3306" \
  --admin-user="mjuncker" \
  --admin-pass="mjuncker" \
  --data-dir="/var/www/nextcloud/nextcloud/data"

php -d memory_limit=1024M occ config:system:set trusted_domains 2 --value=mjuncker.42.fr

chmod 644 /var/www/nextcloud/config/config.php 
chown -R www-data:www-data /var/www/nextcloud

echo creating external storage
mkdir /var/www/test

php -d memory_limit=1024M occ app:enable files_external

php -d memory_limit=512M /var/www/nextcloud/occ files_external:create "ftp_share" ftp password::password \
	-c host="vsftpd" \
	-c port="21" \
	-c user="mjuncker" \
	-c password="mjuncker" \
	-c root="/home" \

exec php-fpm83 --nodaemonize
