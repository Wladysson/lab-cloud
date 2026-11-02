data "aws_ami" "amazon_linux_2" {# faz a consulta a AMI recente do amazon linux 2 que estiver disponivel
  most_recent = true
  owners      = ["amazon"]

  filter {#filtra as imagens compativeis com a maquina 
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "main" {# cria a instancia ec2 na subnet publica
  ami                         = data.aws_ami.amazon_linux_2.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.ec2.id]
  key_name                    = var.key_name
  associate_public_ip_address = true

  tags = merge(local.common_tags, {# e aplica a tag de identificaçao do projeto
    Name = "ec2-amazon-linux-lab"
  })
}