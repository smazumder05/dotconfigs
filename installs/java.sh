#!/usr/bin/env bash
#
# Bash provisioning base script for my laptop.
#
# The base script will install the following libs
#
# 1) oracle java-7
#
# Copyright@2014 smtechnocrat
# Author: smtechnocrat
# Send questions to smtechnocrat@gmail.com
################################################################## 
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-get -y install oracle-java7-installer
