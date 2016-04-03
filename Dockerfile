FROM php:5.6-fpm

MAINTAINER Cedric Michaux <cedric@he8us.be>

ENV PHP_PORT 9000

EXPOSE $PHP_PORT

COPY entrypoint.sh /app/entrypoint.sh
COPY confd/ /etc/confd

ENV CONFD_VERSION 0.11.0

RUN \
    apt-get update -qq && \
    apt-get install -yqq \
        icu-devtools \
        libicu-dev \
        libmcrypt-dev \
        mysql-client

RUN \
    docker-php-ext-install \
        pdo_mysql \
        intl \
        mbstring \
        mcrypt \
        bcmath

RUN \
    curl -L -o /usr/local/bin/confd https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64 && \
    chmod +x /usr/local/bin/confd


ENTRYPOINT ["/app/entrypoint.sh"]

CMD ["php-fpm"]
