#!/bin/bash

# curl https://wordpress.org/latest.tar.gz --output /wordpress.tar.gz
# tar -xzf /wordpress.tar.gz

mkdir -p /etc/php83/php-fpm.d/
mv /www.conf /etc/php83/php-fpm.d/www.conf


# download wordpress cli

##! for testing remove before push
##TODO: remove following line before final push
mkdir -p /var/www/html/

# if [ ! -d "/var/www/html/" ]; then
	echo "wordpress is not installed"
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod 777 wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp

# 	# download wordpress
# 	# <!> by default php doen'st have enought mem <!>
	php -d memory_limit=256M /usr/local/bin/wp core download --path=/var/www/html/
	sleep 5
	# 	setting database
	wp config create --dbname="wordpress" --dbuser="mysql" --dbpass="password" --dbhost="mariadb" --path="/var/www/html/" # TODO: change default values

# else
# 	echo "wordpress is already installed"
# fi

wp core install --url="https://localhost" --title="super titre" --admin_user="mjuncker" --admin_password="mjuncker" --admin_email="mjuncker@42lyon.fr" --skip-email --allow-root --path="/var/www/html/"


exec php-fpm83 --nodaemonize