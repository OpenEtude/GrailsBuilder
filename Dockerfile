from ubuntu:20.04
sudo add-apt-repository -y ppa:openjdk-r/ppa  && \
sudo apt-get update -y && \
sudo apt-get install -y openjdk-7-jdk unzip zip && \
  curl -s https://get.sdkman.io | bash && \
  source "~/.sdkman/bin/sdkman-init.sh"
sdk install grails 1.3.8
