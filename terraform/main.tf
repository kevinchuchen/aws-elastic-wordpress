provider "aws" {
  region     = "us-east-1"
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
}
data "aws_region" "current" {}

module "create_networking" {
  source = "./modules/Networking"
}

module "manage_IAM_role" {
  source = "./modules/IAM"
}

module "SSM_Parameter" {
  source = "./modules/SSM_Parameter"
  DBPassword = var.DB_PASSWORD
  DBRootPassword = var.DB_ROOT_PASSWORD
}

module "Launch_Template"{
  source = "./modules/EC2"
  instance-profile = module.manage_IAM_role.IAM-Instance-Profile-ID
  current-region = data.aws_region.current.name
  WP-security-group-id = module.create_networking.WP-security-group-id
}