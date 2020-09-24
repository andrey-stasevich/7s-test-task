output "bastion_id" {
  value = aws_instance.ec2_bastion.id
}

output "bastion_ip" {
  value = aws_instance.ec2_bastion.public_ip
}

output "bastion_sg_id" {
  value = aws_security_group.sg_bastion.id
}