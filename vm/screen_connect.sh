#!/bin/sh

source ~/.rice/vm/constants

xrandr --output "$vm_display" --auto --left-of "$second_display"
i3-msg restart
