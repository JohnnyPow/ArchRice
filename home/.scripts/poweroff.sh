#!/bin/bash

# shutdown VM if necessary
if [[ $(sudo virsh list --state-running | head -n 3 | tail -n 1) ]]; then
  echo "shutting down vm.."
  ~/.scripts/shutdown.sh
  retries=0
  while [[ $(sudo virsh list --state-running | head -n 3 | tail -n 1) ]]; do
    echo "waiting"
    sleep 1
    ((retries++))
    if [ $retries -eq 15 ]; then
      ~/.scripts/shutdown.sh
      retries=0
    fi
  done
fi
echo "powering off.."
sudo shutdown -h now
