#!/bin/bash
case $1 in
  shutdown)
    sudo umount -l /mnt/*
    sudo shutdown -h now
  ;;
  reboot)
    sudo umount -l /mnt/*
    sudo reboot
  ;;
  exit)
    i3-msg exit
  ;;
esac
