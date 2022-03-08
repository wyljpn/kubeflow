# Yulong
FROM klstg-docker.slb-wartifactory-v.stg.rmn.local/rakuten/rflow/live-code-vs-code-python:0.0.1

#!/bin/bash
USER root

RUN export http_proxy=http://[240b:c0e0:101:5476:1c01:2::a]:3128

RUN export https_proxy=http://[240b:c0e0:101:5476:1c01:2::a]:3128

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