resource "aws_instance" "ec2_bastion" {

  ami                         = data.aws_ami.linux.id
  instance_type               = var.instance_type
  key_name                    = var.keypair_name
  subnet_id                   = var.subnet
  associate_public_ip_address = true
  vpc_security_group_ids      = [ aws_security_group.sg_bastion.id ]

  tags = {
    Name = var.name
  }

  lifecycle {
    create_before_destroy = true
  }
}
