# região da AWS onde os recursos serão provisionados
variable "aws_region" {
  description = "Região do provisionamento"
  type        = string
  default     = "us-east-1"
}

# nome utilizado para identificar os recursos
variable "project_name" {
  description = "Nome"
  type        = string
  default     = "aws-ec2-network-lab"
}

# Faixa de endereços IP da VPC
variable "vpc_cidr" {
  description = "Bloco CIDR da VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# faixa de endereços IP da subnet publica
variable "subnet_cidr" {
  description = "Bloco CIDR da subnet publica"
  type        = string
  default     = "10.0.1.0/24"
}

# endereço IPv4 publico autorizado a acessar a EC2 via SSH
variable "my_ip_cidr" {
  description = "IP publico autorizado a acessar a instância SSH"
  type        = string

  # garante que o endereço informado seja um IPv4 valido e utilize a mascara /32
  validation {
    condition     = can(cidrnetmask(var.my_ip_cidr)) && can(regex("/32$", var.my_ip_cidr))
    error_message = "Informe seu endereço IPv4 público no formato CIDR /32."
  }
}

# nome do par de chaves previamente criado na AWS
variable "key_name" {
  description = "Nome de um par de chaves EC2 previamente criado na AWS"
  type        = string
}