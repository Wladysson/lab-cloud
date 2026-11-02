# lab-cloud

# AWS EC2 Network Lab (Trilha Alternativa - Terraform)

Repositório estruturado para a entrega da atividade prática do módulo intermediário do programa Capacita, utilizando **Infraestrutura como Código (IaC) com Terraform** em conformidade com a trilha alternativa autorizada devido a restrições de faturamento na conta AWS.

## Estruturação do Projeto

- `terraform/versions.tf`: Configuração das versões do provedor AWS.
- `terraform/provider.tf`: Definição da região e provedor.
- `terraform/variables.tf`: Parametrização da rede e instâncias.
- `terraform/networking.tf`: Criação da VPC, Sub-rede Pública, Internet Gateway e Tabela de Rotas.
- `terraform/security.tf`: Configuração do Security Group (Firewall) restrito à porta SSH (22).
- `terraform/ec2.tf`: Provisionamento do par de chaves e da instância EC2 (Amazon Linux 2023).
- `terraform/outputs.tf`: Exportação dos IDs e do comando pronto de conexão SSH.
- `terraform/terraform.tfvars`: Arquivo de variáveis locais com o IP de origem configurado.

## Como Executar

1. Inicialize os provedores do Terraform:
   ```bash
   cd terraform
   terraform init
