/* Main VPC */
module "vpc" {
  source = "./modules/vpc"

  prefix               = var.all_vars.prefix
  environment          = var.all_vars.environment
  region               = var.all_vars.region
  vpc_cidr             = var.all_vars.vpc_cidr
  public_subnets_cidr  = var.all_vars.public_subnets_cidr
  private_subnets_cidr = var.all_vars.private_subnets_cidr
  availability_zones   = var.all_vars.availability_zones
  tags                 = var.tags
}
