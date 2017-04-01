#!/bin/sh
sudo pacman -Sy --noconfirm --asdeps ansible npm \
  && git submodule init \
  && npm run up
