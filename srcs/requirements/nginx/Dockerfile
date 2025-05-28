FROM alpine:3.20

RUN apk update

RUN apk add nginx

EXPOSE 80
COPY nginx.conf /etc/nginx/nginx.conf

CMD nginx -g 'daemon off;'