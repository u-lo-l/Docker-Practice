#!/bin/bash

sudo docker comtainer ls -a;

while true;
do
	RES=$(sudo docker container ls -a);
	tput clear;
	printf "%s ${RES}"
	sleep 2;
done;
