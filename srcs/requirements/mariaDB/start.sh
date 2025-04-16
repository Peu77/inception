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
    mysql -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME:-wordpress};"

    # Create regular user
    mysql -e "CREATE USER '${DB_USER:-wordpress}'@'%' IDENTIFIED BY '${DB_PASSWORD:-wordpress}';"
    mysql -e "GRANT ALL PRIVILEGES ON ${DB_NAME:-wordpress}.* TO '${DB_USER:-wordpress}'@'%';"

    # Create admin user
    mysql -e "CREATE USER '${DB_ADMIN_USER:-superuser}'@'%' IDENTIFIED BY '${DB_ADMIN_PASSWORD:-superpass}';"
    mysql -e "GRANT ALL PRIVILEGES ON ${DB_NAME:-wordpress}.* TO '${DB_ADMIN_USER:-superuser}'@'%' WITH GRANT OPTION;"

    mysql -e "FLUSH PRIVILEGES;"

    # Stop temporary server
    mysqladmin shutdown
fi

# Start MariaDB server
exec mysqld --user=mysql