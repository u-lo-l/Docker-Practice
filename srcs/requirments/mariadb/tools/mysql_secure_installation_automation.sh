#!/bin/sh

apt-get install -y expect

SECURE_MYSQL=$(expect -c "
set timeout 3
spawn mysql_secure_installation
expect \"Enter current password for root (enter for none):\"
send \"\r\"
expect \"Change the root password?\"
send \"y\r\"
expect \"Hew password:\"
send \"$MARIA_ROOT_PW\r\"
expect \"Re-enter new password:\"
send \"$MARIA_ROOT_PW\r\"
expect \"Remove anonymous users?\"
send \"y\r\"
expect \"Disallow root login remotely?\"
send \"y\r\"
expect \"Remove test database and access to it?\"
send \"y\r\"
expect \"Reload privilege tables now?\"
send \"y\r\"
expect eof
")

echo "root pw : $MARIA_ROOT_PW"

apt-get purge -y expect
apt-get autoremove -y
