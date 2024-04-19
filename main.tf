module "vpc" {
  source         = "./modules/vpc"
  vpc_cidr_block = var.vpc_cidr_block
  tags           = var.tags
}

module "subnet" {
  source     = "./modules/subnets"
  count      = length(var.subnet_cidr)
  vpc_id     = module.vpc.vpc_id
  depends_on = [module.vpc]
  cidr_block = var.subnet_cidr[count.index]
  subnet_public_ip = var.subnet_public_ip[count.index]
  tags       = var.tags
}

module "nacl" {
  source         = "./modules/nacl"
  vpc_cidr_block = var.vpc_cidr_block
  vpc_id         = module.vpc.id
  subnet_ids     = module.subnet.subnet_id[*]
  depends_on = [ module.vpc ]
}
