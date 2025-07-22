#!/bin/bash

exec > /var/log/user-data.log 2>&1

sudo apt-get update -y
sudo apt-get install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker

sudo docker pull avimehndi/strapi-app:${docker_tag}

sudo docker rm -f strapi || true
sudo docker run -d \
  --name strapi \
  -p 1337:1337 \
  --restart unless-stopped \
  -e APP_KEYS="$APP_KEYS" \
  -e API_TOKEN_SALT="$API_TOKEN_SALT" \
  -e ADMIN_JWT_SECRET="$ADMIN_JWT_SECRET" \
  -e JWT_SECRET="$JWT_SECRET" \
  avimehndi/strapi-app:${docker_tag}
echo ">>> Done setting up Strapi"