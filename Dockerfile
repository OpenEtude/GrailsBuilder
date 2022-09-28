# pull base image
FROM azul/zulu-openjdk:7u85
CMD ["java"]
RUN curl -s https://get.sdkman.io | bash && \
 source "~/.sdkman/bin/sdkman-init.sh" && \
 sdk install grails 1.3.8
