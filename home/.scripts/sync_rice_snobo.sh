#!/bin/bash
cd ~/arch-rice

git pull
scripts/sync.sh
scripts/patch_1080p.sh
scripts/patch_de.sh
scripts/patch_snobo.sh

cp ~/.scripts/keyboard.xml.snobo ~/.scripts/keyboard.xml
cp ~/.scripts/mouse.xml.snobo ~/.scripts/mouse.xml
