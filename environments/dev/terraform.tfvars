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
