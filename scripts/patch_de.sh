#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

patch ~/.scripts/setkb.sh patches/de/setkb.patch
