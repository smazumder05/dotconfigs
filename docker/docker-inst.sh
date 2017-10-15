#!/bin/bash

sudo apt-get update
sudo apt-get -y install docker.io
sudo ln -sf /usr/bin/docker.io /usr/local/docker
sudo sed -i '$acomplete -F _docker docker' /etc/bash_completion.d/docker.io
# add docker to current user group
sudo usermod -aG docker $(whoami) #logout and try again

sudo docker run -i -t ubuntu /bin/bash
