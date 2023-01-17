FROM debian:buster
EXPOSE 3306

RUN	apt-get update && \
	apt-get install -y mariadb-server && \
	apt-get install -y vim && \
	apt-get install -y procps

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/entrypoint.sh /tmp/

RUN 	chmod +x /tmp/entrypoint.sh

ENTRYPOINT ["/tmp/entrypoint.sh"]
#CMD ["/bin/bash"]
CMD ["mysqld_safe"]
