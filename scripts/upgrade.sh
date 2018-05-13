#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

meta/g_fetch.sh
rsync -rtvp home/ ~
