#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

function gen {
  pattern="[./]"
  flnm=${1//$pattern/_} 
  if [[ $flnm == _* ]]; then
    flnm=${flnm/_/}
  fi
  diff $DIR/../home/$1 ~/$1 > $flnm.patch
echo $flnm.patch
}

function apply {
  pattern="[./]"
  flnm=${1//$pattern/_} 
  if [[ $flnm == _* ]]; then
    flnm=${flnm/_/}
  fi
  patch ~/$1 $flnm.patch
}

case $2 in
  desktop)
    cd patches/desktop
  ;;
  snobo)
    cd patches/snobo
  ;;
  *)
  exit
esac

cmd[0]=.config/i3/config
cmd[1]=.config/polybar/config
cmd[2]=.config/compton.conf
cmd[3]=.scripts/vm_keyboard.xml
cmd[4]=.scripts/vm_mouse.xml
cmd[5]=.scripts/sys_exit.sh
cmd[6]=.scripts/sys_setkb.sh
cmd[7]=.Xresources
cmd[8]=.config/i3blocks/config

for cm in ${cmd[@]}; do
  case $1 in
    gen)
      gen $cm
    ;;
    apply)
      apply $cm
    ;;
    *)
    exit
  esac
done
