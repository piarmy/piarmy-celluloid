#!/bin/bash

echo "Starting service: Redis Server"
sudo service redis-server start

tail -f /dev/null

#echo "Running: ruby /home/docker/celluloid/itchy.rb"
#ruby /home/docker/celluloid/itchy.rb