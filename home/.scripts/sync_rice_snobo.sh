#!/bin/bash
cd ~/arch-rice

git pull
scripts/sync.sh
scripts/patch_1080p.sh
scripts/patch_de.sh
patch ~/.config/i3/config patches/snobo/config_i3_config.patch
