variable "vpc_cidr_block" {
  default = "10.0.0.0/24"
}

variable "subnet_cidr" {
  default = ["10.0.0.0/26", "10.0.0.64/26"]
}

variable "subnet_public_ip" {
  default = [true, false]
}

variable "tags" {
  default = {
    "Created By" = "Kunal"
    "Created On" = "19th April, 2024"
    "Scope"      = "Learning Terraform Modules"
  }
}

# variable "primary_subnet_nacl_ingress_rules" {

#   type = list(object({
#     protocol   = string
#     rule_no    = number
#     action     = string
#     cidr_block = string
#     from_port  = number
#     to_port    = number
#   }))

#   default = [
#     {
#       protocol   = "tcp"
#       rule_no    = 204
#       action     = "allow"
#       cidr_block = "10.0.0.0/24"
#       from_port  = 443
#       to_port    = 443
#     },
#     {
#       protocol   = "tcp"
#       rule_no    = 204
#       action     = "allow"
#       cidr_block = "0.0.0.0/24"
#       from_port  = 443
#       to_port    = 443
#     }
#   ]
# }

# variable "primary_subnet_nacl_egress_rules" {

#   type = list(object({
#     protocol   = string
#     rule_no    = number
#     action     = string
#     cidr_block = string
#     from_port  = number
#     to_port    = number
#   }))

#   default = [
#     {
#       protocol   = "tcp"
#       rule_no    = 204
#       action     = "allow"
#       cidr_block = "0.0.0.0/24"
#       from_port  = 443
#       to_port    = 443
#     }
#   ]
# }

# variable "secondary_subnet_nacl_egress_rules" {

#   type = list(object({
#     protocol   = string
#     rule_no    = number
#     action     = string
#     cidr_block = string
#     from_port  = number
#     to_port    = number
#   }))

#   default = [
#     {
#       protocol   = "tcp"
#       rule_no    = 100
#       action     = "allow"
#       cidr_block = "10.0.0.0/24"
#       from_port  = 443
#       to_port    = 443
#     },
#     {
#       protocol   = "tcp"
#       rule_no    = 101
#       action     = "deny"
#       cidr_block = "0.0.0.0/24"
#       from_port  = 443
#       to_port    = 443
#     },
#     {
#       protocol   = "tcp"
#       rule_no    = 200
#       action     = "allow"
#       cidr_block = "10.0.0.0/24"
#       from_port  = 443
#       to_port    = 443
#     },
#     {
#       protocol   = "tcp"
#       rule_no    = 201
#       action     = "deny"
#       cidr_block = "0.0.0.0/24"
#       from_port  = 443
#       to_port    = 443
#     }
#   ]
# }

# variable "secondary_subnet_nacl_ingress_rules" {

#   type = list(object({
#     protocol   = string
#     rule_no    = number
#     action     = string
#     cidr_block = string
#     from_port  = number
#     to_port    = number
#   }))

#   default = [
#     {
#       protocol   = "tcp"
#       rule_no    = 200
#       action     = "allow"
#       cidr_block = "10.0.0.0/24"
#       from_port  = 443
#       to_port    = 443
#     },
#     {
#       protocol   = "tcp"
#       rule_no    = 201
#       action     = "deny"
#       cidr_block = "0.0.0.0/24"
#       from_port  = 443
#       to_port    = 443
#     }
#   ]
# }

# variable "nacl_rules" {

#   type = list(object({
#     primary    = bool
#     protocol   = string
#     rule_no    = number
#     isEgress   = bool
#     action     = string
#     cidr_block = string
#     from_port  = number
#     to_port    = number
#   }))

#   default = [
#     {
#       primary    = true
#       protocol   = "tcp"
#       rule_no    = 203
#       isEgress   = true
#       action     = "allow"
#       cidr_block = "10.0.0.0/24"
#       from_port  = 443
#       to_port    = 443
#     },
#     {
#       primary    = true
#       protocol   = "tcp"
#       rule_no    = 204
#       action     = "allow"
#       isEgress   = false
#       cidr_block = "10.0.0.0/24"
#       from_port  = 443
#       to_port    = 443
#     },
#     {
#       primary    = false
#       protocol   = "tcp"
#       rule_no    = 100
#       isEgress   = true
#       action     = "allow"
#       cidr_block = "10.0.0.0/24"
#       from_port  = 443
#       to_port    = 443
#     },
#     {
#       primary    = false
#       protocol   = "tcp"
#       rule_no    = 101
#       action     = "deny"
#       isEgress   = true
#       cidr_block = "0.0.0.0/24"
#       from_port  = 443
#       to_port    = 443
#     },
#     {
#       primary    = false
#       protocol   = "tcp"
#       rule_no    = 200
#       action     = "allow"
#       isEgress   = false
#       cidr_block = "10.0.0.0/24"
#       from_port  = 443
#       to_port    = 443
#     },
#     {
#       primary    = false
#       protocol   = "tcp"
#       rule_no    = 201
#       action     = "deny"
#       isEgress   = false
#       cidr_block = "0.0.0.0/24"
#       from_port  = 443
#       to_port    = 443
#     }
#   ]
# }

variable "nacl_count" {
  default = 2
}