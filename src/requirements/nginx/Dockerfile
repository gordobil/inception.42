
FROM debian:bookworm
RUN apt update && apt upgrade -y && apt install -y nginx openssl

RUN mkdir -p /etc/nginx/certs
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/certs/nginx-selfsigned.key -out /etc/nginx/certs/nginx-selfsigned.crt -subj "/C=SP/ST=Euskadi/L=Bilbao/OU=Cadet/CN=ngordobi.42.fr"
RUN chmod 600 /etc/nginx/certs/nginx-selfsigned.key && chmod 644 /etc/nginx/certs/nginx-selfsigned.crt

COPY ./conf/nginx.conf /etc/nginx/sites-available/default
ENTRYPOINT ["nginx", "-g", "daemon off;"]
