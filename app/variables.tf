variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "keypair_name" {
  description = "EC2 keypair name"
  type        = string
}

variable "public_subnets_ids" {
  description = "Subnet where ALB should be provisioned"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "Subnet where EC2 instances should be provisioned"
  type        = list(string)
}

variable "name" {
  description = "Name of this EC2 instance (for tags)"
  type        = string
}

variable "vpc_id" {
  description = "VPC Id"
  type        = string
}

variable "bastion_sg_id" {
  description = "Id of bastion security group to allow SSH access from it"
  type        = string
}

variable "availability_zones" {
  description = "AZs where to create EC2 instances and network resources"
  type        = list(string)
}

variable "app_port" {
  description = "Application port"
  type = number
  default = 80
}

variable "tg_healthcheck" {
  type = object({
    path                = string
    port                = string
    protocol            = string
    interval            = number
    timeout             = number
    healthy_threshold   = number
    unhealthy_threshold = number
    matcher             = string
  })

  description = "Healthcheck configuration for target group"

  default = {
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    interval            = 15
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200-299"
  }
}