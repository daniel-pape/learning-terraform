provider "aws" {
  # The lastest version as of today
  # (according to https://registry.terraform.io/providers/hashicorp/aws/latest)
  version = "3.39.0"
  profile = "terraform-learner"
  region = "us-east-1"
}

module "vpc_module" {
  source = "./modules/vpc_networking"


//  private_subnet_cidr = var.private_subnet_cidr
//  public_subnet_cidr = var.public_subnet_cidr
//  vpc_cidr_block = var.vpc_cidr_block

  private_subnet_1_cidr = ""
  private_subnet_2_cidr = ""
  private_subnet_3_cidr = ""
  public_subnet_1_cidr = ""
  public_subnet_2_cidr = ""
  public_subnet_3_cidr = ""
  region = ""
  vpc_cidr_block = ""
}