#! /bin/bash

printf "Running bootstrap.sh"
apt-get update
apt-get install -y emacs
apt-get install -y tmux
apt-get install -y build-essential
printf "End of bootstrap.sh"
