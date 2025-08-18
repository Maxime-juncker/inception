#!/bin/bash

CERT_DIR="/etc/nginx/ssl"
KEY_FILE="$CERT_DIR/nginx.key"
CERT_FILE="$CERT_DIR/nginx.crt"
SUBJ="/C=FR/ST=ge/L=CHARBONIERE/O=ME/CN=mjuncker.42.fr"

if [ "$(ls -A $CERT_DIR)" ]; then
	echo cert key are already generated!
	exit 0
fi

mkdir "$CERT_DIR"

openssl req -x509 -nodes -newkey rsa:2048 \
	-keyout "$KEY_FILE" \
	-out "$CERT_FILE" \
	-days 365 \
	-subj "$SUBJ"
