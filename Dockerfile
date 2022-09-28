from ubuntu:20.04
apt-get install -y software-properties-common unzip zip && \
  apt-get update -y && \
  add-apt-repository -y ppa:openjdk-r/ppa  && \
  apt-get install -y openjdk-7-jdk && \
  curl -s https://get.sdkman.io | bash && \
  source "~/.sdkman/bin/sdkman-init.sh"
sdk install grails 1.3.8
