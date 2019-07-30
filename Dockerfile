FROM phusion/baseimage:latest
RUN apt-get update && apt-get install -y wget tar make libpcre3 libpcre3-dev openssl libssl-dev openssl libssl-dev
WORKDIR /root
RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php && \
apt-get update && \
apt-get install -y php7.2-cli \
php7.2-common \
php7.2 \
php7.2-mysql \
php7.2-fpm \
php7.2-curl \
php7.2-bz2 \
php7.2-json \
php7.2-cgi \
php7.2-mbstring \
php7.2-gd \
php-imagick \
php-memcache \
php-pear \
php7.2-xml \
php7.2-dev \
php7.2-bcmath \
php7.2-zip \
php7.2-dom && \
wget https://github.com/swoole/swoole-src/archive/v4.4.2.tar.gz && \
tar zxfv v4.4.2.tar.gz && rm -rf v4.4.2.tar.gz && \
cd /root/swoole-src-4.4.2 && \
phpize7.2 && ./configure \
--enable-openssl  \
--enable-http2  \
--enable-sockets \
--enable-mysqlnd && \
make clean && make install && \
echo "extension=swoole.so" >> /etc/php/7.2/cli/php.ini && \
cd /root && rm -rf swoole-src-4.4.2
