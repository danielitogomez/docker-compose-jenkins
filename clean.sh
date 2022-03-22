#!/bin/bash

set -x

echo "Deleting containers and delete volume"
docker-compose down
rm -rf ${PWD}/jenkins_host_volume