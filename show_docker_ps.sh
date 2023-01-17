#!/bin/bash

sudo docker ps;

while true;
do
	RES=$(sudo docker ps);
	tput clear;
	printf "%s ${RES}"
	sleep 2;
done;
