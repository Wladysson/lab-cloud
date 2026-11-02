resource "aws_vpc" "main" { #cria a vpc para servir como rede isolada
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(local.common_tags, {# aplicaçao da tag identificadora 
    Name = "vpc-lab"
  })
}

resource "aws_subnet" "public" {# cria a subnet publiva dentro da vpc
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = true

  tags = merge(local.common_tags, {
    Name = "subnet-public-lab"
    Type = "Public"
  })
}

resource "aws_internet_gateway" "main" {# cria o internet gateway pra comunicaçao com a intenrnet
  vpc_id = aws_vpc.main.id

  tags = merge(local.common_tags, {
    Name = "igw-lab"
  })
}

resource "aws_route_table" "public" {# cria  a tabela de rotas da subnet publica
  vpc_id = aws_vpc.main.id

  route {# direcionamento do trafego externo para o internet gateway
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = merge(local.common_tags, {
    Name = "rt-public-lab"
  })
}

resource "aws_route_table_association" "public" {# faz a associaçao a tabela de rotas a subnet publica
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}