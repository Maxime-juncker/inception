FROM alpine:3.20

RUN apk update && apk upgrade
RUN apk add apache2
RUN apk add curl unzip net-tools

RUN mkdir -p /etc/apache2/sites-available/

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]