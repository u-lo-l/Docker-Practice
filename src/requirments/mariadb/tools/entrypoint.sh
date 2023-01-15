#!/bin/sh

set -e;
echo "Entrypoint start"
if [ ! -d $DB_PATH/$DB_NAME ]
then
	service mysql start; sleep 1;
	echo "  creating db"
	mariadb -u root -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
	echo "  creating user"
	mariadb -u root -e "CREATE USER IF NOT EXISTS '$MARIA_USER'@'%' IDENTIFIED BY '$MARIA_PW';"
	echo "  grant privilieges"
	mariadb -u root -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$MARIA_USER'@'%' WITH GRANT OPTION;"
	echo "  flush privilieges"
	mariadb -u root -e "FLUSH PRIVILEGES;"

	service mysql stop; sleep 1;
else
	echo "\033[3;34mTarget database already exist :( \033[0m";
fi

echo "Entrypoint done"
exec $@;
