curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

echo "WP-CLI installed successfully."
echo "Configuring WordPress..."

wp core download --allow-root

wp core install --url=$DOMAIN/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

wp plugin install redis-cache --activate --allow-root

wp plugin update --all --allow-root

wp redis enable --allow-root