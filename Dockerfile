# Choose the desired PHP version
# Choices available at https://hub.docker.com/_/php/ stick to "-cli" versions recommended

FROM php:8.2.12-cli

LABEL Gabriel Stapinato <gstapinato@gmail.com>

ENV TARGET_DIR="/usr/local/lib/php-code-quality" \
    COMPOSER_ALLOW_SUPERUSER=1 \
    TIMEZONE=America/New_York 

RUN mkdir -p $TARGET_DIR

WORKDIR $TARGET_DIR

RUN apt-get update && apt-get install -y ca-certificates wget bash curl jq docker

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN apt-get update && \
    apt-get install -y wget && \
    apt-get install -y zip && \
    apt-get install -y git && \
    apt-get install -y libxml2-dev && \
    docker-php-ext-install xml

RUN chmod 744 /usr/bin/composer

# Run composer installation of needed tools
# RUN $TARGET_DIR/composer-installer.sh && \

RUN composer selfupdate && \
    composer global config --no-plugins allow-plugins.phpstan/extension-installer true && \
    composer global require --prefer-stable --prefer-dist \
        "squizlabs/php_codesniffer:^3.6" \  
        "phpunit/phpunit:^9.5" \
        "phploc/phploc:^7.0" \
        "pdepend/pdepend:^2.10" \
        "phpmd/phpmd:^2.10" \
        "sebastian/phpcpd:^6.0" \
        "friendsofphp/php-cs-fixer:^3.2" \
        "phpcompatibility/php-compatibility:^9.3" \
        "phpmetrics/phpmetrics:^2.7" \
        "phpstan/phpstan:^1.1" \
        "phpstan/phpstan-symfony:^1.3" \
        "phpstan/extension-installer:^1.3" 
