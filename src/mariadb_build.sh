#! /bin/sh

ROOT_DIR=$HOME/inception_2/src
MARIADB_DIR=$ROOT_DIR/requirments/mariadb

sudo docker build -t inception:mariadb $MARIADB_DIR

sudo docker image prune -f
