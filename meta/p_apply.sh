#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/../patches

case $1 in
  desktop)
    cd desktop
  ;;
  snobo)
    cd snobo
  ;;
  *)
  exit
esac

patch ~/.config/i3/config config_i3_config.patch
patch ~/.config/polybar/config config_polybar_config.patch
patch ~/.config/compton.conf config_compton_conf.patch
patch ~/.scripts/sys_exit.sh scripts_sys_exit_sh.patch
patch ~/.scripts/sys_setkb.sh scripts_sys_setkb_sh.patch
patch ~/.scripts/vm_keyboard.xml scripts_vm_keyboard_xml.patch
patch ~/.scripts/vm_mouse.xml scripts_vm_mouse_xml.patch
patch ~/.Xresources Xresources.patch
