#!/bin/bash
#
# Install qemu-user-static.
#
set -e

echo "Must go through hoops because of https://cloudsupport.digitalocean.com/s/case/5004P00001hK6QuQAK/after-creating-droplet-could-not-get-lock-varlibdpkglockfrontend:"
echo "E: Could not get lock /var/lib/dpkg/lock-frontend - open (11: Resource temporarily unavailable)"
echo "E: Unable to acquire the dpkg frontend lock (/var/lib/dpkg/lock-frontend), is another process using it?"
sudo rm -f /var/lib/apt/lists/lock
sudo rm -f /var/lib/apt/lists/lock-frontend
sudo rm -f /var/lib/dpkg/lock-frontend
sudo rm -f /var/lib/dpkg/lock
sudo sudo apt-get install -y qemu-user-static
