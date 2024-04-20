variable "vpc_id" {
  description = "VPC id"
  type = string
}

variable "subnet_id" {
  description = "Subnet id"
  type = string
}

variable "nacl_rules" {

  type = list(object({
    primary    = bool
    protocol   = string
    rule_no    = number
    isEgress   = bool
    action     = string
    cidr_block = string
    from_port  = number
    to_port    = number
  }))

  default = [
    {
      primary    = true
      protocol   = "tcp"
      rule_no    = 203
      isEgress   = true
      action     = "allow"
      cidr_block = "10.0.0.0/24"
      from_port  = 443
      to_port    = 443
    },
    {
      primary    = true
      protocol   = "tcp"
      rule_no    = 204
      action     = "allow"
      isEgress   = false
      cidr_block = "10.0.0.0/24"
      from_port  = 443
      to_port    = 443
    },
    {
      primary    = false
      protocol   = "tcp"
      rule_no    = 100
      isEgress   = true
      action     = "allow"
      cidr_block = "10.0.0.0/24"
      from_port  = 443
      to_port    = 443
    },
    {
      primary    = false
      protocol   = "tcp"
      rule_no    = 101
      action     = "deny"
      isEgress   = true
      cidr_block = "0.0.0.0/24"
      from_port  = 443
      to_port    = 443
    },
    {
      primary    = false
      protocol   = "tcp"
      rule_no    = 200
      action     = "allow"
      isEgress   = false
      cidr_block = "10.0.0.0/24"
      from_port  = 443
      to_port    = 443
    },
    {
      primary    = false
      protocol   = "tcp"
      rule_no    = 201
      action     = "deny"
      isEgress   = false
      cidr_block = "0.0.0.0/24"
      from_port  = 443
      to_port    = 443
    }
  ]
}

# variable "vpc_cidr_block" {}


# variable "egress_rules" {
#   description = "List of egress rules"
#   # type = list(object({
#   #   protocol   = string
#   #   rule_no    = number
#   #   action     = string
#   #   cidr_block = string
#   #   from_port  = number
#   #   to_port    = number
#   # }))
# }

# variable "ingress_rules" {
#   description = "List of ingress rules"
#   # type = list(object({
#   #   protocol   = string
#   #   rule_no    = number
#   #   action     = string
#   #   cidr_block = string
#   #   from_port  = number
#   #   to_port    = number
#   # }))
# }

