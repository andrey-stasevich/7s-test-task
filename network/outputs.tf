output "vpc_id" {
  value = aws_default_vpc.default.id
}

output "cidr_block" {
  value = aws_default_vpc.default.cidr_block
}

output "igw_id" {
  value = data.aws_internet_gateway.default.id
}

output "public_subnets_ids" {
  value = [for s in aws_subnet.public: s.id]
}

output "private_subnets_ids" {
  value = [for s in aws_subnet.private: s.id]
}