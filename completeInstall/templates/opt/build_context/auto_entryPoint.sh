#!/bin/bash
set -x
echo "Image ENTRYPOINT executing in `pwd` with arguments $*"

#Run command passed as argument (Else CMD gets executed, and persisted on commit)
#Starting after bash login so rvm gets initialized

bash -l -c "ruby /usr/local/rvm/gems/ruby-2.3.0/bin/fluentd -c /root/.fluentd-ui/fluent.conf -d /root/.fluentd-ui/fluent.pid -o /root/.fluentd-ui/fluent.log"

cd /opt/build/fluentd-ui #fluend-ui command works only if run from this folder
bash -l -c "$*"
