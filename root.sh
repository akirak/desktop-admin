#!/bin/sh

if [ -f /etc/arch-release ]; then
    echo "The target is running Arch Linux"
    pacman -Sy --noconfirm --asdeps ansible git || exit 1
    playbook=archlinux.yml
else
    echo "Unsupported distribution" >& 2
    exit 1
fi

git submodule update --init --depth 1 --recursive \
    && ansible-playbook -i localhost, -c local ${playbook}
