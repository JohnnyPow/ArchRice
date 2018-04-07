#!/bin/bash
patch --no-backup-if-mismatch ~/.config/i3/config 1080p/config_i3_config.patch
patch ~/.config/polybar/config 1080p/config_polybar_config.patch
patch ~/.Xresources 1080p/Xresources.patch
