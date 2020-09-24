# SSH Keypair
resource "aws_key_pair" "keypair" {
  key_name   = "kp-7s"
  public_key = var.public_key
}

# Module to manage default network
module "vpc" {

  source = "./network"

  availability_zones = var.availability_zones
  private_subnet_tpl = var.private_subnet_tpl
  public_subnet_tpl  = var.public_subnet_tpl
  secondary_cidr     = var.secondary_cidr
}

# Module to create bastion host to access EC2 instances in private subnets
module "bastion" {

  source = "./bastion"

  keypair_name      = aws_key_pair.keypair.key_name
  instance_type     = var.bastion_config.instance_type
  name              = var.bastion_config.name
  bastion_whitelist = var.bastion_whitelist
  subnet            = module.vpc.public_subnets_ids[0]
  vpc_cidr          = module.vpc.cidr_block
  vpc_id            = module.vpc.vpc_id
}

# Module to provision ALB and ASG resources
module "app" {

  source = "./app"

  keypair_name       = aws_key_pair.keypair.key_name
  availability_zones = var.availability_zones
  instance_type      = var.app_config.instance_type
  name               = var.app_config.name
  bastion_sg_id      = module.bastion.bastion_sg_id
  private_subnet_ids = module.vpc.private_subnets_ids
  public_subnets_ids = module.vpc.public_subnets_ids
  vpc_id             = module.vpc.vpc_id
}