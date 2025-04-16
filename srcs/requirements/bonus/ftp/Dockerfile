FROM alpine:latest

RUN apk add --no-cache vsftpd

RUN mkdir -p /var/ftp/wordpress && \
    mkdir -p /var/log/vsftpd

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY start.sh /start.sh

RUN chmod +x /start.sh

EXPOSE 21 20 21100-21110

CMD ["/start.sh"]