#! /bin/sh

ROOT_DIR=$HOME/inception/srcs
NGINX_DIR=$ROOT_DIR/requirments/nginx

sudo docker build -t inception:nginx $NGINX_DIR

sudo docker image prune -f
