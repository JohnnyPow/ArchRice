#!/bin/bash
~/.scripts/vm_shutdown_wrapper.sh
case $1 in
  shutdown)
    sudo shutdown -h now
  ;;
  reboot)
    sudo reboot
  ;;
  exit)
    i3-msg exit
  ;;
esac
