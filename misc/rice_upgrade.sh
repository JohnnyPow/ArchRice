#!/bin/sh

cd ~/.rice
git pull origin master
git submodule update
git submodule foreach misc/git_pristine.sh
git reset --hard
git clean -df
