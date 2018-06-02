#!/bin/sh

source ~/.config/arch_rice_src

xrandr --output "$vm_display" --auto --left-of "$second_display"
i3-msg restart
