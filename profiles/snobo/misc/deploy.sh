#!/bin/sh

source ~/.rice/misc/deploy.sh
source ~/.rice/profiles/desktop/misc/deploy.sh
PROFILE_PATH='../profiles/snobo/home'

deploy_file $PROFILE_PATH/config/i3/config .config/i3/config

