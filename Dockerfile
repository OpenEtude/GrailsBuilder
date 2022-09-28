from ubuntu:20.04
RUN apt update -y
RUN apt-get install -y software-properties-common unzip zip
RUN apt update -y
RUN add-apt-repository -y ppa:openjdk-r/ppa
RUN apt-get install -y openjdk-7-jdk
RUN curl -s https://get.sdkman.io | bash
RUN source "~/.sdkman/bin/sdkman-init.sh"
RUN sdk install grails 1.3.8
