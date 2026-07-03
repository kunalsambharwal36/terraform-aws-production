#!/bin/bash

dnf update -y

dnf install -y docker

systemctl enable docker

systemctl start docker

usermod -aG docker ec2-user

docker run -d \
  --restart unless-stopped \
  --name product-service \
  -p 80:8000 \
  -e DATABASE_URL="postgresql://${db_username}:${db_password}@${db_endpoint}:5432/postgres" \
  ${docker_image}