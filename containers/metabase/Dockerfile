FROM docker.io/centos:7
LABEL maintainer="Ilya Kharlamov <ikharlamov@griddynamics.com>" \
      description="Build image for pmo metabase"
RUN yum install -y java-1.8.0-openjdk-headless && \
    yum clean all && \
    useradd -d /opt/metabase/ metabase
    # &&\
    # chown -R metabase:metabase /opt/metabase
COPY files/ /
RUN chown -R metabase:metabase /opt/metabase && \
    chmod +x /opt/metabase/run.sh
USER metabase
ENTRYPOINT ["/opt/metabase/run.sh"]
