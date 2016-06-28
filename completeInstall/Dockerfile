FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y git \
      sudo \
      vim \
      bash-completion \
      emacs24-nox \
      byobu \
      net-tools \
      lsof \
      curl \
      make \
      build-essential \
      libssl-dev \
      libxml2-dev \
      libxslt1-dev

RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
RUN /bin/bash -l -c "curl -L get.rvm.io | bash -s stable --rails"
RUN /bin/bash -l -c "rvm install 2.3 2.3-dev"

RUN /bin/bash -l -c "gem install fluentd --no-ri --no-rdoc"
RUN /bin/bash -l -c "fluent-gem install fluent-plugin-influxdb"
RUN /bin/bash -l -c "mkdir -p /opt/build; cd /opt/build && git clone https://github.com/fluent/fluentd-ui && cd fluentd-ui && bundle install"
WORKDIR /opt/build/fluentd-ui/
CMD ["fluentd-ui", "start"]

COPY templates /opt/build_context/templates
ENTRYPOINT ["\/bin\/bash", "\/opt\/build_context\/templates\/auto_entryPoint.sh"]

EXPOSE 9292 24224 24230
