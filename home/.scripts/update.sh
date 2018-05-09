#!/bin/bash
yay -Pw | tail -n 10
read -r -p "Is it safe to update? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
  yay -Syu --devel --needed
  echo -n "3.."
  sleep 1
  echo -ne "\r2.."
  sleep 1
  echo -ne "\r1.."
  sleep 1
fi
