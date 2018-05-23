#!/bin/bash

nc -c 127.0.0.1 1234 << END
device_del usb_kbd
device_del usb_mouse
END

nc -c 127.0.0.1 1234 << END
device_add usb-host,vendorid=0x1038,productid=0x1607,id=usb_kbd
device_add usb-host,vendorid=0x1e7d,productid=0x2e24,id=usb_mouse
END
