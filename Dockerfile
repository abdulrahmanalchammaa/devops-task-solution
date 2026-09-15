FROM php:7.3-fpm-buster

RUN apt-get update && apt-get install -y \
    unixodbc \
    unixodbc-dev \
    apt-transport-https \
    curl \
    gnupg \
    multiarch-support \
    && apt-get clean

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list

RUN apt-get update && ACCEPT_EULA=Y apt-get install -y msodbcsql17

RUN pecl install pdo_sqlsrv-5.9.0
RUN docker-php-ext-enable pdo_sqlsrv

RUN pecl install sqlsrv-5.9.0
RUN docker-php-ext-enable sqlsrv

WORKDIR /var/www/html

COPY ./web-root/QuickDbTest.php /var/www/html/QuickDbTest.php
EXPOSE 9000

CMD ["php-fpm"]
