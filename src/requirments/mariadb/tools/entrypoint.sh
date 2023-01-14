#!/bin/sh

service mysql start
sh /tmp/mysql_secure_installation_automation.sh

sed -i s/'$WP_DB_NAME'/$WP_DB_NAME/g /tmp/initial_db.sql
sed -i s/'$DB_ADMIN_PASSWORD'/$DB_ADMIN_PASSWORD/g /tmp/initial_db.sql
sed -i s/'$DB_ADMIN'/$DB_ADMIN/g /tmp/initial_db.sql

mariadb < /tmp/initial_db.sql
#mysqld
