#!/bin/bash

# shutdown VM if necessary
if [[ $(sudo virsh list --state-running | head -n 3 | tail -n 1) ]]; then
  ~/.scripts/shutdown.sh
  retries=0
  while [[ $(sudo virsh list --state-running | head -n 3 | tail -n 1) ]]; do
    sleep 1
    ((retries++))
    if [ $retries -eq 10 ]; then
      ~/.scripts/shutdown.sh
      retries=0
    fi
  done
fi
