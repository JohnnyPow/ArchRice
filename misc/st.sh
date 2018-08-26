#!/bin/sh

cd ~/.rice/misc/st
git reset --hard
patch config.h zenburn-theme.patch
patch config.h disable-transparency.patch
patch config.h hidpi.patch
make
sudo make install
