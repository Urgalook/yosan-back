FROM php:8.4-fpm
WORKDIR /var/www/html
RUN apt-get update && apt-get install -y libpq-dev git libzip-dev libsodium-dev \
    && docker-php-ext-install pdo_pgsql zip sodium
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
COPY composer.json composer.lock .
RUN composer install --no-scripts
COPY . /var/www/html
CMD ["php-fpm"]
