#!/bin/bash
apt-get update -y
apt-get install -y docker.io

# Run your Docker image with the tag passed from Terraform
docker run -d -p 1337:1337 avimehndi/strapi-app:${docker_tag}
