#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/../patches/desktop

patch ~/.config/i3/config config_i3_config.patch
patch ~/.config/polybar/config config_polybar_config.patch
patch ~/.scripts/sys_exit.sh scripts_sys_exit_sh.patch
patch ~/.scripts/sys_setkb.sh scripts_sys_setkb_sh.patch
patch ~/.Xresources Xresources.patch
