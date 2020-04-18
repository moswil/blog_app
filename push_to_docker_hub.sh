#!/usr/bin/env bash

# Load the environment variables that has your docker hub credentials
source docker.env

# login to docker
val=$(echo "$DOCKER_HUB_PASSWORD" | docker login --username=$DOCKER_HUB_USERNAME --password-stdin)
image="$DOCKER_HUB_USERNAME/$IMAGE_NAME:$IMAGE_VERSION"

# Docker Build
build_image() {
    echo "Building the image: $image"
    docker build -f Dockerfile.prod -t $image .
}

# Docker Push to Hub
push_image() {
    echo "Pushing the image: $image to Docker Hub"
    docker push $image
}

if [ "$val" ]
then
    echo "Login success"
    build_image
    push_image
else
    echo "Login Failed"
    # Prompt for username and password
    # And show the error that occured
fi
