#!/bin/bash
diff home/USERNAME/.config/i3/config ~/.config/i3/config > 1080p/config_i3_config.patch
diff home/USERNAME/.config/polybar/config ~/.config/polybar/config > 1080p/config_polybar_config.patch
diff home/USERNAME/.Xresources ~/.Xresources > 1080p/Xresources.patch
