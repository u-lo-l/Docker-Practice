#! /bin/sh

ROOT_DIR=$HOME/inception/srcs
DOCKER_ENV=$ROOT_DIR/.env

IMG_NAME=wordpress
IMG_VOL=wp_vol:/var/www/html/wordpress
IMG_HOST=wordpress_host

echo -n "\033[33m";
echo "\tname : $IMG_NAME";
echo "\tenv  : $DOCKER_ENV";
echo "\tvol  : $IMG_VOL";
echo "\thost : $IMG_HOST";
echo -n "\033[0m";

sudo docker run -it \
		--init \
		--rm \
		--name $IMG_NAME \
		--env-file $DOCKER_ENV \
		--volume $IMG_VOL \
		--network ft_inception \
		inception:wordpress
