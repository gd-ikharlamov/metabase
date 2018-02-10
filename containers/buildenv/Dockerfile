FROM docker.io/centos:7
LABEL maintainer="Ilya Kharlamov <ikharlamov@griddynamics.com>" \
      description="Build image for pmo metabase"
RUN yum groupinstall -y 'Development Tools' && \
    yum install -y https://rpm.nodesource.com/pub_8.x/el/7/x86_64/nodesource-release-el7-1.noarch.rpm && \
    yum install -y java-1.8.0-openjdk-devel nodejs && \
    yum clean all && \
    npm install -g yarn && \
    curl -L "https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein" -o /usr/bin/lein && \
    chmod +x /usr/bin/lein && \
    /usr/bin/lein
