# bastion

Module to create bastion host for access to resources in private subnets

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bastion\_whitelist | List of CIDRs to be whitelisted on bastion | `list(string)` | n/a | yes |
| instance\_type | EC2 instance type | `string` | n/a | yes |
| keypair\_name | EC2 keypair name | `string` | n/a | yes |
| name | Name of this EC2 instance (for tags) | `string` | n/a | yes |
| subnet | Subnet where EC2 instance should be provisioned | `string` | n/a | yes |
| vpc\_cidr | VPC CIDR | `string` | n/a | yes |
| vpc\_id | VPC Id | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| bastion\_id | Bastion instance id |
| bastion\_ip | Bastion public IP |
| bastion\_sg\_id | Bastion security group for further processing |
