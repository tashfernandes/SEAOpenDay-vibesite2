FROM ubuntu:trusty

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

RUN { \
        echo mysql-community-server mysql-community-server/data-dir select ''; \
        echo mysql-community-server mysql-community-server/root-pass password ''; \
        echo mysql-community-server mysql-community-server/re-root-pass password ''; \
        echo mysql-community-server mysql-community-server/remove-test-db select false; \
    } | debconf-set-selections

RUN apt-get -qy install supervisor apache2 php5 libapache2-mod-php5 php5-gd mysql-server php5-mysql

# Setup web app
RUN rm /var/www/html/index.html
COPY ./webapp /var/www/html
RUN chown -R www-data:www-data /var/www
RUN chmod -R 755 /var/www/html

COPY ./vibe.conf /etc/apache2/sites-available/
RUN rm /etc/apache2/sites-enabled/*
RUN ln -sf /etc/apache2/sites-available/vibe.conf /etc/apache2/sites-enabled/

COPY ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY scripts /scripts
RUN chmod 700 /scripts

CMD ["/usr/bin/supervisord"]

