#!/bin/sh

source ~/.config/arch_rice_src

xrandr --output $(vm_display) --auto --left-of $(2nd_display)
i3-msg restart
