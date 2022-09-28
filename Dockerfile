from openjdk:7-jdk
sudo apt install -y unzip zip && \
  curl -s https://get.sdkman.io | bash && \
  source "~/.sdkman/bin/sdkman-init.sh"
sdk install grails 1.3.8
