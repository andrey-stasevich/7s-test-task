data "aws_ami" "linux" {
  most_recent = true
  owners      = ["137112412989"]

  filter {
    name = "name"

    values = [
      "amzn2-ami-hvm-*-x86_64-gp2",
    ]
  }
}

data "template_cloudinit_config" "cloud_init" {
  base64_encode = true
  gzip          = true
  part {
    filename     = "cloud_init.tpl"
    content_type = "text/cloud-config"

    content = templatefile("${path.module}/template/cloud_init.tpl", {})
  }
}