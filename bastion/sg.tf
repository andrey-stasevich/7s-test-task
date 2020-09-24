# Bastion security group
resource "aws_security_group" "sg_bastion" {
  name        = var.name
  vpc_id      = var.vpc_id
  description = "Bastion security group"

  tags = {
    Name = var.name,
  }

  lifecycle {
    create_before_destroy = true
  }

  # Allow full access from outside the VPC
  ingress {
    protocol  = -1
    from_port = 0
    to_port   = 0
    cidr_blocks = [
      var.vpc_cidr
    ]
  }

  # Allow SSH access from whitelisted IPs
  ingress {
    protocol  = "tcp"
    from_port = 22
    to_port   = 22

    cidr_blocks = var.bastion_whitelist
  }

  # Allow access to external resources from bastion
  egress {
    protocol  = -1
    from_port = 0
    to_port   = 0
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
}