resource "aws_network_acl" "primary_subnet_nacl" {
  vpc_id = var.vpc_id
  subnet_ids = var.subnet_ids
  
    egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = var.vpc_cidr_block
    from_port  = -1
    to_port    = -1
  }

  ingress = {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.vpc_cidr_block
    from_port  = 80
    to_port    = 80
  }

  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0"
    from_port  = -1
    to_port    = -1
  }
}

resource "aws_network_acl_association" "nacl_association_subnet" {
    count = length(aws_subnet[*]) 
    network_acl_id = aws_network_acl.primary_subnet_nacl.id
    subnet_id      = var.subnet_ids[count.index]
}