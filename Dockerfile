ARG ARCH=
FROM ${ARCH}php:8-apache

RUN apt-get update && \
    apt-get -y upgrade

RUN mkdir -p /var/www/html
WORKDIR /var/www/html

COPY ./.htaccess .
COPY ./metrics .

RUN chown www-data:www-data -R /var/www/html && \
    chmod 550 -R /var/www/html

ENV	SHELLY_HOSTNAME="192.168.15.2" \
    SHELLY_HTTP_USERNAME="" \
    SHELLY_HTTP_PASSWORD=""
