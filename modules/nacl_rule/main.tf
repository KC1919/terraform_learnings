resource "aws_network_acl_rule" "test_rules" {
  rule_number    = var.rule_number
  rule_action    = var.rule_action
  protocol       = var.protocol
  cidr_block     = var.cidr_block
  egress         = var.isEgress
  network_acl_id = var.network_acl_id
  from_port      = var.from_port
  to_port        = var.to_port
}