FROM alpine:3.20

RUN apk update && apk upgrade 
RUN apk add bash proftpd proftpd-utils 

COPY ./proftpd.conf /proftpd.conf
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["bash", "/entrypoint.sh"]
