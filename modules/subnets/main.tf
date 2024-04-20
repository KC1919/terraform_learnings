resource "aws_subnet" "test_subnet" {
  vpc_id = var.vpc_id
  cidr_block = var.cidr_block
  map_public_ip_on_launch = var.subnet_public_ip
  depends_on = [ var.vpc_id ]
  tags = var.tags
  assign_ipv6_address_on_creation = false
}