output "bastion_ip" {
  value = module.bastion.bastion_ip
}

output "alb_endpoint" {
  value = module.app.alb_endpoint
}