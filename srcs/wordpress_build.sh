#! /bin/sh

ROOT_DIR=$HOME/inception/srcs
WORDPRESS_DIR=$ROOT_DIR/requirments/wordpress

sudo docker build -t inception:wordpress $WORDPRESS_DIR

sudo docker image prune -f
