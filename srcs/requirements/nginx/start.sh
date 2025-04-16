#!/bin/sh

mkdir -p /etc/nginx/ssl

echo "Creating SSL certificates..."

DOMAIN=${DOMAIN:-eebert.42.fr}

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.crt \
  -subj "/CN=${DOMAIN}"


sed -e "s/HOME_DOMAIN/${DOMAIN}/g" /etc/nginx/nginx-template.conf > /etc/nginx/nginx.conf

echo "SSL certificates created at /etc/nginx/ssl/"

echo "Starting Nginx..."

nginx -g "daemon off;"