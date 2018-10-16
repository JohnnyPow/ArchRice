#!/bin/bash
case $1 in
  shutdown)
    sudo umount -f /mnt/*
    sudo shutdown -h now
  ;;
  reboot)
    sudo umount -f /mnt/*
    sudo reboot
  ;;
  exit)
    i3-msg exit
  ;;
esac
