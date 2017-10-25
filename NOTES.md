### Run

# Build
clear && \
  cd /home/pi/images/piarmy-celluloid && \
  docker build -t mattwiater/piarmy-celluloid . && \
  docker push mattwiater/piarmy-celluloid

# Interactive
docker run -it --rm --name=piarmy-celluloid mattwiater/piarmy-celluloid /bin/bash

# Detached
docker run -d --rm --name=piarmy-celluloid mattwiater/piarmy-celluloid

# Enter running container
docker exec -it $(docker ps | grep piarmy-celluloid | awk '{print $1}') /bin/bash

# Testing
docker run -d --rm --name=piarmy-celluloid mattwiater/piarmy-celluloid && \
  docker logs -f $(docker ps | grep piarmy-celluloid | awk '{print $1}')

# Remove
docker rm --force $(docker ps | grep piarmy-celluloid | awk '{print $1}')

# service
clear && \
  docker service create \
    --name=piarmy-celluloid \
    --network=piarmy \
    --replicas=4 \
    mattwiater/piarmy-celluloid:latest

# 0mq: dependency
http://zeromq.org/distro:debian