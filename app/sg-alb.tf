resource "aws_security_group" "alb_security_group" {
  name = "alb"
  description = "Security group for ALB"
  vpc_id      = var.vpc_id
  tags = {
    Name   = "sg-alb"
  }
}

resource "aws_security_group_rule" "sgr_alb_in_http" {
  description       = "Allow any HTTP traffic on port 80 to ALBs"
  type              = "ingress"
  protocol          = "tcp"
  from_port         = var.app_port
  to_port           = var.app_port
  security_group_id = aws_security_group.alb_security_group.id
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "sgr_alb_egr" {
  description       = "Allow all outbound traffic from the alb security group"
  type              = "egress"
  security_group_id = aws_security_group.alb_security_group.id
  cidr_blocks       = ["0.0.0.0/0"]
  protocol          = "-1"
  from_port         = 0
  to_port           = 65535
}
