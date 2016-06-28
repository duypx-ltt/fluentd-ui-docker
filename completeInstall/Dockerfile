FROM ubuntu:14.04

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

#Install td-agent from deb
RUN curl -L https://toolbelt.treasuredata.com/sh/install-ubuntu-trusty-td-agent2.sh | sh

#Install fluend-ui from source
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
RUN /bin/bash -l -c "curl -L get.rvm.io | bash -s stable --rails"
RUN /bin/bash -l -c "rvm install 2.3 2.3-dev"
RUN /bin/bash -l -c "mkdir -p /opt/build; cd /opt/build && git clone https://github.com/fluent/fluentd-ui && cd fluentd-ui && bundle install"

COPY templates /

ENTRYPOINT ["\/bin\/bash", "\/opt\/build_context\/templates\/auto_entryPoint.sh"]
CMD ["fluentd-ui", "start"]

EXPOSE 9292 24224 24230
