FROM debian:buster

# INIT SET
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y nginx openssl dumb-init vim
RUN mkdir openssl

# OPENSSL SET
# COPY ./tools/openssl_dn /openssl/openssl.cnf
RUN openssl req -x509 -newkey rsa:2048 -nodes\
	-keyout /openssl/key.pem \
	-out /openssl/crt.pem \
	-subj "/C=KR/ST=Seoul/L=Gaepo/O=42/OU=42Seoul/CN=dkim2.42.fr"

# NGINX SET
EXPOSE 443
COPY ./conf/sample.conf /etc/nginx/sites-enabled/default
RUN echo "HELLO INCEPTION" > /home/index.txt

#ENTRYPOINT ["dumb-init"]
#CMD ["nginx", "-g", "daemon off;"]
