FROM debian:latest

RUN apt update && \
    apt install -y apache2 php php-fpm php-mysql wget && \
    echo "ServerName localhost" >> /etc/apache2/apache2.conf

RUN mkdir -p /var/www/html && \
    rm /var/www/html/index.html

WORKDIR /var/www/html

RUN wget -O index.php https://github.com/vrana/adminer/releases/download/v5.2.1/adminer-5.2.1-en.php

EXPOSE 8080

CMD ["php", "-S", "0.0.0.0:8080", "-t", "./"]