# Ubuntu server with docker-ce

Used this to create worker nodes in a docker swarm, but can just be used to practice using docker in a virtual machine.

Requires at least 16:04 ubuntu server.  
Installs docker-ce. 
Add user dr-d with password, and adds to docker group.  

Copies the docker.service file, then removes the host options so that a daemon.json file can be used.  
Adds the daemon.json file and restarts docker engine.
