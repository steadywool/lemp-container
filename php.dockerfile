FROM php:8.1-fpm-alpine3.15
RUN docker-php-ext-install pdo_mysql
