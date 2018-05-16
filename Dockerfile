FROM debian:9

MAINTAINER Ipman1971 <ipman1971@gmail.com>

LABEL org.label-schema.schema-version="1.0" \
      org.label-schema.name="debian-zulu" \
      org.label-schema.description="Debian with Azul Zulu JVM" \
      org.label-schema.vcs-url="https://github.com/ipman1971/debian-zulu" \
      org.label-schema.vendor="Ipman1971" \
      org.label-schema.version="1.0.0" \
      com.ipman1971.baseimage-contents='{"contents": [{"name": "debian", "version": "9"}, {"name": "zulu-jvm", "version": "8.30.0.1"}]}'

ENV ZULU_VERSION 8.30.0.1
ENV JAVA_HOME /usr/lib/jvm/zulu-8-amd64

RUN set -x && \
    apt-get -qq update && \
    apt-get -y install gnupg && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0x219BD9C9 && \
    echo "deb http://repos.azulsystems.com/debian stable  main" >> /etc/apt/sources.list.d/zulu.list && \
    apt-get -qq update && \
    apt-get -qqy install zulu-8=${ZULU_VERSION} && \
    apt-get clean -y && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /var/lib/log/* /tmp/* /var/tmp/*
