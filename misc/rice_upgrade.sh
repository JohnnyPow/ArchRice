#!/bin/sh

cd ~/.rice
git pull origin master
git reset --hard
git clean -df
