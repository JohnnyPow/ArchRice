#!/bin/bash
case $1 in
  default)
    cd ~/projects/arch-rice
    scripts/upgrade.sh
    rm -rf ~/.scripts/vm*
  ;;
  desktop)
    cd ~/projects/arch-rice
    scripts/upgrade.sh
    scripts/patch_desktop.sh
  ;;
  snobo)
    cd ~/arch-rice
    scripts/upgrade.sh
    scripts/patch_snobo.sh
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

