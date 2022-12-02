provider "aws" {
  region = var.region
}

resource "aws_instance" "sample_ec2" {
  ami = coalesce(var.ami_id_map[var.ami_type], data.aws_ami.amzlinux2.id)
  instance_type = var.instance_type_map[var.environment_type]
  key_name = "terraform-ec2-key"
  user_data = file("${path.module}/helper/Ec2UserData/app1-install.sh")

  vpc_security_group_ids = [ 
    aws_security_group.vpc-ssh.id,
    aws_security_group.vpc-web.id
  ]

  for_each = toset(data.aws_availability_zones.my_azones.names)
  availability_zone = each.value

  tags = {
    Name        = "${var.instance_name}-${each.value}"
    Environment-Type = var.environment_type
  }
}

resource "aws_key_pair" "terraform_ec2_public_key" {
  key_name = "terraform-ec2-key"
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "local_file" "terraform_ec2_private_key" {
  content = tls_private_key.rsa.private_key_pem
  filename = "${path.module}/private-key/terraform-ec2-key-private"
  file_permission = "0400"
}

# resource "aws_s3_bucket" "sample_s3_bucket" {
#   bucket = var.s3_bucket_name

#   tags = {
#     Name        = var.s3_bucket_name
#     Environment-Type = var.environment_type
#   }
# }

# resource "aws_s3_bucket_acl" "example_bucket_acl" {
#   bucket = aws_s3_bucket.sample_s3_bucket.id
#   acl    = var.s3_bucket_acl
# }
