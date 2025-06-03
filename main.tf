terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

resource "aws_security_group" "securitygroup01" {
  name        = "securitygroup01"
  description = "Acesso SSH, HTTP, HTTPS e Internet"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH access"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP access"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTPS access"
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "keypair" {
  key_name   = "psantos-keypair"
  public_key = file("sshkeys/psantos.pub")
}

resource "aws_instance" "servidor01" {
  ami                    = "ami-0df368112825f8d8f"
  instance_type          = "t2.nano"
  user_data              = file("user_data.sh")
  key_name               = aws_key_pair.keypair.key_name
  vpc_security_group_ids = [aws_security_group.securitygroup01.id]
}
