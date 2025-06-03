variable "bucket_name" {
  description = "O nome do bucket S3 a ser criado"
  type        = string
}

variable "instance_ami" {
  description = "AMI da instância EC2"
  type        = string
  default     = "ami-0df368112825f8d8f" # Ubuntu 64bit AMI padrão
}

variable "instance_type" {
  description = "Tipo da instância EC2"
  type        = string
  default     = "t2.nano"
}

variable "key_name" {
  description = "Nome da chave SSH"
  type        = string
  default     = "psantos-keypair"
}

variable "security_group_name" {
  description = "Nome do security group"
  type        = string
  default     = "securitygroup01"
}

variable "user_data_script" {
  description = "Caminho para o script de user data"
  type        = string
  default     = "user_data.sh"
}
