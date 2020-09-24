# Bastion public ip
output "bastion_ip" {
  value = module.bastion.bastion_ip
}

# ALB FQDN
output "alb_endpoint" {
  value = module.app.alb_endpoint
}