#!/bin/bash
if [[ $(netstat -lnt | grep 127.0.0.1:1234) ]]; then
  ~/.scripts/vm_shutdown.sh
  retries=0
  while [[ $(netstat -lnt | grep 127.0.0.1:1234) ]]; do
    sleep 1
    ((retries++))
    if [ $retries -eq 5 ]; then
      ~/.scripts/vm_shutdown.sh
      retries=0
    fi
  done
fi
