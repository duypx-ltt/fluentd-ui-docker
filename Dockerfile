FROM ruby:2.2

RUN gem install fluentd --no-ri --no-rdoc
RUN gem install -V fluentd-ui
RUN fluent-gem install fluent-plugin-influxdb

EXPOSE 9292 24224 24230
CMD ["fluentd-ui", "start"]
