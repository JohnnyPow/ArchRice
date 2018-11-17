#!/bin/bash

mkdir -p $HOME/.cache
cd $HOME/.cache
rm -rf qemu-patched

git clone https://aur.archlinux.org/qemu-patched.git
cd qemu-patched
patch PKGBUILD < $HOME/.rice/vm/qemu-patched-x86_64.patch
makepkg -scfC
sudo pacman -U qemu-patched-*
cd ..
rm -rf qemu-patched

