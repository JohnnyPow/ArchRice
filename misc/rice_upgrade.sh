#!/bin/sh

cd ~/.rice
git pull origin master
git submodule update
git submodule foreach ~/.rice/misc/git_pristine.sh
git reset --hard
git clean -df
