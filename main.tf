module "vpc" {
  source         = "./modules/vpc"
  vpc_cidr_block = var.vpc_cidr_block
  tags           = var.tags
}

module "subnet" {
  source           = "./modules/subnets"
  count            = length(var.subnet_cidr)
  vpc_id           = module.vpc.vpc_id
  depends_on       = [module.vpc]
  cidr_block       = var.subnet_cidr[count.index]
  subnet_public_ip = var.subnet_public_ip[count.index]
  tags             = var.tags
}

module "nacl" {
  source         = "./modules/nacl"
  count          = var.nacl_count
  # vpc_cidr_block = var.vpc_cidr_block
  vpc_id         = module.vpc.vpc_id
  subnet_id      = module.subnet[count.index].subnet_ids
  depends_on     = [module.vpc]
  # egress_rules   = count.index==0?var.primary_subnet_nacl_egress_rules: var.secondary_subnet_nacl_egress_rules
  # ingress_rules  = count.index==0?var.primary_subnet_nacl_ingress_rules: var.secondary_subnet_nacl_ingress_rules
}

# module "nacl_rule" {
#   source = "./modules/nacl_rule"
#   count  = length(var.nacl_rules)

#   rule_number    = var.nacl_rules[count.index].rule_no
#   rule_action    = var.nacl_rules[count.index].action
#   protocol       = var.nacl_rules[count.index].protocol
#   isEgress       = var.nacl_rules[count.index].isEgress
#   from_port      = var.nacl_rules[count.index].from_port
#   to_port        = var.nacl_rules[count.index].to_port
#   cidr_block     = var.nacl_rules[count.index].cidr_block
#   network_acl_id = var.nacl_rules[count.index].primary == true ? module.nacl[0].network_acl_id : module.nacl[1].network_acl_id
# }