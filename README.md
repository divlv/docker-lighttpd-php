# docker-lighttpd-php
Docker image for Lighttpd + php5 fpm

Checkout and build:

`docker build -t putasu .`

Then run:
`docker run --name puta1 -d -p 80:80 -v /www:/var/www -v /var/log/lighttpd:/var/log/lighttpd putasu`
