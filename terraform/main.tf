provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./modules/vpc"
}

module "subnet" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
}

module "internet_gateway" {
  source = "./modules/internet_gateway"
  vpc_id = module.vpc.vpc_id
}

module "route_table" {
  source = "./modules/route_table"
  vpc_id = module.vpc.vpc_id
  igw_id = module.internet_gateway.igw_id
  public_subnet_id = module.subnet.public_subnet_id
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
  public_subnet_cidr = module.subnet.public_subnet_cidr
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  public_subnet_id         = module.subnet.public_subnet_id
  public_security_group_id = module.security_group.public_security_group_id
  ssh_key_name             = var.ssh_key_name
}
