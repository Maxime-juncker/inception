FROM alpine:3.20

RUN apk update && apk upgrade
RUN apk add nginx && apk add bash && apk add openssl

EXPOSE 80 443

COPY nginx.conf /etc/nginx/nginx.conf
COPY ./setup.sh /setup.sh
RUN chmod +x /setup.sh

ENTRYPOINT ["/setup.sh"]

CMD ["nginx", "-g", "daemon off;"]