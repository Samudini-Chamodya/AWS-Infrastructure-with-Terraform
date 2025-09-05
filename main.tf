provider "aws" {
  region = "us-east-1"
}
terraform {
  backend "s3" {
    bucket         = "s3statebackend2"
    key            = "global/mystatefile/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "state-lock"
  }
}

module "vpc" {
  source      = "./modules/vpc"
  vpc_cidr    = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source            = "./modules/ec2"
  subnet_id         = module.vpc.subnet_id
  security_group_id = module.security_group.sg_id
  key_path          = var.key_path
  ami_id            = var.ami_id
}
