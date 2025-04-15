#!/bin/sh
set -e

# Check if database is initialized
if [ ! -d "/var/lib/mysql/mysql" ]; then
    # Initialize database
    mysql_install_db --user=mysql --datadir=/var/lib/mysql

    # Start temporary server
    mysqld --user=mysql --datadir=/var/lib/mysql --skip-networking &

    # Wait for server to start
    while ! mysqladmin ping -s 2>/dev/null; do
        sleep 1
    done

    # Configure database
    mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE:-wordpress};"
    mysql -e "CREATE USER '${MYSQL_USER:-wordpress}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD:-wordpress}';"
    mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE:-wordpress}.* TO '${MYSQL_USER:-wordpress}'@'%';"
    mysql -e "FLUSH PRIVILEGES;"

    # Stop temporary server
    mysqladmin shutdown
fi

# Start MariaDB server
exec mysqld --user=mysql