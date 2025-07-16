#!/bin/bash

mkdir -p /etc/php83/php-fpm.d/
mkdir -p /var/www/html/

if [ "$(ls -A /var/www/html/)" ]; then
	echo wordpress is already installed
	exec php-fpm83 --nodaemonize
fi

mv /www.conf /etc/php83/php-fpm.d/www.conf
echo installing wordpress

# dowloading wp-cli
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod 777 wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# download wordpress
# <!> by default php doen'st have enought mem <!>
php -d memory_limit=256M /usr/local/bin/wp core download --path=/var/www/html/

sleep 5 # waiting for server to start

# TODO: use env variables
wp config create --dbname="wordpress" --dbuser="mysql" --dbpass="password" --dbhost="mariadb" --path="/var/www/html/"
# wp core install --url="https://localhost" --title="super titre" --admin_user="mjuncker" --admin_password="mjuncker" --admin_email="mjuncker@42lyon.fr" --skip-email --allow-root --path="/var/www/html/"

#? allow to use ssh port forwaring
sed -i "40i\\define('WP_SITEURL', 'https://' . \$_SERVER['HTTP_HOST']);" /var/www/html/wp-config.php
sed -i "40i\\define('WP_HOME', 'https://' . \$_SERVER['HTTP_HOST']);" /var/www/html/wp-config.php

exec php-fpm83 --nodaemonize