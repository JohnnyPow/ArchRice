#!/bin/bash

reflector -p http -l 20 -f 10 > /etc/pacman.d/mirrorlist
