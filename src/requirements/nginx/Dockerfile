
FROM debian:bookworm
ARG CERT_FOLDER CERTIFICATE KEY COUNTRY STATE LOCALITY UNIT COMMON_NAME
RUN apt update && apt upgrade -y && apt install -y nginx openssl gettext-base

RUN mkdir -p ${CERT_FOLDER}
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ${CERT_FOLDER}/${KEY} -out ${CERT_FOLDER}/${CERTIFICATE} -subj "/C=${COUNTRY}/ST=${STATE}/L=${LOCALITY}/OU=${UNIT}/CN=${COMMON_NAME}"
RUN chmod 600 ${CERT_FOLDER}/${KEY} && chmod 644 ${CERT_FOLDER}/${CERTIFICATE}

COPY conf/nginx.conf /tmp/nginx.conf
RUN envsubst '$CERT_FOLDER $KEY $CERTIFICATE $COMMON_NAME' < /tmp/nginx.conf > /etc/nginx/sites-available/default
ENTRYPOINT ["nginx", "-g", "daemon off;"]

