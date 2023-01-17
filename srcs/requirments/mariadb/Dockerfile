FROM debian:buster
EXPOSE 3306

RUN	apt-get update && \
	apt-get install -y mariadb-server && \
	apt-get install -y vim && \
	apt-get install -y procps

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./conf/ds_dump.sql /tmp/
COPY ./tools/entrypoint.sh /tmp/
COPY ./tools/healthcheck.sh /tmp/

RUN 	chmod +x /tmp/entrypoint.sh
RUN	chmod +x /tmp/healthcheck.sh

ENTRYPOINT ["/tmp/entrypoint.sh"]
CMD ["mysqld_safe --console"]
