terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-southeast-2"
}
# Red Hat Linux 9 (x86): ami-003cf7280eac7a28a
# Ubuntu 22.04 (x86):    ami-09a5c873bc79530d9
resource "aws_instance" "app_server" {
  ami           = "ami-09a5c873bc79530d9"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
