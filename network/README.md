# network
Performs operations with default VPC in the account. Actually, AWS recommends not to use default VPC for real cases, but it requires for the test task.
Adds secondary CIDR for VPC to operate with public and private subnets
Creates private and public subnet in each AZ  that is specified in variables.
Creates NAT gateway for internet access from private subnets
Creates route tables for public and private subnets

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| availability\_zones | AZs where to create EC2 instances and network resources | `list(string)` | n/a | yes |
| private\_subnet\_tpl | Template for private subnet CIDR to create according to instance count | `string` | n/a | yes |
| public\_subnet\_tpl | Template for public subnet CIDR to create according to instance count | `string` | n/a | yes |
| secondary\_cidr | Secondary CIDR for default VPC | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| cidr\_block | VPC CIDR block |
| igw\_id | Default IGW ID |
| private\_subnets\_ids | List of private subnets IDs |
| public\_subnets\_ids | List of public subnets IDs |
| vpc\_id | VPC Id |
