FROM alpine:3.20

RUN apk update && apk upgrade
RUN apk add bash curl git make build-base
	
COPY ./entrypoint.sh /entrypoint.sh
COPY ./webserv.conf /webserv.conf

RUN chmod +x /entrypoint.sh

CMD ["bash", "/entrypoint.sh"]
