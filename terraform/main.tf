provider "aws" {
  region     = "us-east-1"
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
}

module "create_networking" {
  source = "./modules/Networking"
}

module "manage_IAM_role" {
  source = "./modules/IAM"
}

module "SSM_Parameter" {
  source = "./modules/SSM_Parameter"
}