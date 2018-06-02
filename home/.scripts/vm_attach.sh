#!/bin/bash

source ~/.config/arch_rice_src

if [[ -z $(netstat -tln | grep 127.0.0.1:1234) ]]; then
  echo "VM not running"
  exit
fi

killall synergy synergyc

nc -N 127.0.0.1 1234 << END
device_del usb_kbd
device_del usb_mouse
device_add usb-host,$vm_kbd,id=usb_kbd
device_add usb-host,$vm_mouse,id=usb_mouse
END

synergy &
