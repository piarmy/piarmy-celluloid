#!/bin/bash

echo "Starting service: Redis Server"
sudo service redis-server start

echo "Running: ruby /home/docker/celluloid/itchy.rb"
ruby /home/docker/celluloid/itchy.rb