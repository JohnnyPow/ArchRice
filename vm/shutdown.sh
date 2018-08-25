#!/bin/sh

if [[ -z $(netstat -tln | grep 127.0.0.1:1234) ]]; then
  echo "VM not running"
  exit
fi

twmnc -t "Win10-VM" -c "shutting down"

killall looking-glass-client
killall synergy synergyc

nc -N 127.0.0.1 1234 << END
device_del usb_kbd
device_del usb_mouse
system_powerdown
END

~/.rice/vm/setkb.sh
