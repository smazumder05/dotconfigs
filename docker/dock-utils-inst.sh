#!/bin/bash

#install docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

#install dock for docker dev 
sudo mkdir -p ~/bin
sudo curl https://raw.githubusercontent.com/bripkens/dock/master/dock -so ~/bin/dock
sudo chmod +x ~/bin/dock
cd ~/bin/dock -u
echo "dock installation successful. Try running 'dock'"
dock -l
