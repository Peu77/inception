#!/bin/bash

# Set default values if not provided
DB_NAME=${DB_NAME:-wordpress}
DB_USER=${DB_USER:-wordpress}
DB_PASSWORD=${DB_PASSWORD:-wordpress}
DB_HOST=${DB_HOST:-db}
DOMAIN=${DOMAIN:-eebert.42.fr}

# Generate random keys
generate_key() {
  openssl rand -base64 48 | tr -dc 'a-zA-Z0-9!#$%&()*+,-./:;<=>?@[\]^_`{|}~'
}

AUTH_KEY=$(generate_key)
SECURE_AUTH_KEY=$(generate_key)
LOGGED_IN_KEY=$(generate_key)
NONCE_KEY=$(generate_key)
AUTH_SALT=$(generate_key)
SECURE_AUTH_SALT=$(generate_key)
LOGGED_IN_SALT=$(generate_key)
NONCE_SALT=$(generate_key)

# Generate wp-config-template.php from template
sed -e "s/\database_name_here/$DB_NAME/g" \
    -e "s/\username_here/$DB_USER/g" \
    -e "s/\password_here/$DB_PASSWORD/g" \
    -e "s/\localhost/$DB_HOST/g" \
    -e "s/\HOME_DOMAIN/$DOMAIN/g" \
    -e "s/define( 'AUTH_KEY',         'put your unique phrase here' );/define( 'AUTH_KEY',         '$(echo $AUTH_KEY | sed 's/[\/&]/\\&/g')' );/g" \
    -e "s/define( 'SECURE_AUTH_KEY',  'put your unique phrase here' );/define( 'SECURE_AUTH_KEY',  '$(echo $SECURE_AUTH_KEY | sed 's/[\/&]/\\&/g')' );/g" \
    -e "s/define( 'LOGGED_IN_KEY',    'put your unique phrase here' );/define( 'LOGGED_IN_KEY',    '$(echo $LOGGED_IN_KEY | sed 's/[\/&]/\\&/g')' );/g" \
    -e "s/define( 'NONCE_KEY',        'put your unique phrase here' );/define( 'NONCE_KEY',        '$(echo $NONCE_KEY | sed 's/[\/&]/\\&/g')' );/g" \
    -e "s/define( 'AUTH_SALT',        'put your unique phrase here' );/define( 'AUTH_SALT',        '$(echo $AUTH_SALT | sed 's/[\/&]/\\&/g')' );/g" \
    -e "s/define( 'SECURE_AUTH_SALT', 'put your unique phrase here' );/define( 'SECURE_AUTH_SALT', '$(echo $SECURE_AUTH_SALT | sed 's/[\/&]/\\&/g')' );/g" \
    -e "s/define( 'LOGGED_IN_SALT',   'put your unique phrase here' );/define( 'LOGGED_IN_SALT',   '$(echo $LOGGED_IN_SALT | sed 's/[\/&]/\\&/g')' );/g" \
    -e "s/define( 'NONCE_SALT',       'put your unique phrase here' );/define( 'NONCE_SALT',       '$(echo $NONCE_SALT | sed 's/[\/&]/\\&/g')' );/g" \
    /var/www/html/wp-config-template.php > /var/www/html/wp-config.php

    sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 9000/g' /etc/php/8.2/fpm/pool.d/www.conf


/usr/local/bin/configure.sh

php-fpm8.2 -F