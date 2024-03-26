FROM php:8.3
RUN apt-get update -y && apt-get install -y openssl zip unzip git
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
ENV COMPOSER_ALLOW_SUPERUSER=1
WORKDIR /app
COPY . /app
RUN composer update

CMD php artisan serve --host=0.0.0.0 --port=8181
EXPOSE 8181
