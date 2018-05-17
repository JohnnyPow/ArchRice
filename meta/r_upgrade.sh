#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

rm -rf ~/.scripts/*
meta/g_fetch.sh
rsync -rtvp home/ ~
