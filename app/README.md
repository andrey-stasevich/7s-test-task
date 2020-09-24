# app
Module that creates ALB and EC2 instances in ASG for application deployment 

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| template | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| app\_port | Application port | `number` | `80` | no |
| availability\_zones | AZs where to create EC2 instances and network resources | `list(string)` | n/a | yes |
| bastion\_sg\_id | Id of bastion security group to allow SSH access from it | `string` | n/a | yes |
| instance\_type | EC2 instance type | `string` | n/a | yes |
| keypair\_name | EC2 keypair name | `string` | n/a | yes |
| name | Name of this EC2 instance (for tags) | `string` | n/a | yes |
| private\_subnet\_ids | Subnet where EC2 instances should be provisioned | `list(string)` | n/a | yes |
| public\_subnets\_ids | Subnet where ALB should be provisioned | `list(string)` | n/a | yes |
| tg\_healthcheck | Healthcheck configuration for target group | <pre>object({<br>    path                = string<br>    port                = string<br>    protocol            = string<br>    interval            = number<br>    timeout             = number<br>    healthy_threshold   = number<br>    unhealthy_threshold = number<br>    matcher             = string<br>  })</pre> | <pre>{<br>  "healthy_threshold": 2,<br>  "interval": 15,<br>  "matcher": "200-299",<br>  "path": "/",<br>  "port": "traffic-port",<br>  "protocol": "HTTP",<br>  "timeout": 5,<br>  "unhealthy_threshold": 2<br>}</pre> | no |
| vpc\_id | VPC Id | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| alb\_endpoint | ALB FQDN |
