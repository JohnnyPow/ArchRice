#!/bin/bash
case $1 in
  shutdown)
    sudo umount /mnt/*
    sudo shutdown -h now
  ;;
  reboot)
    sudo umount /mnt/*
    sudo reboot
  ;;
  exit)
    i3-msg exit
  ;;
esac
