output "instance_id" {
  description = "ID of the EC2 instance"
  value = [for instance in aws_instance.sample_ec2: instance.id]
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value = toset([for instance in aws_instance.sample_ec2: instance.public_ip])
}

output "instance_public_dns" {
  description = "Public IP DNS of the EC2 instance"
  value = tomap({ for az, instance in aws_instance.sample_ec2: az => instance.public_dns})
}

# output "s3_arn" {
#   description = "S3 ARN"
#   value       = aws_s3_bucket.sample_s3_bucket.arn
# }