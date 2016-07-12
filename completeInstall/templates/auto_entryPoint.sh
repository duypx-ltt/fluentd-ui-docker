#!/bin/bash
set -x
echo "Image ENTRYPOINT executing in `pwd` with arguments $*"

#Run command passed as argument (Else CMD gets executed, and persisted on commit)
#Starting after bash login so rvm gets initialized

sudo -E -u td-agent /opt/td-agent/embedded/bin/ruby /usr/sbin/td-agent --log /var/log/td-agent/td-agent.log --daemon /var/run/td-agent/td-agent.pid

cd /opt/build/fluentd-ui #fluend-ui command works only if run from this folder
bash -l -c "$*"
