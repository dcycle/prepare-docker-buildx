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
echo 'Install qemu'
./scripts/install-qemu.sh
echo 'ls -l /usr/bin/qemu-aarch64-static'
ls -l /usr/bin/qemu-aarch64-static
echo 'qemu-aarch64-static --version'
qemu-aarch64-static --version
echo 'update-binfmts --version >= 2.1.7'
update-binfmts --version
echo 'scripts/reregister-qemu-binfmt.sh'
./scripts/reregister-qemu-binfmt.sh
echo 'check-qemu-binfmt.sh'
./scripts/check-qemu-binfmt.sh
echo 'Qemu version, should be 6 or more to avoid issues such as https://askubuntu.com/questions/1339558'
/usr/bin/qemu-system-x86_64 --version
echo 'docker buildx'
docker buildx
