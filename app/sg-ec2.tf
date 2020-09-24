# Security group for EC2 instance created by ASG
resource "aws_security_group" "app_security_group" {
  name = "app"
  description = "Security group for the appserver"
  vpc_id      = var.vpc_id
  tags = {
    Name   = "sg-app"
  }
}

# Allow access from bastion to the instance
resource "aws_security_group_rule" "sgr_app_in_ssh" {
  description       = "Allow SSH to hosts in the application security group"
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 22
  to_port           = 22
  security_group_id = aws_security_group.app_security_group.id

  source_security_group_id = var.bastion_sg_id
}

# Allow access to HTTP port from ALB
resource "aws_security_group_rule" "sgr_app_in_alb" {
  description       = "Allow HTTP to hosts in the application security group"
  type              = "ingress"
  protocol          = "tcp"
  from_port         = var.app_port
  to_port           = var.app_port
  security_group_id = aws_security_group.app_security_group.id

  source_security_group_id = aws_security_group.alb_security_group.id
}

# Allow outbound traffic from the instance
resource "aws_security_group_rule" "sgr_app_egr" {
  description       = "Allow all outbound traffic from the application security group"
  type              = "egress"
  security_group_id = aws_security_group.app_security_group.id
  cidr_blocks       = ["0.0.0.0/0"]
  protocol          = "-1"
  from_port         = 0
  to_port           = 65535
}
