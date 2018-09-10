#!/bin/sh

cd ~/.rice
git pull origin master
git submodule update
git reset --hard
git clean -df
