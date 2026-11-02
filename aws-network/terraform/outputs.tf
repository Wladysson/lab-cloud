output "vpc_id" {# exibe o ID da VPC criada
  description = "ID da VPC."
  value       = aws_vpc.main.id
}

output "public_subnet_id" {# exibe o id da subnet publica
  description = "ID da subnet"
  value       = aws_subnet.public.id
}

output "internet_gateway_id" {#exibe o id do internet gateway
  description = "ID do Internet"
  value       = aws_internet_gateway.main.id
}

output "security_group_id" {#exibe o id do security group relacionado a ec2
  description = "ID do Security Group."
  value       = aws_security_group.ec2.id
}

output "ec2_instance_id" {#exibe o id da instacia ec2 criada
  description = "ID da EC2."
  value       = aws_instance.main.id
}

output "ec2_public_ip" {#exibe o endereço ipv4 publico da instacia 
  description = "Endereço IPv4 da instacia"
  value       = aws_instance.main.public_ip
}

output "ssh_command" {#exibe o comando pra acessar a instacia
  description = "Comando para acessar a instância"
  value       = "ssh -i sua-chave.pem ec2-user@${aws_instance.main.public_ip}"
}