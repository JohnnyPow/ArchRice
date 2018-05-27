#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

case $1 in
  patch)
    patch ~/build/st/config.h config_h.patch
  ;;
  gen)
    diff ~/build/st/config.h ../../work/config.h > config_h.patch
  ;;
  update)
    cd ~/build/st
    git fetch --all
    git reset --hard origin/patched
  ;;
  *)
  exit
esac
