#!/bin/sh

set -e

VAGRANT_HOME="/vagrant"

NEXUS_PORT="9081"
NEXUS_IMAGE="gpii/nexus"
NEXUS_CONTAINER="gpii-nexus"
NEXUS_SECCOMP="nexus-seccomp.json"

# Stop and remove previous Docker image and container
docker rmi -f $NEXUS_IMAGE 2>/dev/null || true
docker rm -f $NEXUS_CONTAINER 2>/dev/null || true

# Build Docker image
docker build -t $NEXUS_IMAGE .

# Start Docker container
docker run -d --name $NEXUS_CONTAINER --security-opt seccomp=${VAGRANT_HOME}/${NEXUS_SECCOMP} -p $NEXUS_PORT:$NEXUS_PORT $NEXUS_IMAGE

echo
echo 
echo Docker container started. Access it at http://localhost:${NEXUS_PORT}/visible-nexus/visibleNexus.html
echo
echo
