#!/bin/sh

# Install dependencies

# Solus
if [ -f /etc/solus-release ]; then
    sudo eopkg install ansible nodejs
# Arch Linux
elif [ -f /etc/arch-release ]; then
    sudo pacman -Sy --noconfirm --asdeps ansible npm
else
    echo "Unsupported system"
    exit 1
fi

if [ $? -gt 0 ]; then
    exit 1
fi

git submodule init \
  && npm run up
