#!/bin/sh

set -e

NEXUS_PORT="9081"
NEXUS_IMAGE="gpii/nexus"
NEXUS_CONTAINER="gpii-nexus"

# Build Docker image
docker build -t $NEXUS_IMAGE . 

# Stop and remove previous Docker image and container
docker rmi -f $NEXUS_IMAGE 2>/dev/null || true
docker rm -f $NEXUS_CONTAINER 2>/dev/null || true

# Start Docker container
docker run -d --name $NEXUS_CONTAINER -p $NEXUS_PORT:$NEXUS_PORT $NEXUS_IMAGE

echo
echo 
echo Docker container started. Access it at http://localhost:${NEXUS_PORT}/visible-nexus/visibleNexus.html
echo
echo
