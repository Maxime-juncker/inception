#!/bin/bash

DIR=/var/www/html/

mkdir -p /etc/php83/php-fpm.d/
mkdir -p $DIR

if [ "$(ls -A $DIR)" ]; then
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
php -d memory_limit=256M /usr/local/bin/wp core download --path=$DIR

sleep 4 # waiting for server to start

# TODO: use env variables
wp config create	--dbname=$WP_DBNAME \
					--dbuser=$MYSQL_USER \
					--dbpass=$MYSQL_PASSW \
					--dbhost=$WP_DBHOST \
					--path=$DIR

wp core install	--url="https://localhost" \
				--title="$WP_TITLE" \
				--admin_user=$WP_ADMIN_LOGIN \
				--admin_password=$WP_ADMIN_PASSW \
				--admin_email=$WP_ADMIN_EMAIL \
				--path=$DIR

wp user create wil wil@example.com --role=author --user_pass="wil_pass" --path=$DIR
echo user: wil has been added

wp plugin install redis-cache --activate --path=$DIR


#? allow to use ssh port forwaring
sed -i "40i\\define('WP_SITEURL', 'https://' . \$_SERVER['HTTP_HOST']);" $DIR/wp-config.php
sed -i "40i\\define('WP_HOME', 'https://' . \$_SERVER['HTTP_HOST']);" $DIR/wp-config.php

exec php-fpm83 --nodaemonize