FROM php:8.2-fpm

ARG USER
ARG UID

# Install system dependencies
RUN apt-get update \
    && apt-get install -y \
        git \
        curl \
        ca-certificates \
        supervisor \
        sqlite3 \
        libpng-dev \
        libonig-dev \
        libxml2-dev \
        zip \
        unzip

# Clear cache
RUN apt-get clean \
    && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# RUN docker-php-ext-enable \
#     redis xdebugs woole memcached

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Create system user to run Composer and Artisan Commands
RUN useradd -G www-data,root -u $UID -d /home/$USER $USER
RUN mkdir -p /home/$USER/.composer && \
    chown -R $USER:$USER /home/$USER

# COPY start-container /usr/local/bin/start-container
# COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY php.ini /etc/php/8.2/cli/conf.d/php.ini

# Set working directory
WORKDIR /var/www

USER $USER

# RUN chmod +x /usr/local/bin/start-container

# ENTRYPOINT [ "start-container" ]