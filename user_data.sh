#!/bin/bash
apt-get update -y
apt-get install -y docker.io
systemctl start docker
systemctl enable docker

docker run -d -p 1337:1337 avimehndi/strapi-app:${docker_tag}
