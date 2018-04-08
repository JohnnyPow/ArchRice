#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

diff home/.config/i3/config ~/.config/i3/config > patches/1080p/config_i3_config.patch
diff home/.config/polybar/config ~/.config/polybar/config > patches/1080p/config_polybar_config.patch
diff home/.Xresources ~/.Xresources > patches/1080p/Xresources.patch
