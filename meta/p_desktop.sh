#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

diff home/.config/i3/config ~/.config/i3/config > patches/desktop/config_i3_config.patch
diff home/.config/polybar/config ~/.config/polybar/config > patches/desktop/config_polybar_config.patch
diff home/.scripts/sys_exit.sh ~/.scripts/sys_exit.sh > patches/desktop/scripts_sys_exit_sh.patch
diff home/.scripts/sys_setkb.sh ~/.scripts/sys_setkb.sh > patches/desktop/scripts_sys_setkb_sh.patch
diff home/.Xresources ~/.Xresources > patches/desktop/Xresources.patch
