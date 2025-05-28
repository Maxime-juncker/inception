#!/bin/bash

CERT_DIR="./"
KEY_FILE="$CERT_DIR/server.key"
CERT_FILE="$CERT_DIR/server.crt"
SUBJ="/C=FR/ST=ge/L=CHARBONIERE/O=ME/CN=test.com"

# mkdir -p "$CERT_DIR"

openssl req -x509 -nodes -newkey rsa:2048 \
    -keyout "$KEY_FILE" \
    -out "$CERT_FILE" \
    -days 365 \
    -subj "$SUBJ"
