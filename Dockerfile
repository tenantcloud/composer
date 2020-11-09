FROM composer:2

LABEL maintainer="i.bronovskyi@tenantcloud.com"

RUN apk add build-base py-pip jpeg-dev zlib-dev

ENV LIBRARY_PATH=/lib:/usr/lib

RUN apk --update --virtual build-deps add icu-dev $PHPIZE_DEPS \
    && apk add icu \
    libpng \
    libjpeg-turbo \
    libpng-dev \
    libjpeg-turbo-dev \
    libzip-dev \
    libxml2-dev \
    libmcrypt-dev \
    imagemagick-dev \
    libtool

RUN docker-php-ext-configure intl \
    && docker-php-ext-install intl gd zip soap xml exif pcntl

RUN pecl install imagick \
    && docker-php-ext-enable imagick \
    && apk add --no-cache --virtual .imagick-runtime-deps imagemagick

WORKDIR /app

