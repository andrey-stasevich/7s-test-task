# Bastion instance id
output "bastion_id" {
  value = aws_instance.ec2_bastion.id
}

# Bastion public IP
output "bastion_ip" {
  value = aws_instance.ec2_bastion.public_ip
}

# Bastion security group for further processing
output "bastion_sg_id" {
  value = aws_security_group.sg_bastion.id
}