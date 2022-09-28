FROM ubuntu:focal

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

ARG ZULU_REPO_VER=1.0.0-3

VOLUME /project/

WORKDIR /project/

RUN apt-get -qq update && \
    apt-get -qq -y --no-install-recommends install gnupg software-properties-common locales curl tzdata && \
    echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xB1998361219BD9C9 && \
    curl -sLO https://cdn.azul.com/zulu/bin/zulu-repo_${ZULU_REPO_VER}_all.deb && dpkg -i zulu-repo_${ZULU_REPO_VER}_all.deb && \
    apt-get -qq update && \
    apt-get -qq -y dist-upgrade && \
    mkdir -p /usr/share/man/man1 && \
    echo "Package: zulu7-*\nPin: version 7.0.352-*\nPin-Priority: 1001" > /etc/apt/preferences && \
    apt-get -qq -y --no-install-recommends install zulu7-jdk=7.0.352-* zip unzip && \
    curl -s https://get.sdkman.io | bash && \
    source "~/.sdkman/bin/sdkman-init.sh" && \
    curl -s https://get.sdkman.io | bash && \
    . "/root/.sdkman/bin/sdkman-init.sh" && \
    sdk install grails 1.3.8 && \
    apt-get -qq -y purge gnupg software-properties-common curl zip unzip && \
    apt -y autoremove && \
    rm -rf /var/lib/apt/lists/* zulu-repo_${ZULU_REPO_VER}_all.deb

ENV JAVA_HOME=/usr/lib/jvm/zulu7-ca-amd64
ENTRYPOINT ['grails', 'prod-war']
