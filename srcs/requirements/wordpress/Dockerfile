FROM alpine:3.20

RUN apk update && apk upgrade
RUN apk add bash php php83-fpm php83-mysqli curl

COPY ./www.conf /www.conf

EXPOSE 9000

COPY ./entrypoint.sh /entrypoint.sh
RUN sh /entrypoint.sh

CMD ["php-fpm83", "--nodaemonize"]