docker build -t inception:mariadb ./requirments/mariadb
docker run -it \
	--rm \
	-v db:/var/lib/mysql \
	--env-file .env \
	--name mariadb \
	-p 3306:3306 \
	inception:mariadb bash
