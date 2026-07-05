terraform {

  backend "s3" {

    bucket         = "cloudshop-dev-terraform-state"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "cloudshop-dev-terraform-lock"

    encrypt = true
  }
}