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
#Remove libre-office and its components
sudo apt-get remove --purge libreoffice*
sudo apt-get clean
sudo apt-get autoremove
#Remove all fonts used by Libre
sudo apt-get remove fonts-opensymbol libreoffice libreoffice-\* openoffice.org-dtd-officedocument1.0 python\*-uno uno-libs3-\* ure ure-dbg
