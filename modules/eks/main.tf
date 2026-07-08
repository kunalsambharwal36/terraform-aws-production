module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  vpc_id     = var.vpc_id
  subnet_ids = var.private_subnet_ids

  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true

  enable_irsa = true

  eks_managed_node_groups = {

    default = {

      instance_types = var.instance_type

      min_size     = var.min_size
      max_size     = var.max_size
      desired_size = var.desired_size

      capacity_type = "ON_DEMAND"

      ami_type = "AL2_x86_64"

      disk_size = 30

      labels = {
        Environment = var.environment
      }

      tags = {
        Name = "${var.cluster_name}-nodegroup"
      }
    }
  }

  tags = {
    Environment = var.environment
    Terraform   = "true"
    Project     = "cloudshop"
  }
}