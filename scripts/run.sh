#!/bin/bash
#
# Make sure we are ready to run docker buildx
#
set -e

echo 'docker -v >= 19.03'
docker -v
echo 'linux kernel version, uname -r >= 4.8'
uname -r
echo '/proc/sys/fs/binfmt_misc/ must exist'
ls -lah /proc/sys/fs/binfmt_misc/
echo 'qemu-user-static'
sudo apt-get install -y qemu-user-static
