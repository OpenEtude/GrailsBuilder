from ubuntu:20.04
RUN sudo apt-get install -y software-properties-common unzip zip
RUN sudo apt-get update -y
RUN sudo add-apt-repository -y ppa:openjdk-r/ppa
RUN sudo apt-get install -y openjdk-7-jdk
RUN curl -s https://get.sdkman.io | bash
RUN source "~/.sdkman/bin/sdkman-init.sh"
RUN sdk install grails 1.3.8
