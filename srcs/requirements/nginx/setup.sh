#!/bin/bash

CERT_DIR="/etc/nginx/ssl"
KEY_FILE="$CERT_DIR/nginx.key"
CERT_FILE="$CERT_DIR/nginx.crt"
SUBJ="/C=FR/ST=ge/L=CHARBONIERE/O=ME/CN=test.com"

mkdir "$CERT_DIR"

openssl req -x509 -nodes -newkey rsa:2048 \
	-keyout "$KEY_FILE" \
	-out "$CERT_FILE" \
	-days 365 \
	-subj "$SUBJ"
