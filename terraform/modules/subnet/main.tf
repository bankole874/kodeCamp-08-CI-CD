resource "aws_subnet" "publicSubnet" {
  vpc_id     = var.vpc_id
  cidr_block = "10.0.1.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSubnet"
  }
}

