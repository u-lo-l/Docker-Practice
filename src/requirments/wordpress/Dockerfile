FROM debian:buster

RUN apt-get update && apt-get -y upgrade

# Download SURY PPA for PHP 8.1
RUN apt-get -y install lsb-release apt-transport-https ca-certificates wget &&\
    wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg &&\
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list&&\
    apt-get update

# Download packages
RUN apt-get install -y mariadb-client php8.1-fpm php8.1-mysql curl vim

# Download wp
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
    chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
RUN mkdir -p /var/www/html/wordpress

COPY ./conf/wp-config-sample.php /tmp/wp-config.php
COPY ./tools/entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh
EXPOSE 9000


