FROM php:8.4.3-apache
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh \
&& a2enmod rewrite \
&& apt-get update && apt-get install -y mariadb-client \
&& docker-php-ext-install pdo pdo_mysql mysqli \
&& docker-php-ext-enable pdo pdo_mysql
COPY app /var/www/html/
EXPOSE 80
ENV BASE_URL=http://localhost/biblio/
ENV HOST=localhost
ENV USER=usuario
ENV PASS=passw
ENV DB=biblioteca
ENV CHARSET="charset=utf8"
COPY app/biblioteca.sql /opt
CMD /usr/local/bin/docker-entrypoint.sh
