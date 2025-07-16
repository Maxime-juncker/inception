FROM alpine:3.20

RUN apk update && apk upgrade
RUN apk add redis

ENTRYPOINT ["redis-server", "--protected-mode no"]