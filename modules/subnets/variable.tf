variable "vpc_id" {
  description = "VPC id"
  type = string
}

variable "cidr_block" {}

variable "subnet_public_ip" {
  default = true
}

# variable "subnet_count" {
#   description = "Subnet count"
# }

variable "tags" {}
