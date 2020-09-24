# Get default vpc
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

# Add second CIDR to the VPC
resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr" {

  cidr_block = var.secondary_cidr
  vpc_id     = aws_default_vpc.default.id
}

# Elastic IP for NAT Gateway
resource "aws_eip" "nat_gateway_ip" {
  vpc   = true
}

# NAT Gateway for private subnets
resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.nat_gateway_ip.id
  subnet_id     = aws_subnet.public[0].id
  tags = {
    Name = "ngw"
  }
}
