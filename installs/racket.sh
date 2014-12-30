#!/usr/bin/env bash
#
# Bash provisioning base script for my laptop.
#
# The base script will install the following libs
#
# 1)DrRacket 6.1.1
#
# Copyright@2014 smtechnocrat
# Author: smtechnocrat
# Send questions to smtechnocrat@gmail.com
################################################################## 
sudo add-apt-repository ppa:plt/racket
sudo apt-get update
sudo apt-get install -y racket
