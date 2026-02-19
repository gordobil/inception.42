
FROM debian:bookworm

RUN apt update && apt upgrade -y && apt install -y nginx openssl gettext-base
EXPOSE 443

ARG CERT_FOLDER CERTIFICATE KEY COUNTRY STATE LOCALITY ORGANIZATION UNIT COMMON_NAME
ENV CERT_FOLDER=${CERT_FOLDER} CERTIFICATE=${CERTIFICATE} KEY=${KEY} COMMON_NAME=${COMMON_NAME}

RUN mkdir -p ${CERT_FOLDER}
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out ${CERT_FOLDER}/${CERTIFICATE} -keyout ${CERT_FOLDER}/${KEY} -subj "/C=${COUNTRY}/ST=${STATE}/L=${LOCALITY}/O=${ORGANIZATION}/OU=${UNIT}/CN=${COMMON_NAME}"
RUN chmod 600 ${CERT_FOLDER}/${KEY} && chmod 644 ${CERT_FOLDER}/${CERTIFICATE}

COPY conf/nginx.conf /etc/nginx/conf.d
RUN mkdir -p /run/nginx

ENTRYPOINT ["nginx", "-g", "daemon off;"]

