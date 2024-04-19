output "subnet_ids" {
  description = "Subnet ids"
  value = aws_subnet.test_subnet.id
}

output "subnet_count" {
  value = length(aws_subnet.test_subnet[*])
}