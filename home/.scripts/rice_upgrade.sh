#!/bin/bash

source ~/.config/arch_rice_src
cd $rice_home

function upgrade {
  case $1 in
    default)
      meta/r_upgrade.sh
      rm -rf ~/.scripts/vm*
      rm -rf ~/.vfio
      cp misc/arch_rice_src ~/.config/arch_rice_src
    ;;
    desktop)
      meta/r_upgrade.sh
      meta/r_patch.sh apply desktop
      cp misc/arch_rice_src_desktop ~/.config/arch_rice_src
    ;;
    snobo)
      meta/r_upgrade.sh
      meta/r_patch.sh apply snobo
      cp misc/arch_rice_src_snobo ~/.config/arch_rice_src
    ;;
    *)
      echo "ERROR: unknown or insufficient arguments"
      echo "USAGE: rice_upgrade.sh [patch set]"
      echo "USAGE: Available patch sets:"
      echo "USAGE: <default>: single 4k screen, eu keyboard layout"
      echo "USAGE: <desktop>: dual-screen 1080p, de keyboard layout"
      echo "USAGE: <snobo>: dual-screen 1080p, de keyboard layout"
    ;;
  esac
}

echo "fetching changes.."
git fetch --all > /dev/null
git log master..origin/master --pretty='tformat:%an, %ar: "%s"' | cat

read -r -p "Do you want to update? [y/N]" response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]; then
  upgrade $1
fi
