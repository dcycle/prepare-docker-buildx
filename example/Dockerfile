FROM php:7.4

RUN apt-get update
RUN rm /var/cache/ldconfig/aux-cache
RUN /sbin/ldconfig
RUN apt-get install -y git
