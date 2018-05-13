#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

case $1 in
  load)
    rm -rf work/
    mkdir work/
    cp home/.config/i3/config work/config

    cp work/config work/config_1080p
    patch work/config_1080p patches/1080p/config_i3_config.patch

    cp work/config_1080p work/config_snobo
    patch work/config_snobo patches/snobo/config_i3_config.patch
    rm -f work/*.orig
  ;;
  save)
    if [ -d work/ ]; then
      cp work/config home/.config/i3/config
      diff work/config work/config_1080p > patches/1080p/config_i3_config.patch
      diff work/config_1080p work/config_snobo > patches/snobo/config_i3_config.patch
      rm -rf work/
    else
      echo "ERROR: no files in work directory"
      echo "ERROR: load files before saving"
      echo "USAGE: config_i3_config.sh load"
    fi
  ;;
  *)
    echo "ERROR: unknown or insufficient arguments"
    echo "USAGE: config_i3_config.sh [load/save]"
  ;;
esac


