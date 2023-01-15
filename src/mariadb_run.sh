#! /bin/sh

ROOT_DIR=$HOME/inception_2/src
DOCKER_ENV=$ROOT_DIR/.env

IMG_NAME=mariadb
IMG_VOL=db_vol:/var/lib/mysql
IMG_HOST=mariadb_host

echo -n "\033[33m";
echo "\tname : $IMG_NAME";
echo "\tenv  : $DOCKER_ENV";
echo "\tvol  : $IMG_VOL";
echo "\thost : $IMG_HOST";
echo -n "\033[0m";

sudo docker run --interactive --tty \
		--init \
		--rm \
		--name $IMG_NAME \
		--env-file $DOCKER_ENV \
		--volume $IMG_VOL \
		--hostname $IMG_HOST \
		inception:mariadb
