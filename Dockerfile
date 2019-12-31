FROM debian:buster-slim
LABEL maintainer Leandro Moreira <leandro@leandromoreirati.com.br>

ARG  DEBIAN_VERSION=busteh
ARG  KEY=ABF5BD827BD9BF62

WORKDIR /opt/

RUN echo "deb http://deb.debian.org/debian buster non-free" >> /etc/apt/sources.list && \
    mkdir -p /usr/share/man/man1 && \
    apt-get update -y && \
    apt-get dist-upgrade -y && \
    apt-get install -y libasound2 libasound2-data git zip unzip bzip2 unrar-free curl wget && \
    wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" https://download.oracle.com/otn-pub/java/jdk/11.0.5+10/e51269e04165492b90fa15af5b4eb1a5/jdk-11.0.5_linux-x64_bin.deb && \
    dpkg -i jdk-11.0.5_linux-x64_bin.deb && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /etc/apache2/sites-enabled/* && \
    rm -rf /tmp/* 

ENV JAVA_HOME=/usr/lib/jvm/jdk-11.0.5