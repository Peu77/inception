FROM alpine:latest

# Install MariaDB
RUN apk update && \
    apk add --no-cache mariadb mariadb-client

# Configure MariaDB
RUN mkdir -p /run/mysqld /var/lib/mysql && \
    chown -R mysql:mysql /run/mysqld /var/lib/mysql && \
    echo "[mysqld]" > /etc/my.cnf.d/mariadb-server.cnf && \
    echo "bind-address=0.0.0.0" >> /etc/my.cnf.d/mariadb-server.cnf && \
    echo "skip-networking=0" >> /etc/my.cnf.d/mariadb-server.cnf

# Copy startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose MariaDB port
EXPOSE 3306

# Start MariaDB
CMD ["/start.sh"]