
FROM debian:bookworm
ARG CERT_FOLDER CERTIFICATE KEY COUNTRY STATE LOCALITY UNIT COMMON_NAME
RUN apt update && apt upgrade -y && apt install -y nginx openssl gettext-base
EXPOSE 443

RUN mkdir -p ${CERT_FOLDER}
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out ${CERT_FOLDER}/${CERTIFICATE} -keyout ${CERT_FOLDER}/${KEY} -subj "/C=${COUNTRY}/ST=${STATE}/L=${LOCALITY}/O=${ORGANIZATION}/OU=${UNIT}/CN=${COMMON_NAME}"
RUN chmod 600 ${CERT_FOLDER}/${KEY} && chmod 644 ${CERT_FOLDER}/${CERTIFICATE}

COPY conf/nginx.conf ./tmp/nginx.conf
RUN envsubst '$CERT_FOLDER $KEY $CERTIFICATE $COMMON_NAME' < /tmp/nginx.conf > /etc/nginx/sites-available/default
ENTRYPOINT ["nginx", "-g", "daemon off;"]
