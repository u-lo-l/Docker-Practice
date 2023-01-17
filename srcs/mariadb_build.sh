#! /bin/sh

ROOT_DIR=$HOME/inception/srcs
MARIADB_DIR=$ROOT_DIR/requirments/mariadb

sudo docker build -t inception:mariadb $MARIADB_DIR

sudo docker image prune -f
