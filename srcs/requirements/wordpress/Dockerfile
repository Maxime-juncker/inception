FROM alpine:3.20

RUN apk update && apk upgrade
RUN apk add bash php php83-fpm php-xml php-simplexml php83-iconv php83-phar php83-mysqli php83-redis php-curl curl php-gd php-mbstring php-xml php-zip libxml2-dev php-xmlreader php-xmlwriter
RUN apk add php-pdo
COPY ./www.conf /www.conf

EXPOSE 9000

COPY ./entrypoint.sh /entrypoint.sh	
RUN chmod +x /entrypoint.sh

CMD ["bash", "/entrypoint.sh"]