FROM debian:buster
EXPOSE 9000


RUN mkdir -p /var/www/html/wordpress
RUN	apt-get update && \
	apt-get install -y vim procps curl wget && \
	apt-get install -y lsb-release apt-transport-https ca-certificates && \
	wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg &&\
	echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list && \
	apt-get update

RUN	apt-get install -y php8.1 php8.1-fpm php8.1-mysqli php8.1-mysql php8.1-gd && \
	apt-get install -y mariadb-client

RUN	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

COPY	./conf/www.conf /etc/php/8.1/fpm/pool.d/
COPY	./conf/icecream.png /var/www/html/wordpress/wp-content/uploads/2023/01/

COPY	./tools/healthcheck.sh /tmp/
COPY	./tools/entrypoint.sh /tmp/

RUN	chmod +x /tmp/entrypoint.sh
RUN	chmod +x /tmp/healthcheck.sh

ENTRYPOINT ["/tmp/entrypoint.sh"]
CMD ["php-fpm8.1", "-F"]

