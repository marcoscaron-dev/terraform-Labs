terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "sa-east-1" #  São Paulo
}

# CONFIGURAÇÃO REAL IMPORTADA DA AWS:
resource "aws_security_group" "sg_importado" {
  name        = "launch-wizard-1"
  description = "launch-wizard-1 created 2026-06-18T19:45:56.215Z"
  vpc_id      = "vpc-09813341584298ca9"

  # regra de entrada real (Porta 22 )
  ingress {
    cidr_blocks = ["177.63.224.143/32"]
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }

  # regra de saída real (Tudo liberado para a internet)
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
}
