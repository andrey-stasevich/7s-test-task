# VPC Id
output "vpc_id" {
  value = aws_default_vpc.default.id
  }

# VPC CIDR block
output "cidr_block" {
  value = aws_default_vpc.default.cidr_block
}

# Default IGW ID
output "igw_id" {
  value = data.aws_internet_gateway.default.id
}

# List of public subnets IDs
output "public_subnets_ids" {
  value = [for s in aws_subnet.public: s.id]
}

# List of private subnets IDs
output "private_subnets_ids" {
  value = [for s in aws_subnet.private: s.id]
}