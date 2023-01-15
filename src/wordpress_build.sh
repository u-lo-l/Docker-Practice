#! /bin/sh

ROOT_DIR=$HOME/inception_2/src
WORDPRESS_DIR=$ROOT_DIR/requirments/wordpress

sudo docker build -t inception:wordpress $WORDPRESS_DIR

sudo docker image prune -f
