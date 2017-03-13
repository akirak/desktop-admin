#!/bin/sh
tmpdir=`mktemp -d`
cd $tmpdir
curl https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=packer > PKGBUILD \
     && makepkg -si --noconfirm
r=$?
rm -rf $tmpdir
exit $r
