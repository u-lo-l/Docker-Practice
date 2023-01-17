#!/bin/sh

set -e;
echo "Entrypoint start"

sed -i "s/password =/password = $MARIA_ROOT_PW/g" /etc/mysql/debian.cnf
if [ ! -d $DB_PATH/$DB_NAME ]
then
	service mysql start; sleep 1;
	
	echo "  creating db"
	mariadb -u root -p$MARIA_ROOT_PW -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
	mariadb -u root -p$MARIA_ROOT_PW -e "CREATE USER IF NOT EXISTS '$MARIA_USER'@'%' IDENTIFIED BY '$MARIA_PW';"
	mariadb -u root -p$MARIA_ROOT_PW -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$MARIA_USER'@'%' WITH GRANT OPTION;"
	mariadb -u root -p$MARIA_ROOT_PW -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIA_ROOT_PW}';"
	mariadb -u root -p$MARIA_ROOT_PW -e "FLUSH PRIVILEGES;"
	mariadb -u root -p$MARIA_ROOT_PW $DB_NAME < /tmp/ds_dump.sql
	service mysql stop; sleep 1;
else
	echo "\033[3;34mTarget database already exist :( \033[0m";
fi

echo "Entrypoint done"
exec $@;
