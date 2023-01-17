#!/bin/sh

echo "  priviliege changed"
 chown -R www-data:www-data /var/www/*
 chmod -R 755 /var/www/html/wordpress
sleep 10 && echo "go5";
sleep 10 && echo "go4";
sleep 10 && echo "go3";
sleep 10 && echo "go2";
sleep 10 && echo "go1";
if [ ! -f $WP_PATH/wp-config.php ]
then
	service php8.1-fpm start; sleep 1;
	echo "  php8.1-fpm started : $WP_PATH"
	cd $WP_PATH
	wp core download	--allow-root;
	echo "  wc downloaded"
	wp config create	--dbname=$DB_NAME \
						--dbuser=$MARIA_ID \
						--dbpass=$MARIA_PW \
						--dbhost=$DB_HOST \
						--allow-root;
	
	wp core install		--url=$DOMAIN_NAME \
						--title="HI INCEPTION(dkim2)" \
						--admin_user=$WP_ADMIN_ID \
						--admin_password=$WP_ADMIN_PW \
						--admin_email=$WP_ADMIN_MAIL \
						--skip-email \
						--allow-root;
	echo "  wp installed"
	
	wp user create		$WP_USER_ID \
						$WP_USER_MAIL \
						--user_pass=$WP_USER_PW \
						--allow-root;
	echo "  wp user created"
	
	wp theme install hestia --allow-root
	wp theme activate hestia --allow-root

	echo "  theme activated"

	service php8.1-fpm stop; sleep 1;
else
	echo "\033[3;33mWordPress is already installed\033[0m"
	mkdir -p /run/php
fi

echo "Entrypoint DONE"
exec $@
# php-fpm8.1 -F
# service php8.1-fpm start
