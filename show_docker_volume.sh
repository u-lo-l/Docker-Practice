#!/bin/bash

sudo docker volume ls;

while true;
do
	clear;
	sudo docker volume ls;
	ls /home/dkim2/data/db_vol;
	ls /home/dkim2/data/wp_vol;
	sleep 1;
done;
