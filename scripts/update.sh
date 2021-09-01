#!/bin/bash

# pull latest images
docker-compose pull
# perform any builds
docker-compose build
# re-launch any updated conainers
docker-compose up -d
# clean out unused images
docker image prune -f
