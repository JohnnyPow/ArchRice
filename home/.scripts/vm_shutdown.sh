#!/bin/bash
nc 127.0.0.1 1234 << END
device_del usb_kbd
device_del usb_mouse
system_powerdown
END

killall synergy synergyc
