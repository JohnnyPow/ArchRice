#!/bin/sh

if [[ $(netstat -tln | grep 127.0.0.1:1234) ]]; then
  ~/.rice/vm/shutdown.sh
  retries=0
  while [[ $(netstat -tln | grep 127.0.0.1:1234) ]]; do
    sleep 1
    ((retries++))
    if [ $retries -eq 5 ]; then
      ~/.rice/vm/shutdown.sh
      retries=0
    fi
  done
fi
