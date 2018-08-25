#!/bin/sh

source ~/.rice/misc/deploy.sh
PROFILE_PATH='../profiles/desktop/home'

deploy_file $PROFILE_PATH/config/i3/config .config/i3/config
deploy_file $PROFILE_PATH/config/compton.conf .config/compton.conf
deploy_file $PROFILE_PATH/Xresources .Xresources

