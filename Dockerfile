FROM php:5.6.30-apache

VOLUME ["/var/www", "/var/log/apache2", "/etc/apache2"]

RUN echo "[ ***** ***** ***** ] - Copying files to Image ***** ***** ***** "
COPY ./src /tmp/src

RUN apt-get update

RUN echo "[ ***** ***** ***** ] - Installing each item in new command to use cache and avoid download again ***** ***** ***** "
RUN apt-get install -y apt-utils
RUN apt-get install -y nodejs
RUN apt-get install -y libfreetype6-dev
RUN apt-get install -y libjpeg62-turbo-dev
RUN apt-get install -y libxml2-dev
RUN apt-get install -y git
RUN apt-get install -y vim
RUN apt-get install -y zlib1g-dev

RUN echo "[ ***** ***** ***** ] - Installing PHP Dependencies ***** ***** ***** "
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd
RUN docker-php-ext-install zip

RUN chmod +x -R /tmp/src/

EXPOSE 80
EXPOSE 9000

WORKDIR /var/
RUN git clone http://git.cultura.gov.br/95274316115/valecultura-dashboard.git www
WORKDIR /var/www

RUN echo "[ ***** ***** ***** ] - Begin of Actions inside Image ***** ***** ***** "
CMD /tmp/src/actions/start.sh