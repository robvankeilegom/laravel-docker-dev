ARG BASE_IMAGE

FROM $BASE_IMAGE

# git/openssh-client: required for checking out private repos
RUN apt-get update && apt-get install -y  \
    libfreetype6-dev \
    libjpeg-dev \
    libpng-dev \
    libwebp-dev \
    libzip-dev \
    libmcrypt-dev \
    libxml2-dev \
    libfreetype6-dev \
    supervisor \
    git \
    openssh-client \
    --no-install-recommends \
    && pecl install redis-5.3.7 xdebug \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo_mysql -j$(nproc) gd bcmath zip intl pcntl\
    && docker-php-ext-enable redis xdebug

# Install composer from the composer container
COPY --from=composer /usr/bin/composer /usr/bin/composer
