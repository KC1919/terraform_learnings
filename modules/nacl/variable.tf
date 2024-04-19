variable "vpc_id" {
  description = "VPC id"
  type = string
}

variable "subnet_ids" {
  description = "Subnet id"
  type = list(string)
}

variable "vpc_cidr_block" {}

