#!/bin/bash

git clone https://github.com/abidolet/Webserv.git /var/www/showcase/webserv
git clone https://github.com/abidolet/Webserv.git /var/www/showcase/html

mkdir /var/www/showcase/html
cp -r /var/www/showcase/webserv/server /var/www/showcase/html/

cd /var/www/showcase/webserv
make


# get new cat
URL=$(curl -s "https://api.thecatapi.com/v1/images/search" | jq -r '.[0].url')
curl $URL --output img.png

./webserv /webserv.conf

