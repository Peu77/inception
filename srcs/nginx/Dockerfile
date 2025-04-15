FROM alpine:latest

RUN apk add --no-cache nginx openssl

COPY nginx.conf /etc/nginx/nginx.conf
COPY setupCert.sh /setupCert.sh

EXPOSE 443

RUN chmod +x /setupCert.sh && \
    /setupCert.sh
CMD ["nginx", "-g", "daemon off;"]