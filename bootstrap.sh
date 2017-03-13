#!/bin/sh
sudo pacman -Sy --noconfirm --asdeps ansible npm \
  && npm run up
