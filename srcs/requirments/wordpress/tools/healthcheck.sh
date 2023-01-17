#!/bin/sh

RES=`ps -aux | grep -v grep | grep "php-fpm: master process" | awk '{print $8}'`

if [ ${RES} = "S" ];
then
	exit 0
else
	exit 1
fi
