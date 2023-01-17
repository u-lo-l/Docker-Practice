FROM debian:buster
EXPOSE 443

RUN mkdir -p /var/www/html/wordpress
# INIT SET
RUN	apt-get update && \
	apt-get install -y nginx \
			   openssl \
			   procps \
			   vim

# OPENSSL SET
RUN	mkdir openssl
RUN	openssl req -x509 -newkey rsa:2048 -nodes\
	-keyout /openssl/key.pem \
	-out /openssl/crt.pem \
	-subj "/C=KR/ST=Seoul/L=Gaepo/O=42/OU=42Seoul/CN=dkim2.42.fr"

COPY ./conf/sample.conf /etc/nginx/sites-enabled/default

CMD ["nginx", "-g", "daemon off;"]
