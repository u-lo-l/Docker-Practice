#!/bin/sh
echo "  priviliege changed"
 chown -R www-data:www-data /var/www/*
 chmod -R 755 /var/www/html/wordpress

service php8.1-fpm start; sleep 1;

if [ ! -f $WP_PATH/wp-config.php ]
then
	cd $WP_PATH
	wp core download	--allow-root;
	
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
	
	wp user create		$WP_USER_ID \
						$WP_USER_MAIL \
						--user_pass=$WP_USER_PW \
						--allow-root;
	
	wp theme activate twentytwentytwo --allow-root
	cd /
else
	echo "\033[3;33mWordPress is already installed\033[0m"
fi

service php8.1-fpm stop; sleep 1;

echo "Entrypoint DONE"
exec $@
