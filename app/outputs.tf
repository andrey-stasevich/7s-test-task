# ALB FQDN
output "alb_endpoint" {
  value = aws_alb.lb.dns_name
}