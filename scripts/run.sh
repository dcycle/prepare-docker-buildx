#!/bin/bash
#
# Make sure we are ready to run docker buildx
#
set -ex

echo "Starting in February 2023, we get ERROR: docker experimental flag not enabled: Set with 'export DOCKER_CLI_EXPERIMENTAL=enabled' even though that has been done in the calling script. So we're doing it again here."
export DOCKER_CLI_EXPERIMENTAL=enabled
echo 'See https://medium.com/@artur.klauser/building-multi-architecture-docker-images-with-buildx-27d80f7e2408'
echo 'docker -v >= 19.03'
docker -v
echo 'linux kernel version, uname -r >= 4.8'
uname -r
echo '/proc/sys/fs/binfmt_misc/ must exist'
ls -lah /proc/sys/fs/binfmt_misc/
echo 'Install qemu'
source ./scripts/lib/install-qemu.source.sh
ls -l /usr/bin/qemu-aarch64-static
qemu-aarch64-static --version
echo 'update-binfmts --version >= 2.1.7'
update-binfmts --version
./scripts/reregister-qemu-binfmt.sh
./scripts/check-qemu-binfmt.sh
echo 'Qemu version, should be 6 or more to avoid issues such as https://askubuntu.com/questions/1339558'
docker buildx
