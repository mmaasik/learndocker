FROM php:8.4-apache

RUN apt update

RUN apt install nano zip -y

RUN docker-php-ext-install mysqli

WORKDIR /

RUN curl https://wordpress.org/wordpress-6.9.zip --output wordpress.zip

RUN unzip wordpress.zip

RUN mv wordpress/* /var/www/html/

WORKDIR /var/www/html

RUN mv wp-config-sample.php wp-config.php

RUN sed -i -e 's/database_name_here/wordpress/g' wp-config.php
RUN sed -i -e 's/username_here/root/g' wp-config.php
RUN sed -i -e 's/password_here/example/g' wp-config.php
RUN sed -i -e 's/localhost/db/g' wp-config.php