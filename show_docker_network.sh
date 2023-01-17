#!/bin/bash

sudo docker network ls;

while true;
do
	RES=$(sudo docker network ls);
	clear;
	printf "%s ${RES}"
	sleep 1;
done;
