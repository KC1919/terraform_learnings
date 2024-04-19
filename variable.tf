variable "vpc_cidr_block" {
  default = "10.0.0.0/24"
}

variable "subnet_cidr" {
  default = ["10.0.0.0/26", "10.0.0.64/26"]
}

variable "subnet_public_ip" {
  default = [true,false]
}

variable "tags" {
  default = {
    "Created By" = "Kunal"
    "Created On" = "19th April, 2024"
    "Scope"      = "Learning Terraform Modules"
  }
}