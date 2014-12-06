#!/usr/bin/env bash
# 
# Bash provisioning base script for my laptop.
# 
# The base script will install the following libs
#
#  1) vim-gtk. ack-grep (see ack for more details)
#  2) git
#  3) tmux
#  4) download and install dotfiles from my github repository
#  5) download and install maintainence scripts from github
#  6) installs basic monitoring tools. (see dotfiles repository)
#  7) docker will be installed
#
# Copyright@2014 smtechnocrat
# Author: smtechnocrat
# Send questions to smtechnocrat@gmail.com
################################################################## 

echo ">>> Installing base packages..."

github_url="https://raw.githubusercontent.com/smazumder05/dotconfigs/master"
echo $github_url

#update
sudo apt-get update

# Install base packages
# -qq implies -y --force-yes
sudo apt-get install -qq curl unzip git ack-grep software-properties-common build-essential python-dev

# Common fixes for git
git config --global http.postBuffer 65536000

# Cache http credentials for one day while pull/push
git config --global credential.helper 'cache --timeout=86400'

#Install tmux and vim
sudo apt-get install -y tmux vim-gtk

#install system monitoring tools
sudo apt-get install -y sysstat

#Download and install scripts
echo ">>> Downloading and installing scripts..."
mkdir -f /home/vagrant/scripts
curl --silent -L $github_url/bash/bashrc > /home/vagrant/.bashrc
curl --silent -L $github_url/bash/tmux.sh > /home/vagrant/scripts/tmux.sh
#Download gitconfig and gitignore
curl --silent -L $github_url/git/gitconfig  > /home/vagrant/.gitconfig
curl --silent -L $github_url/git/gitconfig  > /home/vagrant/.gitignore
#Tmux conf
curl --silent -L $github_url/tmux/tmux.conf > /home/vagrant/.tmux.conf
#vimrc
curl --silent -L $github_url/vim/vimrc > /home/vagrant/.vimrc


#Install network monitoring tools (ntop listens on eth0 admin/admin requires entry)
sudo apt-get install -y htop nload iftop iptraf nethogs bmon slurm tcptrack vnstat bwm-ng cbm speedometer pktstat netdiag ifstat dstat collectl

#Python pip
sudo apt-get install -y python-pip
#install butterfly terminal
#sudo pip install butterfly

if [ ! -f "/home/smdeveloper/scripts/run-butterfly.sh" ]; then
 echo ">>> Creating butterfly run script."; 
 echo "git hub url is:";
 echo $github_url;
fi

#C++ installs
#apt-get -y install build-essential
#apt-get -y install synaptic

#Capture output
#bash script.sh 2>&1 | tee script.log
