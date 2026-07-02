#!/bin/bash

dnf update -y

dnf install -y docker

systemctl enable docker

systemctl start docker

usermod -aG docker ec2-user

docker run -d \
  --name product-service \
  -p 80:8080 \
  ${docker_image}