resource "aws_alb" "lb" {
  name               = "app-alb"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_security_group.id]
  subnets            = var.public_subnets_ids

  tags = {
    Source = var.name
  }
}

resource "aws_lb_listener" "listener_http" {

  load_balancer_arn = aws_alb.lb.arn
  port              = var.app_port

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.tg.arn
  }
}

resource "aws_alb_target_group" "tg" {
  name     = "tg-app"
  port     = var.app_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = var.tg_healthcheck.path
    port                = var.tg_healthcheck.port
    protocol            = var.tg_healthcheck.protocol
    interval            = var.tg_healthcheck.interval
    timeout             = var.tg_healthcheck.timeout
    healthy_threshold   = var.tg_healthcheck.healthy_threshold
    unhealthy_threshold = var.tg_healthcheck.unhealthy_threshold
    matcher             = var.tg_healthcheck.matcher
  }

  tags = {
    Name = var.name
  }
}

resource "aws_autoscaling_group" "asg" {
  name                 = "app-asg"
  launch_configuration = aws_launch_configuration.lc.name

  min_size                  = 1
  max_size                  = length(var.availability_zones)
  desired_capacity          = length(var.availability_zones)
  health_check_grace_period = 300

  target_group_arns = [aws_alb_target_group.tg.arn]
  health_check_type = "EC2"

  vpc_zone_identifier = var.private_subnet_ids

  tag {
    key = "Name"
    value = var.name
    propagate_at_launch = true
  }
}

resource "aws_launch_configuration" "lc" {
  name_prefix                 = "app-lc-"
  key_name                    = var.keypair_name
  associate_public_ip_address = false
  image_id                    = data.aws_ami.linux.id
  instance_type               = var.instance_type
  user_data_base64            = data.template_cloudinit_config.cloud_init.rendered
  security_groups             = [aws_security_group.app_security_group.id]
  root_block_device {
    volume_size = 8
  }

  ebs_block_device {
    device_name           = "/dev/sdf"
    volume_size           = 10
    delete_on_termination = false
  }

  lifecycle {
    create_before_destroy = true
  }
}