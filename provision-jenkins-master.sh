#!/bin/bash

echo "running jenkins-master provisioning.."

# install git maven
sudo apt-get install -y git maven

if [ ! -f /swapfile ]; then
  # add swapfile
  sudo dd if=/dev/zero of=/swapfile bs=2048k count=1000
  sudo mkswap /swapfile
  sudo swapon /swapfile
  sudo swapon -s
  sudo chown root:root /swapfile
  sudo chmod 0600 /swapfile
  sudo echo "/swapfile       none    swap    sw      0       0" >> /etc/fstab
fi

if [ ! -f /etc/init.d/jenkins ]; then
  # install jenkins
  wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
  sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
  sudo apt-get update
  sudo apt-get -y install jenkins
  sudo update-rc.d jenkins defaults
  sudo service jenkins start
fi
