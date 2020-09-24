# Route table for private subnets
# In our simple setup we will have only one, but in real setup most likely we will create a route table per subnet
# for better security
resource "aws_route_table" "private" {
  vpc_id = aws_default_vpc.default.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw.id
  }
  tags = {
    Name = "private-route-table"
  }
}

# Private subnets in every AZ
resource "aws_subnet" "private" {
  for_each = local.az_map

  availability_zone = each.value
  cidr_block        = format(var.private_subnet_tpl, each.key)
  vpc_id            = aws_default_vpc.default.id

  tags = {
    Name = format("private-subnet-%s", each.value)
  }

  depends_on = [
    aws_vpc_ipv4_cidr_block_association.secondary_cidr,
    aws_nat_gateway.ngw
  ]
}

# Associate route table with private subnets
resource "aws_route_table_association" "database_route_table_association" {
  for_each = local.az_map

  subnet_id      = aws_subnet.private[each.key].id
  route_table_id = aws_route_table.private.id
}
