FROM alpine:3.20

RUN apk update

RUN apk add nginx

EXPOSE 80 443

COPY nginx.conf /etc/nginx/nginx.conf
COPY ./server.crt /etc/nginx/ssl/nginx.crt
COPY ./server.key /etc/nginx/ssl/nginx.key


CMD nginx -g 'daemon off;'