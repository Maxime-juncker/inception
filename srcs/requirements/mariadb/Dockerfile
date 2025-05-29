FROM alpine:3.20

RUN apk update && apk upgrade

RUN apk add mariadb mariadb-client && \
    apk add bash && \
    mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld && \
	mkdir -p /etc/mysql/mariadb.conf.d && \
    sed -i 's/^bind-address\s*=.*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

CMD ["mysqld"]
