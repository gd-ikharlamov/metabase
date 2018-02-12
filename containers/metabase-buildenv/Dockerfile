FROM docker.io/centos:7
LABEL maintainer="Ilya Kharlamov <ikharlamov@griddynamics.com>" \
      description="Build image for pmo metabase"
ARG LEIN_VERSION=2.8.1
ARG LEIN_BIN_URL=https://raw.githubusercontent.com/technomancy/leiningen/$LEIN_VERSION/bin/lein-pkg
ARG LEIN_JAR_URL=https://github.com/technomancy/leiningen/releases/download/$LEIN_VERSION/leiningen-$LEIN_VERSION-standalone.zip
RUN yum groupinstall -y 'Development Tools' && \
    yum install -y https://rpm.nodesource.com/pub_8.x/el/7/x86_64/nodesource-release-el7-1.noarch.rpm && \
    yum install -y java-1.8.0-openjdk-devel nodejs && \
    yum clean all && \
    npm install -g yarn && \
    curl -L "$LEIN_BIN_URL" -o /usr/bin/lein && \
    curl -L "$LEIN_JAR_URL" -o /usr/share/java/leiningen-$LEIN_VERSION-standalone.jar && \
    chmod +x /usr/bin/lein
