resource "aws_vpc" "vpc" {
    cidr_block = var.vpc_cidr_block
    instance_tenancy = "default"
    tags = var.tags
    assign_generated_ipv6_cidr_block = false
    enable_dns_hostnames = true
}