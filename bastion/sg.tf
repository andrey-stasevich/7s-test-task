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

  ingress {
    protocol  = -1
    from_port = 0
    to_port   = 0
    cidr_blocks = [
      var.vpc_cidr
    ]
  }

  ingress {
    protocol  = "tcp"
    from_port = 22
    to_port   = 22

    cidr_blocks = var.bastion_whitelist
  }

  egress {
    protocol  = -1
    from_port = 0
    to_port   = 0
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
}