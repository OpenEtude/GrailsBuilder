FROM ubuntu:bionic

RUN apt-get update -y && apt-get install -qq -y curl unzip zip \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists
RUN /bin/bash -c "curl -s \"https://get.sdkman.io?rcupdate=false\" | bash && source \"/root/.sdkman/bin/sdkman-init.sh\" && sdk install java 7.0.352-zulu && sdk install grails 1.3.8"
ENV JAVA_OPTS="-Dhttps.protocols=TLSv1.2 -Dorg.quartz.properties=classpath:quartz.properties -Dserver.tomcat.uri-encoding=utf-8 -Dstringchararrayaccessor.disabled=true -Djava.awt.headless=true -Duser.language=fr -Duser.country=FR -Dsqlfile.charset=UTF-8 -Dfile.encoding=UTF-8 -Duser.timezone=Etc/GMT-1 -server -Xms512m -XX:PermSize=128m -Xmx512m -XX:MaxPermSize=128m -Djava.net.preferIPv4Stack=true -Dsun.net.inetaddr.ttl=30 -noverify -Xshare:off -XX:+UseParallelGC"
ENV PATH="$PATH:/root/.sdkman/candidates/grails/current/bin/:/root/.sdkman/candidates/java/current/bin/"
ENV JAVA_HOME="/root/.sdkman/candidates/java/current/"
ENV GRAILS_HOME="/root/.sdkman/candidates/grails/current/"
VOLUME /project/
VOLUME /root/.grails/
VOLUME /root/.ivy2/
WORKDIR /project/
CMD grails prod-war
