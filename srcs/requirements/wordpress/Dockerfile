FROM debian:latest

RUN apt update && apt upgrade -y && \
    apt install -y php php-fpm php-mysql curl

RUN rm /var/www/html/index.html

COPY wp-config-template.php /var/www/html/wp-config-template.php

COPY start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh

WORKDIR /var/www/html

COPY configure.sh /usr/local/bin/configure.sh
RUN chmod +x /usr/local/bin/configure.sh

EXPOSE 9000

CMD ["/usr/local/bin/start.sh"]
