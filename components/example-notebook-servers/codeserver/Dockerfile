#FROM public.ecr.aws/j1r0q0g6/notebooks/notebook-servers/base:master-6c41e72b
#FROM openjdk:8u131-jdk-alpine

FROM klstg-docker.slb-wartifactory-v.stg.rmn.local/rakuten/rflow/live-code-base:0.1.0

USER root

RUN export http_proxy=http://[240b:c0e0:101:5476:1c01:2::a]:3128

RUN export https_proxy=http://[240b:c0e0:101:5476:1c01:2::a]:3128

# args - software versions
 # renovate: datasource=github-tags depName=cdr/code-server versioning=semver
ARG CODESERVER_VERSION=v3.10.2

# install - code-server
RUN curl -sL "https://github.com/cdr/code-server/releases/download/${CODESERVER_VERSION}/code-server_${CODESERVER_VERSION/v/}_amd64.deb" -o /tmp/code-server.deb \
 && dpkg -i /tmp/code-server.deb \
 && rm -f /tmp/code-server.deb

# s6 - copy scripts
COPY --chown=jovyan:users s6/ /etc

# s6 - 01-copy-tmp-home
RUN mkdir -p /tmp_home \
 && cp -r ${HOME} /tmp_home \
 && chown -R ${NB_USER}:users /tmp_home

USER $NB_UID

EXPOSE 8888

ENTRYPOINT ["/init"]

# Yulong 2022.3.7
# For installing JDK 1.8

#!/bin/bash
USER root

RUN apt-get update && \
      apt-get -y install sudo

# Install OpenJDK-8
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y ant && \
    apt-get clean;

# Fix certificate issues
RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;

# Setup JAVA_HOME -- useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME
