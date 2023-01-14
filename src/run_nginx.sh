docker build -t inception:nginx ./requirments/nginx
docker run -d \
	--rm \
	-v wp:/var/www/html/wordpress \
	--env-file .env \
	--link wordpress:wordpress \
	--name nginx \
	-p 443:443 \
	inception:nginx
