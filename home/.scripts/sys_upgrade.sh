#!/bin/bash

function upgrade {
  yay -Syu --devel --needed --sudoloop --answerupgrade " " --answerclean All --answeredit None
}

news=$(yay -Pw)
if [[ -n "$(echo $news)" ]]; then
  echo $news
  read -r -p "Is it safe to update? [y/N] " response
  if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]; then
    upgrade
  fi
else
  upgrade
fi
$SHELL
