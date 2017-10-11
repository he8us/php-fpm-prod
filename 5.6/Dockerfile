FROM he8us/php-fpm-common:5.6

MAINTAINER Cedric Michaux <cedric@he8us.be>

ENV APCU_VERSION 4.0.10

RUN \
    apk update --no-cache \
    && apk add --no-cache \
        --virtual .phpize-deps $PHPIZE_DEPS \
    && pecl install apcu-$APCU_VERSION \
    && docker-php-ext-enable apcu \
    && apk del .phpize-deps
