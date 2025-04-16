FROM debian:latest

RUN apt update && \
    apt install -y apache2 php php-fpm php-mysql curl unzip  && \
    echo "ServerName localhost" >> /etc/apache2/apache2.conf && \
    a2enmod proxy_fcgi && \
    a2enmod rewrite

RUN sed -i 's/Listen 80/Listen 9000/g' /etc/apache2/ports.conf && \
    sed -i 's/<VirtualHost \*:80>/<VirtualHost *:9000>/g' /etc/apache2/sites-available/000-default.conf


RUN curl https://de.wordpress.org/latest-de_DE.zip -o /var/www/html/wordpress.zip && \
    rm /var/www/html/index.html && \
    unzip /var/www/html/wordpress.zip -d /var/www/html/ && \
    rm /var/www/html/wordpress.zip && \
    mv /var/www/html/wordpress/* /var/www/html/ && \
    rm -rf /var/www/html/wordpress

COPY wp-config-template.php /var/www/html/wp-config-template.php

COPY start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh

EXPOSE 9000

CMD ["/usr/local/bin/start.sh"]
