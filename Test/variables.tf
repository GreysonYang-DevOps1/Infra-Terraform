variable "region" {
  description = "Region Name"
  type        = string
  default     = "ap-southeast-2"
}

variable "environment_type" {
  description = "Environment Type Name"
  type        = string
  default     = "dev"
}

### EC2 ###

variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ExampleAppServerInstance"
}

variable "instance_type_map" {
  description = "EC2 instance type"
  type        = map(string)
  default     = {
    "dev" = "t2.micro"
    "qa" = "t2.micro"
    "staging" = "t2.small"
    "prod" = "t2.medium"
  }
}

variable "ami_type" {
  description = "AMI Type Name"
  type = string
  default = ""
}

variable "ami_id_map" {
  description = "AMI ID Map"
  type = map(string)
  default = {
    "" = ""
    "Amazon Linux X86" = "ami-06bb074d1e196d0d4"
    "RedHat X86" = "ami-003cf7280eac7a28a"
    "Ubuntu 20.04 X86" = "ami-055166f8a8041fbf1"
    "Debian 11 X86" = "ami-061cac5292ca5403c"
  }
}

variable "instance_keypair" {
  description = "AWS EC2 Key Pair"
  type = string
  default = "terraform-key"
}

## S3 ###

variable "s3_bucket_name" {
  description = "AWS S3 Bucket Name"
  type        = string
  default     = "sample-s3-bucket-greyson"
}

variable "s3_bucket_acl" {
  description = "AWS S3 Bucket ACL"
  type        = string
  default     = "private"
}