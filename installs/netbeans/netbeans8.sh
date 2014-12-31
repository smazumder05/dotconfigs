#!/usr/bin/env bash
#
# Bash provisioning base script for my laptop.
#
# The base script will install the following libs
#
# 1) Netbeans 8.1
#
# Note: use sudo update-alternatives --config java 
# in order to switch between multiple jdk versions
#
# Copyright@2014 smtechnocrat
# Author: smtechnocrat
# Send questions to smtechnocrat@gmail.com
################################################################## 
wget http://download.netbeans.org/netbeans/8.0/final/bundles/netbeans-8.0-javaee-linux.sh
chmod +x netbeans-8.0-javaee-linux.sh
sudo bash netbeans-8.0-javaee-linux.sh --silent --state state.xml

