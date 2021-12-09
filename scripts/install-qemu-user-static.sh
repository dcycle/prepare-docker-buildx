#!/bin/bash
#
# Install qemu-user-static.
#
set -e

# We want the latest version, not the one on the package manager, to avoid
# issues such as https://askubuntu.com/questions/1339558.
# See https://www.qemu.org/download/.
git clone --depth 1 https://gitlab.com/qemu-project/qemu.git
cd qemu
git submodule init
git submodule update --recursive
./configure
make
