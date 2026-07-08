aws_region = "us-east-1"

vpc_cidr = "10.0.0.0/16"

public_subnets = {
  public-a = {
    cidr = "10.0.1.0/24"
    az   = "us-east-1a"
  }

  public-b = {
    cidr = "10.0.2.0/24"
    az   = "us-east-1b"
  }
}

private_subnets = {
  private-a = {
    cidr = "10.0.11.0/24"
    az   = "us-east-1a"
  }

  private-b = {
    cidr = "10.0.12.0/24"
    az   = "us-east-1b"
  }
}

instance_name = "cloudshop"


docker_image = "kunalsambharwal36/cloudshop-product-service:8a062a6b"

environment     = "dev"

cluster_name    = "cloudshop-dev"

cluster_version = "1.31"

instance_type = "t3.medium"

desired_size = 2

min_size = 2

max_size = 3