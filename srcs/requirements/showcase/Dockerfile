FROM alpine:3.20

RUN apk update && apk upgrade
RUN apk add bash curl git python3 py3-requests
	
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["bash", "/entrypoint.sh"]
