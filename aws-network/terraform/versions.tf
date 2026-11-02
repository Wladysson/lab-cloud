terraform {
  required_version = ">= 1.5.0" #define as configuraçoes gerais

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0" #define  a versao
    }
  }
}