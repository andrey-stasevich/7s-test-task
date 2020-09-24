variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "keypair_name" {
  description = "EC2 keypair name"
  type        = string
}

variable "subnet" {
  description = "Subnet where EC2 instance should be provisioned"
  type        = string
}

variable "name" {
  description = "Name of this EC2 instance (for tags)"
  type        = string
}

variable "vpc_id" {
  description = "VPC Id"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

variable "bastion_whitelist" {
  type = list(string)
  description = "List of CIDRs to be whitelisted on bastion"
}