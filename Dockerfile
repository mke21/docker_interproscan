# Dockerfile for interproscan
#

FROM ubuntu:12.04

MAINTAINER Marcel Kerkveld mke21@live.nl

# update packages
RUN apt-get -y update
RUN apt-get -y upgrade

# Install Oracle Java 7
RUN apt-get -y install python-software-properties
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get -y update
RUN echo "oracle-java7-installer  shared/accepted-oracle-license-v1-1 boolean true" | debconf-set-selections
RUN apt-get -y install oracle-java7-installer
RUN apt-get -y install ncoils

# perl libs
RUN apt-get -y install perl-modules

RUN mkdir /inter
WORKDIR /inter
RUN wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/5.11-51.0/interproscan-5.11-51.0-64-bit.tar.gz
RUN tar -pxvzf interproscan-5.11-51.0-*-bit.tar.gz
WORKDIR /inter/interproscan-5.11-51.0
ENV JAVA_HOME=/usr/lib/jvm/java-7-oracle/
ENV CLASSPATH=$CLASSPATH:/usr/lib/jvm/java-7-oracle/bin

# change path to ncoils
RUN sed -i 's/binary\.coils\.path\=bin\/coils\/ncoils/binary\.coils\.path\=\/usr\/bin\/ncoils/g' interproscan.properties
