#!/bin/bash

sudo apt-get update
sudo apt-get -y install docker.io
sudo ln -sf /usr/bin/docker.io /usr/local/docker
sudo sed -i '$acomplete -F _docker docker' /etc/bash_completion.d/docker.io
sudo docker run -i -t ubuntu /bin/bash
