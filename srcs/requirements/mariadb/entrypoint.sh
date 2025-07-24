#!/bin/bash

DIR=/var/lib/mysql

# touch /run/openrc/softlevel

mkdir -p $DIR /run/mysqld
chown -R mysql:mysql $DIR /run/mysqld

if [ "$(ls -A $DIR)" ]; then
	echo mariadb is already installed!
	exec mysqld --user=$MYSQL_USER --datadir=$DIR --socket=/run/mysqld/mysqld.sock
fi

mariadb-install-db --user=$MYSQL_USER --basedir=/usr --datadir=$DIR
mysqld --user=$MYSQL_USER --datadir=$DIR --socket=/run/mysqld/mysqld.sock &

# Wait for the server to start
sleep 2

mariadb -u root <<EOF
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSW';
GRANT ALL PRIVILEGES ON wordpress.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSW';
FLUSH PRIVILEGES;
EOF
echo "user: $MYSQL_USER has been created!"

mariadb -u root <<EOF
CREATE DATABASE nextcloud;
CREATE USER nextclouduser@localhost IDENTIFIED BY 'StrongPassword';
GRANT ALL PRIVILEGES ON nextcloud.* TO nextclouduser@localhost;
FLUSH PRIVILEGES;
EOF

# reboot mariadb
mysqladmin -u root shutdown
exec mysqld --user=$MYSQL_USER --console
