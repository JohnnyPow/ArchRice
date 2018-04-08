#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

patch ~/.config/i3/config patches/1080p/config_i3_config.patch
patch ~/.config/polybar/config patches/1080p/config_polybar_config.patch
patch ~/.Xresources patches/1080p/Xresources.patch
