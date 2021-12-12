FROM php:7.4

# Installing libc-bin which causes major headaches with QEMU and AMR (https://forums.linuxmint.com/viewtopic.php?p=1871690). Here is a technique that works.

RUN apt-get update && \
  apt-get install -y libc-bin && \
  apt-get update && \
  apt-get install -y --no-install-recommends mariadb-client git zip || true && \
  dpkg --purge --force-all libc-bin && \
  apt-get install -y --no-install-recommends mariadb-client git zip && \
  rm -rf /var/lib/apt/lists/*
