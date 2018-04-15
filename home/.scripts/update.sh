#!/bin/bash
sudo reflector -p https -l 10 --sort rate --save /etc/pacman.d/mirrorlist --verbose
aurman -Syu --devel --needed --noedit
