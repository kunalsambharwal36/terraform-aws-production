resource "aws_security_group" "alb" {

  name        = "alb-sg"
  description = "Application Load Balancer Security Group"

  vpc_id = var.vpc_id

  ingress {

    description = "HTTP"

    from_port = 80
    to_port   = 80

    protocol = "tcp"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  ingress {

    description = "HTTPS"

    from_port = 443
    to_port   = 443

    protocol = "tcp"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  egress {

    from_port = 0
    to_port   = 0

    protocol = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  tags = {
    Name = "alb-security-group"
  }
}

resource "aws_security_group" "ec2" {

  name        = "ec2-sg"
  description = "EC2 Security Group"

  vpc_id = var.vpc_id

  ingress {

    description = "HTTP from ALB"

    from_port = 80
    to_port   = 80

    protocol = "tcp"

    security_groups = [
      aws_security_group.alb.id
    ]
  }

  ingress {

    description = "SSH"

    from_port = 22
    to_port   = 22

    protocol = "tcp"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  egress {

    from_port = 0
    to_port   = 0

    protocol = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  tags = {
    Name = "ec2-security-group"
  }
}

resource "aws_security_group" "rds" {

  name        = "rds-sg"
  description = "RDS Security Group"

  vpc_id = var.vpc_id

  ingress {

    description = "PostgreSQL"

    from_port = 5432
    to_port   = 5432

    protocol = "tcp"

    security_groups = [
      aws_security_group.ec2.id
    ]
  }

  egress {

    from_port = 0
    to_port   = 0

    protocol = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  tags = {
    Name = "rds-security-group"
  }
}