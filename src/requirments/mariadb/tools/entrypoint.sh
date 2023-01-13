#!/bin/sh

service mysql start
sh /tmp/mysql_secure_installation_automation.sh
mariadb < /tmp/initial_db.sql
