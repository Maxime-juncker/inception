FROM alpine:3.20

RUN apk update && apk upgrade
RUN apk add bash php php83-fpm php83-iconv php83-phar php83-mysqli curl

COPY ./www.conf /www.conf

EXPOSE 9000

COPY ./entrypoint.sh /entrypoint.sh	
RUN chmod +x /entrypoint.sh

CMD ["bash", "/entrypoint.sh"]