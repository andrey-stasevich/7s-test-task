aws_region = "us-east-1"

public_subnet_tpl = "172.16.2%s.0/24"
private_subnet_tpl = "172.16.1%s.0/24"

availability_zones = [
  "us-east-1a",
  "us-east-1b"
]

bastion_whitelist = ["93.171.160.22/32"]

bastion_config = {
  instance_type = "t2.micro"
  name          = "bastion"
}

app_config = {
  instance_type = "t2.micro"
  name          = "app"
}

secondary_cidr = "172.16.0.0/16"