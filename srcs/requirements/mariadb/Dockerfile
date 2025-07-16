FROM alpine:3.20

RUN apk add mariadb mariadb-client mariadb-server-utils bash openrc

RUN adduser -S test

RUN mkdir -p /etc/my.cnf.d/
COPY ./mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 3306

CMD ["bash", "/entrypoint.sh"]