#!/bin/bash

mkdir -p /var/lib/mysql /run/mysqld
chown -R mysql:mysql /var/lib/mysql /run/mysqld

if [ ! -d "/var/lib/mysql/mysql" ]; then
	echo mariadb is not installed!
	mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
else
	echo mariadb is already installed!
fi

mysqld --user=mysql --datadir=/var/lib/mysql --socket=/run/mysqld/mysqld.sock &

# Wait for the server to start
sleep 4

mariadb -u root <<EOF
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER 'mysql'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON wordpress.* TO 'mysql'@'%' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;
EOF

echo "user has been created!"

# Keep container running
tail -f /dev/null #! to remove
