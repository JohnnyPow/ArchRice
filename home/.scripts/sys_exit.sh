#!/bin/bash
case $1 in
  shutdown)
    sudo umount /mnt/DISKSTATION/*
    sudo shutdown -h now
  ;;
  reboot)
    sudo umount /mnt/DISKSTATION/*
    sudo reboot
  ;;
  exit)
    i3-msg exit
  ;;
esac
