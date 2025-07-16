#!/bin/bash

mkdir -p /var/lib/mysql /run/mysqld
chown -R mysql:mysql /var/lib/mysql /run/mysqld

if [ "$(ls -A /var/lib/mysql)" ]; then
	echo mariadb is already installed!
	mysqld --user=mysql --datadir=/var/lib/mysql --socket=/run/mysqld/mysqld.sock &
	tail -f /dev/null #! to remove
fi

mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

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
