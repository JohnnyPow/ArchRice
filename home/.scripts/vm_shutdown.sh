#!/bin/bash
sudo virsh detach-device win10 ~/.scripts/vm_keyboard.xml
sudo virsh detach-device win10 ~/.scripts/vm_mouse.xml
sudo virsh shutdown win10
killall synergy synergyc
