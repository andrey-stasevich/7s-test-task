variable "aws_region" {
  description = "AWS Region"
  type = string
  default = "us-east-1"
}

variable "availability_zones" {
  description = "AZs where to create EC2 instances and network resources"
  type        = list(string)
}

variable "private_subnet_tpl" {
  description = "Template for private subnet CIDR to create according to instance count"
  type        = string
}

variable "public_subnet_tpl" {
  description = "Template for public subnet CIDR to create according to instance count"
  type        = string
}

variable "public_key" {
  description = "Public key for EC2 key pair"
  type        = string
}

variable "bastion_config" {
  type = object({

    # Bastion instance type
    instance_type = string

    # Service name
    name = string
  })
}

variable "app_config" {
  type = object({

    # Bastion instance type
    instance_type = string

    # Service name
    name = string
  })
}

variable "bastion_whitelist" {
  type = list(string)
  description = "List of CIDRs to be whitelisted on bastion"
}

variable "secondary_cidr" {
  type        = string
  description = "Secondary CIDR for default VPC"
}