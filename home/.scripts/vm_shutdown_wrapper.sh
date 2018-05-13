#!/bin/bash
if [[ $(sudo virsh list --state-running | head -n 3 | tail -n 1) ]]; then
  ~/.scripts/vm_shutdown.sh
  retries=0
  while [[ $(sudo virsh list --state-running | head -n 3 | tail -n 1) ]]; do
    sleep 1
    ((retries++))
    if [ $retries -eq 5 ]; then
      sudo virsh shutdown win10
      retries=0
    fi
  done
fi
