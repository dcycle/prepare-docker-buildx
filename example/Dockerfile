FROM drupal:7

RUN apt-get install -y libc-bin
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN composer global require drush/drush:~8
RUN ln -s /root/.composer/vendor/drush/drush/drush /bin/drush
RUN apt-get update
RUN apt-get install -y --no-install-recommends mariadb-client git zip
RUN rm -rf /var/lib/apt/lists/*
RUN mkdir /var/www/latest-drupal
RUN cd /var/www/latest-drupal && drush dl drupal-7
RUN cp -r /var/www/latest-drupal/drupal-*/* /var/www/html
