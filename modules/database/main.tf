resource "aws_db_subnet_group" "this" {

  name = "cloudshop-db-subnet-group"

  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "cloudshop-db-subnet-group"
  }
}

resource "aws_db_instance" "this" {

  identifier = "cloudshop-db"

  engine = "postgres"

  engine_version = "16.13"

  instance_class = "db.t3.micro"

  allocated_storage = 20

  storage_type = "gp3"

  db_name = "cloudshop"

  username = "postgres"

  password = "Cloudshop123"

  db_subnet_group_name = aws_db_subnet_group.this.name

  vpc_security_group_ids = [
    var.rds_sg_id
  ]

  publicly_accessible = false

  multi_az = false

  skip_final_snapshot = true

  deletion_protection = false

  tags = {
    Name = "cloudshop-postgres"
  }
}