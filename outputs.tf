# Outputs dos módulos
output "s3_bucket_id" {
  description = "ID do bucket S3"
  value       = module.s3_bucket.bucket_id
}

output "security_group_id" {
  description = "ID do security group"
  value       = module.security_group.id
}

output "instance_id" {
  description = "ID da instância EC2"
  value       = module.ec2_instance.instance_id
}

output "instance_public_ip" {
  description = "IP público da instância EC2"
  value       = module.ec2_instance.public_ip
}
