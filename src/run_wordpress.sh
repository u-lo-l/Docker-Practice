docker build -t inception:wordpress ./requirments/wordpress
docker run -it \
	--rm \
	-v wp:/var/www/html/wordpress \
	--env-file .env \
	--link mariadb:mariadb \
	--name wordpress \
	-p 9000:9000 \
	inception:wordpress bash
