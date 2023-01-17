#!/bin/sh

if [ `ps -auxf | grep -v grep | grep -c "/usr/bin/mysqld_safe --console"` ];
then
	if mariadb-check -h mariadb -udkim2 -p0000 wpdb -s;
	then
		exit 0
	fi
fi
exit 1
