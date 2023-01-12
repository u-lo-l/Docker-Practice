FROM debian:buster

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y nginx openssl

EXPOSE 80

# MORE BUILD OPTIONS

CMD ["nginx", "-g", "daemon off;"]
