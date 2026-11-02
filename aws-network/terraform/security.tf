resource "aws_security_group" "ec2" {# cria o security group para contrlar o trafego da ec2
  name        = "sg-ec2-ssh-lab"
  description = "Permite SSH somente do IP autorizado"
  vpc_id      = aws_vpc.main.id

  ingress {#permite acesso somente ao endereço IP autorizado via SSH
    description = "SSH autorizado"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip_cidr]
  }

  egress {#permite o trafego de saida para a internet
    description = "Permite saidas para a internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags, {#tag de identificaçao do projeto
    Name = "sg-ec2-ssh-lab"
  })
}