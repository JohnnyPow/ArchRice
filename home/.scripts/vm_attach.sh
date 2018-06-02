#!/bin/bash

if [[ -z $(netstat -tln | grep 127.0.0.1:1234) ]]; then
  echo "VM not running"
  exit
fi

killall synergy synergyc

nc -N 127.0.0.1 1234 << END
device_del usb_kbd
device_del usb_mouse
device_add usb-host,vendorid=0x1038,productid=0x1607,id=usb_kbd
device_add usb-host,vendorid=0x1e7d,productid=0x2e24,id=usb_mouse
END

synergy &
