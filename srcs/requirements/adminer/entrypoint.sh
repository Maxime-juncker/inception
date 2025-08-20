#!/bin/bash

wget https://github.com/vrana/adminer/releases/download/v5.3.0/adminer-5.3.0.php -O /var/www/adminer/adminer.php
cp /www.conf /etc/php83/php-fpm.d/www.conf

exec php-fpm83 --nodaemonize

