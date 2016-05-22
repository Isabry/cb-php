FROM debian
MAINTAINER Ismail SABRY <ismail@sabry.fr>

# Usage:
# docker run -d --name=couchbase-php -p 8080:80 -p 8443:443 isabry/couchbase-php
# webroot: /var/www/html/
# Apache2 config: /etc/apache2/

RUN apt-get update && \
    apt-get -y install apache2 && \
    apt-get -y install libapache2-mod-php5 php5 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

RUN /usr/sbin/a2ensite default-ssl
RUN /usr/sbin/a2enmod ssl

EXPOSE 80
EXPOSE 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
