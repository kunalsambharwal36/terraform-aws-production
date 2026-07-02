# Terraform AWS Production Infrastructure

## Project Overview

This project provisions a production-style AWS infrastructure using Terraform modules.

## Architecture

- VPC
- Public & Private Subnets
- Internet Gateway
- NAT Gateway
- Security Groups
- Application Load Balancer
- Auto Scaling Group
- EC2 Launch Template
- PostgreSQL RDS
- GitLab CI/CD
- S3 Remote Backend
- DynamoDB State Locking

## Project Structure

```text
modules/
    networking/
    security/
    compute/
    alb/
    database/

environments/
    dev/
```