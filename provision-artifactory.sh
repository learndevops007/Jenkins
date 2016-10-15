#!/bin/bash

echo "running artifactory provisioning.."

if [ ! -f /etc/init.d/artifactory ]; then
  # install artifactory
  wget http://mirror.creamostraining.com/artifactory/jfrog-artifactory-oss-4.2.2.deb
  sudo dpkg -i jfrog-artifactory-oss-4.2.2.deb
  sudo update-rc.d artifactory defaults
  sudo service artifactory start
fi
