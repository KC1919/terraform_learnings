resource "aws_instance" "test-ec2" {
  ami = "ami-04e5276ebb8451442"
  associate_public_ip_address = true
  instance_type = "t2.micro"
  subnet_id = var.primary_subnet_id
}