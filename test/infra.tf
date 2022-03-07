terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 4.2.0"
    }
  }
  required_version = "~> 1.1.7"
}

provider "aws" {
  region = "us-east-1"
}

module "bastion" {
  source              = "../../terraform_modules_aws_ec2_bastion"
  tags                = var.tags
  vpc_config          = var.vpc_config
  bastion_sg_config   = var.bastion_sg_config
  bastion_host_config = var.bastion_host_config
}
