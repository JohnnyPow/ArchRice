#!/bin/bash

mkdir -p $HOME/.cache
cd $HOME/.cache
rm -rf qemu-patched

git clone https://aur.archlinux.org/qemu-patched.git
cd qemu-patched
cp $HOME/.rice/vm/PKGBUILD .
makepkg -scfC
sudo pacman -U qemu-patched-x86_64-*
cd ..
rm -rf qemu-patched
