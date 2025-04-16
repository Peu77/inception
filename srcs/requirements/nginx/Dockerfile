FROM alpine:latest

RUN apk add --no-cache nginx openssl

RUN mkdir -p /run/nginx && \
    mkdir -p /etc/nginx/ssl && \
    chown -R nginx:nginx /run/nginx /etc/nginx/ssl
COPY nginx-template.conf /etc/nginx/nginx-template.conf
COPY start.sh /start.sh

RUN chmod +x /start.sh

EXPOSE 443


CMD ["/start.sh"]