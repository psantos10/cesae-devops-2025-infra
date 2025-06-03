terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Módulo para o S3 Bucket
module "s3_bucket" {
  source      = "./modules/s3_bucket"
  bucket_name = var.bucket_name
}

# Módulo para o Security Group
module "security_group" {
  source      = "./modules/security_group"
  name        = var.security_group_name
  description = "Acesso SSH, HTTP, HTTPS e Internet"
}

# Módulo para a instância EC2
module "ec2_instance" {
  source            = "./modules/ec2_instance"
  instance_ami      = var.instance_ami
  instance_type     = var.instance_type
  security_group_id = module.security_group.id
  key_name          = var.key_name
  user_data_script  = var.user_data_script
}

