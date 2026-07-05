#!/bin/bash

dnf update -y

dnf install -y docker

dnf install -y amazon-cloudwatch-agent

systemctl enable docker
systemctl start docker

usermod -aG docker ec2-user

# CloudWatch Agent configuration
# (We'll add this in the next step)

docker run -d \
  --restart unless-stopped \
  --name product-service \
  -p 80:8000 \
  -e DATABASE_URL="postgresql://${db_username}:${db_password}@${db_endpoint}:5432/postgres" \
  ${docker_image}

# Start CloudWatch Agent