#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

patch ~/.config/i3/config patches/snobo/config_i3_config.patch
