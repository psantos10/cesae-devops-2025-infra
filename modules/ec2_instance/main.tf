variable "instance_ami" {
  description = "AMI da instância EC2"
  type        = string
}

variable "instance_type" {
  description = "Tipo da instância EC2"
  type        = string
}

variable "security_group_id" {
  description = "ID do security group"
  type        = string
}

variable "key_name" {
  description = "Nome da chave SSH"
  type        = string
}

variable "user_data_script" {
  description = "Caminho para o script de user data"
  type        = string
}

resource "aws_key_pair" "this" {
  key_name   = var.key_name
  public_key = file("sshkeys/psantos.pub")
}

resource "aws_instance" "this" {
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  user_data              = file(var.user_data_script)
  key_name               = aws_key_pair.this.key_name
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = "servidor01"
  }
}

output "instance_id" {
  description = "ID da instância EC2"
  value       = aws_instance.this.id
}

output "public_ip" {
  description = "IP público da instância EC2"
  value       = aws_instance.this.public_ip
}
