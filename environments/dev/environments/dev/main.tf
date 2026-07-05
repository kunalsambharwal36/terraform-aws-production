module "networking" {

  source = "../../modules/networking"

  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

module "security" {

  source = "../../modules/security"

  vpc_id = module.networking.vpc_id
}

module "alb" {

  source = "../../modules/alb"

  vpc_id            = module.networking.vpc_id
  public_subnet_ids = module.networking.public_subnet_ids

  alb_sg_id = module.security.alb_sg_id
}

module "compute" {

  source = "../../modules/compute"

  instance_name = var.instance_name
  instance_type = var.instance_type
  docker_image  = var.docker_image

  public_subnet_ids = module.networking.public_subnet_ids

  ec2_sg_id = module.security.ec2_sg_id

  target_group_arn = module.alb.target_group_arn

  db_endpoint = module.database.db_endpoint
  db_username = "postgres"
  db_password = "Cloudshop123"

}

module "database" {

  source = "../../modules/database"

  private_subnet_ids = module.networking.private_subnet_ids

  rds_sg_id = module.security.rds_sg_id
}

module "monitoring" {

  source = "../../modules/monitoring"

  environment = "dev"
  region      = var.aws_region

  alb_name          = module.alb.lb_name
  target_group_name = module.alb.target_group_name
  asg_name          = module.compute.asg_name
  db_identifier     = module.database.db_identifier
}