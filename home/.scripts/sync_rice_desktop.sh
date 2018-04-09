#!/bin/bash
cd ~/projects/arch-rice

git pull
scripts/sync.sh
scripts/patch_1080p.sh
scripts/patch_de.sh
scripts/patch_vivaldi.sh
