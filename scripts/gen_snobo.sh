#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

cp home/.config/i3/config config.tmp
patch config.tmp patches/1080p/config_i3_config.patch
diff config.tmp ~/.config/i3/config > patches/snobo/config_i3_config.patch
rm config.tmp
