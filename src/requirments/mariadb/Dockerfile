FROM debian:buster

# apt-utils 없다고 warning나옴.
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y apt-utils mariadb-server

EXPOSE 3306
