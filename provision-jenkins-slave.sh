#!/bin/bash

echo "running jenkins-slave provisioning.."

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

if [ ! -d /var/lib/jenkins ]; then
  mkdir -p /var/lib/jenkins
  sudo chown vagrant:vagrant /var/lib/jenkins
  sudo chmod 775 /var/lib/jenkins
fi
