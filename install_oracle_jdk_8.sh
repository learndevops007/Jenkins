#!/bin/bash

# install oracle jdk 8
if [ ! `which java` ]; then
  sudo mkdir -p /opt/java
  cd /opt/java
  wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u45-b13/jdk-8u45-linux-x64.tar.gz
  sudo tar -zxvf jdk-8u45-linux-x64.tar.gz
  cd jdk1.8.0_45/
  sudo update-alternatives --install /usr/bin/java java /opt/java/jdk1.8.0_45/bin/java 100
  sudo update-alternatives --config java
  sudo update-alternatives --install /usr/bin/javac javac /opt/java/jdk1.8.0_45/bin/javac 100
  sudo update-alternatives --config javac
  sudo update-alternatives --install /usr/bin/jar jar /opt/java/jdk1.8.0_45/bin/jar 100
  sudo update-alternatives --config jar
fi
