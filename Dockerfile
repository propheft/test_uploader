FROM php:7.2-apache

EXPOSE 80

COPY wp /var/www/html/
COPY main.sh /main.sh
RUN set -ex && /bin/bash -c "chmod 755 /main.sh"

RUN rm -rf /var/www/index.html

COPY config.yml /var/www/html/config.yml
COPY config.php /var/www/html/config.php

ADD https://files.trendmicro.com/products/CloudOne/ApplicationSecurity/1.0.2/agent-php/trend_app_protect-x86_64-Linux-gnu-4.1.11-20170718.so /usr/local/lib/php/extensions/no-debug-non-zts-20170718/trend_app_protect.so
COPY trend_app_protect.ini /usr/local/etc/php/conf.d

ENTRYPOINT ["/main.sh"]

CMD ["default"]
