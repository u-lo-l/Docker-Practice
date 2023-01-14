#!/bin/sh

chmod -R 755 /var/www/html/wordpress/

wp core download --allow-root --path=/var/www/html/wordpress

wp config create --dbname=$WP_DB_NAME --dbuser=$DB_ADMIN --dbpass=$DB_ADMIN_PASSWORD --dbhost=mariadb --allow-root

wp core install --url=$DOMAIN_NAME --title="dkim2 wp" --admin_user=$DB_ADMIN --admin_password=$DB_ADMIN_PASSWORD --admin_email="none" --skip-email --allow-root

wp user create $DB_USER --user_pass=$DB_USER_PASSWORD --role=author --allow-root

chown -R www-data:www-data /var/www/html/wordpress

service php8.1-fpm start
service php8.1-fpm stop
echo "hi?"
php-fpm8.1 -F
