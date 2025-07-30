FROM alpine:3.20

RUN apk update && apk upgrade
RUN apk add bash php php83-fpm php-xml php-simplexml php83-iconv php83-phar php83-mysqli \
	php83-redis php-curl curl php-gd php-mbstring php-xml php-zip libxml2-dev php-xmlreader php-xmlwriter php-pdo php-posix \
	php-mysqli php-pdo_mysql php83-pcntl
RUN apk add curl unzip net-tools

RUN if ! getent group www-data >/dev/null 2>&1; then \
        addgroup -g 33 www-data; \
    fi && \
    if ! getent passwd www-data >/dev/null 2>&1; then \
        adduser -D -u 33 -G www-data www-data; \
    fi

COPY ./www.conf /www.conf
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]