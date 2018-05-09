#!/bin/bash
cd ~/projects/arch-rice

git fetch --all
git reset --hard origin/master
scripts/sync.sh
