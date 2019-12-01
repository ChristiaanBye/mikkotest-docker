FROM php:7.3-apache
MAINTAINER Christiaan Bye christiaanbye@gmail.com

# Install packages
# libzip-dev       Required for the zip extensions
# openssh-server   Required to initate SSH connections
# wget             Required to install XDebug, Composer and Infection
# unzip            Required to unzip files when running composer install
RUN apt-get update && apt-get install -y libzip-dev openssh-server wget unzip

# Install pcntl for unit test time limits
RUN docker-php-ext-install pcntl

# Install XDebug
RUN pecl install xdebug
COPY xdebug-config/ /usr/local/etc/php/conf.d

# Install Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
  php composer-setup.php && \
  php -r "unlink('composer-setup.php');" && \
  mv /var/www/html/composer.phar /usr/local/bin/composer && \
  chmod a+x /usr/local/bin/composer

# Install Infection
RUN wget https://github.com/infection/infection/releases/download/0.9.0/infection.phar && \
  wget https://github.com/infection/infection/releases/download/0.9.0/infection.phar.pubkey && \
  chmod +x infection.phar && \
  mv infection.phar /usr/local/bin/infection && \
  mv infection.phar.pubkey /usr/local/bin/infection.pubkey

# Create an SSH user and start SSH
RUN mkdir /var/run/sshd
RUN useradd -m -u 1000 mikko -s /bin/bash
RUN echo 'mikko:test1234' | chpasswd
RUN usermod -a -G sudo mikko
CMD /usr/sbin/sshd -D

# Add permissions the working directory
RUN chown -R mikko:mikko /var/www/html

# Copy .bash_profile
COPY home-directory/ /home/mikko/
