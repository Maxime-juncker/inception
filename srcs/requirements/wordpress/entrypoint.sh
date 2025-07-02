curl https://wordpress.org/latest.tar.gz --output /wordpress.tar.gz
tar -xzf /wordpress.tar.gz

mkdir -p /etc/php83/php-fpm.d/
mv /www.conf /etc/php83/php-fpm.d/www.conf

mkdir -p /var/www/html/
mv /wordpress/* /var/www/html/