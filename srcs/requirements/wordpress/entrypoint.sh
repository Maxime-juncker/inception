#!/bin/bash

# curl https://wordpress.org/latest.tar.gz --output /wordpress.tar.gz
# tar -xzf /wordpress.tar.gz

mkdir -p /etc/php83/php-fpm.d/
mv /www.conf /etc/php83/php-fpm.d/www.conf


# download wordpress cli

##! for testing remove before push
##TODO: remove following line before final push
# rm -fr /var/www/html/*

# if find /var/www/html -mindepth 1 -maxdepth 1 | read; then
# 	echo "wordpress installation found!"
# else
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod 777 wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp

	# download wordpress
	# <!> by default php doen'st have enought mem <!>
	php -d memory_limit=256M /usr/local/bin/wp core download --path=/var/www/html/

	# setting database
	# wp config create --dbname="wordpress" --dbuser="wordpress" --dbpass="password" --dbhost="mariadb:3306" --path="/var/www/html/" # TODO: change default values
# fi