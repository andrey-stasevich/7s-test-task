aws_region = "us-east-1"

public_subnet_tpl = "172.16.2%s.0/24"
private_subnet_tpl = "172.16.1%s.0/24"

public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQClfamK5Na+LvRiCPUPcPQCliQZ3qLpptq41ivPwBaoYzQOJymh2RC5ATRgz/zsIevbfBgh6FAyyoF739NSzi8mGS/85jHuG+2RquT5WpG+z4c3JYlBWJ1yDXha+/o+a/DN2SvU3amIY0MltTCeQCkTylWkrBHoQ5lzb9757DAdzhK9Tg/682hP4w6sAxYFNEfg8nEAsXHSSny6Eyf6fuEAHUR7e1iXl3RIA9eoJwU4k9sXTg8NAx2gt/w6qN606N4h5DsdIJ8BORmwwcqROXT6ZyRDJTra6dulAd0wc10NEjfyt8pJZ/28+qDe1gpdvIxId0fHiwOSuqO02/xd1Jtqa2UxlJLKvwPgC77V933+o/SAGXe0VrH7p4GFLIr91YqIXCisx4axYdKv5n7kjt+acj0iCJSr2/Upwv/hLR5brdKgcoYY2X4b+5NJOtK3KkFa6rMNERzK7JSdpNezUn1u/iK1736P+e57UO7D39SCIuCeLPEMkfTnfrsoQ0DE16M= andrey_stasevich@epbyminw0576"

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