resource "aws_network_acl" "test_nacl" {
  vpc_id = var.vpc_id
}

resource "aws_network_acl_association" "nacl_association_subnet" {
    network_acl_id = aws_network_acl.test_nacl.id
    subnet_id      = var.subnet_id
}

resource "aws_network_acl_rule" "test_rules" {
  count  = length(var.nacl_rules)

  rule_number    = var.nacl_rules[count.index].rule_no
  rule_action    = var.nacl_rules[count.index].action
  protocol       = var.nacl_rules[count.index].protocol
  egress         = var.nacl_rules[count.index].isEgress?true:false
  from_port      = var.nacl_rules[count.index].from_port
  to_port        = var.nacl_rules[count.index].to_port
  cidr_block     = var.nacl_rules[count.index].cidr_block
  # network_acl_id = var.nacl_rules[count.index].primary == true ? aws_network_acl.test_nacl[0].network_acl_id : aws_network_acl.test_nacl[1].network_acl_id
  network_acl_id = aws_network_acl.test_nacl.id
}

# module "nacl_rule" {
#   source = "../modules/nacl_rule"
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