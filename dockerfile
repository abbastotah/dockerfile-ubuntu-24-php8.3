FROM ubuntu:24.04

ENV CONTAINER_TIMEZONE="Europe/Brussels"
RUN ln -snf /usr/share/zoneinfo/$CONTAINER_TIMEZONE /etc/localtime && echo $CONTAINER_TIMEZONE > /etc/timezone

RUN apt update && apt install -y apache2

ENV APACHE_RUN_USER=www-data
ENV APACHE_RUN_GROUP=www-data
ENV APACHE_LOG_DIR=/var/log/apache2
ENV APACHE_RUN_DIR=/var/www/html
ENV APACHE_PID_FILE=/var/run/apache2/apache2.pid

COPY 000-default.conf /etc/apache2/sites-available

RUN apt install nano -y
RUN apt install git -y
RUN apt install curl -y
RUN apt install php8.3 -y
RUN apt install -y openssl php-bcmath php-curl php-json php-mbstring php-mysql php-tokenizer php-xml php-zip

RUN cd ~
RUN curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
RUN HASH=`curl -sS https://composer.github.io/installer.sig`
RUN php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer

RUN cd /var/www/html/
RUN a2enmod rewrite
EXPOSE 80/tcp
ENTRYPOINT ["/usr/sbin/apache2"]
CMD ["-D", "FOREGROUND"]