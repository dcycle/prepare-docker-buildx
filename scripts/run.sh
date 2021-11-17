#!/bin/bash
#
# Make sure we are ready to run docker buildx
#
set -e

echo 'See https://medium.com/@artur.klauser/building-multi-architecture-docker-images-with-buildx-27d80f7e2408'
echo 'docker -v >= 19.03'
docker -v
echo 'linux kernel version, uname -r >= 4.8'
uname -r
echo '/proc/sys/fs/binfmt_misc/ must exist'
ls -lah /proc/sys/fs/binfmt_misc/
echo 'qemu-user-static'
sudo apt-get install -y qemu-user-static
echo 'ls -l /usr/bin/qemu-aarch64-static'
ls -l /usr/bin/qemu-aarch64-static
echo 'qemu-aarch64-static --version'
qemu-aarch64-static --version
echo 'update-binfmts --version >= 2.1.7'
update-binfmts --version
echo 'check-qemu-binfmt.sh'
./scripts/check-qemu-binfmt.sh
