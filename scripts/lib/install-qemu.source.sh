if [ "$INSTALL_QEMU_MAKE" == 1 ]; then
  ./scripts/install-qemu.sh
else
  ./scripts/install-qemu-user-static.sh
fi
