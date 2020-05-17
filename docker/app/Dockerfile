FROM php:7.4-apache

WORKDIR /var/www/html

RUN apt-get update && apt-get install -y \
        git \
        zip \
        locales \
        openssh-client \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        zlib1g-dev libicu-dev g++ \
        libxss1 libappindicator1 libindicator7 wget \
        libzip-dev \
        fonts-liberation libappindicator3-1 libasound2 libatk-bridge2.0-0  libgtk-3-0 libnspr4 libnss3 libx11-xcb1 libxtst6 xdg-utils \ 
    && docker-php-ext-install -j$(nproc) pdo_mysql \
    && docker-php-ext-install -j$(nproc) mysqli \
    && docker-php-ext-install -j$(nproc) bcmath \
    && docker-php-ext-install -j$(nproc) intl \
    && docker-php-ext-install -j$(nproc) zip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && pecl install xdebug-2.9.5 \
    && docker-php-ext-enable xdebug \
    && php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN cp $PHP_INI_DIR/php.ini-production $PHP_INI_DIR/php.ini

# RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# RUN apt-get install -f
# RUN dpkg -i google-chrome*.deb

# Prevent "The authenticity of host 'github.com'" every `composer install` run
RUN mkdir /root/.ssh && ssh-keyscan github.com >> /root/.ssh/known_hosts

COPY docker/app/000-default.conf /etc/apache2/sites-enabled/000-default.conf
COPY docker/app/ports.conf /etc/apache2/ports.conf
COPY docker/app/xdebug.ini $PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini

RUN a2enmod rewrite
RUN a2enmod ssl

COPY docker/app/start-container /start-container
RUN chmod +x /start-container

COPY ${PROJECT_FOLDER}/${LARAVEL_FOLDER} /var/www/html/${LARAVEL_FOLDER}
RUN chown -R www-data:www-data *

EXPOSE 80
ENTRYPOINT ["/start-container"]
CMD ["apache2-foreground"]
