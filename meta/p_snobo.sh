#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

diff home/.config/i3/config ~/.config/i3/config > patches/snobo/config_i3_config.patch
diff home/.config/polybar/config ~/.config/polybar/config > patches/snobo/config_polybar_config.patch
diff home/.config/compton.conf ~/.config/compton.conf > patches/snobo/config_compton_conf.patch
diff home/.scripts/vm_keyboard.xml ~/.scripts/vm_keyboard.xml > patches/snobo/scripts_vm_keyboard_xml.patch
diff home/.scripts/vm_mouse.xml ~/.scripts/vm_mouse.xml > patches/snobo/scripts_vm_mouse_xml.patch
diff home/.scripts/sys_exit.sh ~/.scripts/sys_exit.sh > patches/snobo/scripts_sys_exit_sh.patch
diff home/.scripts/sys_setkb.sh ~/.scripts/sys_setkb.sh > patches/snobo/scripts_sys_setkb_sh.patch
diff home/.Xresources ~/.Xresources > patches/snobo/Xresources.patch
