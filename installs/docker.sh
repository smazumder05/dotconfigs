#!/usr/bin/env bash
# 
# Bash provisioning base script for my laptop.
# 
# The base script will install the following libs
#
# 1) The latest version of docker - should lock dowm a version
#
# Copyright@2014 smtechnocrat
# Author: smtechnocrat
# Send questions to smtechnocrat@gmail.com
################################################################## 
sudo sh -c "echo deb https://get.docker.com/ubuntu docker main\
> /etc/apt/sources.list.d/docker.list"
sudo apt-get update
sudo apt-get install lxc-docker
