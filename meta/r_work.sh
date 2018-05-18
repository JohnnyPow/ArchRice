#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

pattern="[./]"
flnm=${2//$pattern/_}
if [[ $flnm == _* ]]; then
  flnm=${flnm/_/}
fi
name=${2##*/} 

function ld {
  rm -rf work/
  mkdir work/
  cp home/$1 work/$name

  cp work/$name work/${name}_desktop
  patch work/${name}_desktop patches/desktop/$flnm.patch

  cp work/$name work/${name}_snobo
  patch work/${name}_snobo patches/snobo/$flnm.patch
  rm -f work/*.orig
}

function sv {
  if [ -d work/ ]; then
    cp work/$name home/$1
    diff work/$name work/${name}_desktop > patches/desktop/$flnm.patch
    diff work/$name work/${name}_snobo > patches/snobo/$flnm.patch
    rm -rf work/
  else
    echo "ERROR: no files in work directory"
    echo "ERROR: load files before saving"
    echo "USAGE: config_i3_config.sh load"
  fi
}

case $1 in
  load)
    ld $2
  ;;
  save)
    sv $2
  ;;
  *)
    echo "ERROR: unknown or insufficient arguments"
    echo "USAGE: config_i3_config.sh [load/save]"
  ;;
esac


