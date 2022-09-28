FROM ubuntu:15.04
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y  software-properties-common zip unzip && \
    add-apt-repository ppa:webupd8team/java -y && \
    apt-get update && \
    echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get install -y oracle-java7-installer && \
    apt-get clean
RUN curl -s https://get.sdkman.io | bash && \
 source "~/.sdkman/bin/sdkman-init.sh" && \
 sdk install grails 1.3.8
