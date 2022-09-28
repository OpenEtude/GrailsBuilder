from ubuntu:16.04
RUN apt update -y
RUN apt-get install -y software-properties-common unzip zip
RUN add-apt-repository -y ppa:openjdk/ppa
RUN apt update -y
RUN apt-get install -y openjdk-7
RUN curl -s https://get.sdkman.io | bash
RUN source "~/.sdkman/bin/sdkman-init.sh"
RUN sdk install grails 1.3.8
