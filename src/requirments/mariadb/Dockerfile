FROM debian:buster

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y vim mariadb-server dumb-init expect

COPY ./tools/mysql_secure_installation_automation.sh /tmp/
COPY ./tools/initial_db.sql /tmp/
COPY ./tools/entrypoint.sh /tmp/

RUN chmod +x /tmp/entrypoint.sh
ENTRYPOINT ["dumb-init"]
CMD ["/bin/sh", "-c", "/tmp/entrypoint.sh"]

EXPOSE 3306
