FROM alastairhm/alpine-lighttpd:latest

MAINTAINER  Thibault REMY
# ...and edited by DZA #

RUN apk add --update	lighttpd 	\
		        php-fpm   	\
			php-common \
			php-cgi \
			php \
		        php-curl   	\
		        php-json && \
    rm -rf /var/cache/apk/* 

ADD lighttpd.conf /etc/lighttpd/lighttpd.conf
ADD mod_fastcgi_fpm.conf /etc/lighttpd/mod_fastcgi_fpm.conf

RUN mkdir -p /run/lighttpd/
RUN chown www-data. /run/lighttpd/
RUN sed -i 's/expose_php = On/expose_php = Off/g' /etc/php/php.ini

#VOLUME ["/etc/lighttpd/"]
#VOLUME ["/var/www/localhost"]
VOLUME ["/var/www"]
VOLUME ["/var/log/lighttpd"]

EXPOSE 80

CMD php-fpm -D && lighttpd -D -f /etc/lighttpd/lighttpd.conf
