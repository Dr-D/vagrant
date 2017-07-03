#! /bin/bash

printf "Running bootstrap.sh"
apt-get update
apt-get install -y emacs
apt-get install -y tmux

#install docker
apt-get install -y apt-transport-https
apt-get install -y ca-certificates
apt-get install -y curl
apt-get install -y software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository  "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update

sudo apt-get install -y docker-ce

#add user
useradd -p $(openssl passwd -1 password) drd
usermod -aG sudo drd
usermod -aG docker drd

#Remove hosts option from docker service
sudo cp /lib/systemd/system/docker.service /lib/systemd/system/docker.service.orig
sudo sed -i 's/\ -H\ fd:\/\///g' /lib/systemd/system/docker.service
sudo systemctl daemon-reload

#Copy daemon.json file and restart dockerd
sudo cp /vagrant/daemon.json /etc/docker/daemon.json
sudo service docker restart

printf "End of bootstrap.sh"
