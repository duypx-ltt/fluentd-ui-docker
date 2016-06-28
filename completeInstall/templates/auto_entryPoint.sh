#!/bin/bash
set -x
echo "Image ENTRYPOINT executing in `pwd` with arguments $*"

source /usr/local/rvm/scripts/rvm
rvm use 2.3

#Run command passed as argument (Else CMD gets executed, and persisted on commit)
sh -c "$*"
