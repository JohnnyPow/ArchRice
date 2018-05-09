#!/bin/bash
cd ~/projects/arch-rice

git fetch --all
git reset --hard origin/master
scripts/sync.sh
scripts/patch_1080p.sh
scripts/patch_de.sh
