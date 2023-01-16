#!/bin/sh


if [ ! -f $WP_PATH/wp-config.php ]
then

	service php8.1-fpm start; sleep 1;
	echo "  php8.1-fpm started"	
	wp core download	--path="$WP_PATH" \
				--allow-root;
	echo "  wc downloaded"
	wp config create	--dbname=$DB_NAME \
				--dbuser=$MARIA_ID \
				--dbpass=$MARIA_PW \
				--dbhost=$DB_HOST \
				--path="$WP_PATH" \
				--allow-root;
	
	wp core install		--url=$DOMAIN_NAME \
				--title="HI INCEPTION" \
				--admin_user=$WP_ADMIN_ID \
				--admin_password=$WP_ADMIN_PW \
				--admin_email=$WP_ADMIN_MAIL \
				--skip-email \
				--path="$WP_PATH" \
				--allow-root;
	echo "  wp installed"
	wp user create		$WP_USER_ID \
				$WP_USER_MAIL \
				--user_pass=$WP_USER_PW \
				--path="$WP_PATH" \
				--allow-root;
	echo "  wp user created"
	
	chown -R www-data:www-data /var/www/*
	chmod -R 755 /var/www/html/wordpress
	echo "  priviliege changed"

	service php8.1-fpm stop
else
	echo "\033[3;33mWordPress is already installed\033[0m"
fi

echo "  configuring wordpress"
service php8.1-fpm start

wp theme install hestia --path=$WP_PATH \
                        --allow-root

wp theme activate hestia --path=$WP_PATH \
                         --allow-root

service php8.1-fpm stop

exec $@

