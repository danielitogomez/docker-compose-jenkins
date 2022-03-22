#!/bin/bash

# Debug Mode
set -x

# Variables
HOST_VOLUME="jenkins_host_volume"
export HOST_VOLUME

# Evaluating creation of directory volume host
if [ -d "${PWD}/$HOST_VOLUME" ] 
then
    echo "Directory ${PWD}/$HOST_VOLUME exists and all set." 
else
# Setting up
    echo "Creating directory."
        mkdir $HOST_VOLUME && 
    echo "Change permision to directory."
        chown -R $USER:$USER $HOST_VOLUME
    echo "Setting up jenkins."
        docker-compose up -d && docker ps -a | grep jenkins/jenkins:lts
        if [ $(docker ps | grep jenkins/jenkins:lts | awk '{print $9}') == "Up" ]; then
    echo "Container Up..."
    echo "Getting the initial password..."
        sleep 7
        cat ${PWD}/$HOST_VOLUME/secrets/initialAdminPassword
    exit 0
        else
    echo "Container exited."
    exit 1
        fi
fi

