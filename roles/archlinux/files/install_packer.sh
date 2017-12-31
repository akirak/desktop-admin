#!/bin/sh

# This script must be run as a user, not as a root

# Install dependencies
sudo pacman -Sy --noconfirm --asdeps --needed base-devel fakeroot jshon expac git

tmpdir=`mktemp -d`
cd $tmpdir
curl https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=packer > PKGBUILD \
     && makepkg -si --noconfirm
r=$?
rm -rf $tmpdir
exit $r
