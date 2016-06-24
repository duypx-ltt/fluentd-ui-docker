FROM ruby:2.3

RUN gem install fluentd --no-ri --no-rdoc
RUN gem install -V fluentd-ui
RUN fluent-gem install fluent-plugin-influxdb

CMD "fluentd-ui start"
