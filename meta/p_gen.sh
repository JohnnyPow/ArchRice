#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

case $1 in
  desktop)
    cd patches/desktop
  ;;
  snobo)
    cd patches/snobo
  ;;
  *)
  exit
esac

function diff {
  pattern="[./]"
  flnm=${1//$pattern/_} 
  if [[ $flnm == _* ]]; then
    flnm=${flnm/_/}
  fi
  diff $DIR/../home/$1 ~/$1 > $flnm
}

diff .config/i3/config
diff .config/polybar/config
diff .config/compton.conf
diff .scripts/vm_keyboard.xml
diff .scripts/vm_mouse.xml
diff .scripts/sys_exit.sh
diff .scripts/sys_setkb.sh
diff .Xresources
