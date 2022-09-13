#! /bin/sh

set -e

# Cleanup previous attempt
sudo umount tmp/baseimg 2> /dev/null || true
sudo umount tmp/workdir 2> /dev/null || true
sudo umount tmp/chroot/dev 2> /dev/null || true
sudo umount tmp/chroot 2> /dev/null || true
sudo rm -rf tmp

# Remount everything
sudo mkdir -p tmp/workdir tmp/baseimg tmp/chroot tmp/session
sudo chmod 777 -R tmp/

#sudo mount -t squashfs  debian-stable.squashfs tmp/baseimg
#sudo mount -t overlay overlay -o lowerdir=exo-navigation/:tmp/baseimg,upperdir=tmp/session,workdir=tmp/workdir tmp/chroot/
sudo mount -t overlay overlay -o rw,lowerdir=exo-navigation/:chrootdir/,upperdir=tmp/session,workdir=tmp/workdir tmp/chroot/
sudo mount -t devtmpfs /dev tmp/chroot/dev

sudo HOME=/home/user chroot --userspec=user:user tmp/chroot /bin/bash --login --rcfile /home/user/.bashrc -i 

if [ -e tmp/session/.shtrl/OK ] ; then
  echo "PASSED"
else 
  echo "FAILED"
fi