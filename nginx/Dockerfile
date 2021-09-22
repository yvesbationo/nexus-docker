FROM nginx

RUN apt-get update; apt-get install -y \
    openssl

RUN mkdir -p /etc/nginx/external; \
    openssl req -x509 -newkey rsa:4096 \
    -subj "/C=XX/ST=XXXX/L=XXXX/O=XXXX/CN=localhost" \
    -keyout "/etc/nginx/external/key.pem" \
    -out "/etc/nginx/external/cert.pem" \
    -days 365 -nodes -sha256

COPY nginx.conf /etc/nginx/nginx.conf
