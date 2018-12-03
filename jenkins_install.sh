#!/bin/bash
#This script will install Java which is required for Jenkins installation.  

sudo apt-get update
sudo apt-get install -y default-jdk
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
sudo apt-get install -y oracle-java8-installer

sudo wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install -y jenkins

sudo sed -i -e '$i jenkins ALL=(ALL) NOPASSWD: ALL \n' /etc/sudoers

echo Jenkins Initial Admin password:
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

