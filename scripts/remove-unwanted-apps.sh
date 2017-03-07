#!/usr/bin/env bash
#
# Bash provisioning base script for my laptop.
#
# The base script will install the following libs
#
# 1) UNINSTALL Libre-Office
#
# Note: use sudo update-alternatives --config java 
# in order to switch between multiple jdk versions
#
# Copyright@2014 smtechnocrat
# Author: smtechnocrat
# Send questions to smtechnocrat@gmail.com
################################################################## 
sudo apt-get remove -y unity-lens-shopping
sudo apt-get remove -y unity-webapps-common
sudo apt-get autoremove
