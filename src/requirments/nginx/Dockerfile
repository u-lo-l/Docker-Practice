FROM debian:buster
EXPOSE 443

# INIT SET
RUN	apt-get update && \
	apt-get install -y nginx \
			   openssl \
			   procps \
			   vim
RUN	mkdir openssl

# OPENSSL SET
# COPY ./tools/openssl_dn /openssl/openssl.cnf
RUN	openssl req -x509 -newkey rsa:2048 -nodes\
	-keyout /openssl/key.pem \
	-out /openssl/crt.pem \
	-subj "/C=KR/ST=Seoul/L=Gaepo/O=42/OU=42Seoul/CN=dkim2.42.fr"

COPY ./conf/sample.conf /etc/nginx/sites-enabled/default

CMD ["nginx", "-g", "daemon off;"]
