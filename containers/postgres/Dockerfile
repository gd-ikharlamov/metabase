FROM docker.io/centos:7
LABEL maintainer="Ilya Kharlamov <ikharlamov@griddynamics.com>" \
      description="Centos7 image with postgres"
COPY files/start-postgres.sh /opt/
ENV POSTGRES_VERSION=9.6
ARG POSTGRES_URL=https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-7-x86_64/pgdg-centos96-9.6-3.noarch.rpm
RUN yum install -y $POSTGRES_URL && \
    yum update -y && \
    yum install -y postgresql${POSTGRES_VERSION//.}-server postgresql${POSTGRES_VERSION//.} && \
    yum clean all && \
    sed "s/systemctl show/systemctl cat/g" -i /usr/pgsql-$POSTGRES_VERSION/bin/postgresql${POSTGRES_VERSION//.}-setup && \
    chmod +x /opt/start-postgres.sh
ENTRYPOINT ["/opt/start-postgres.sh"]
